class PasswordValidator
  def self.number_of_valid(lines)
    valids = lines.map do |line|
      parts = line.delete(":").split(" ")
      min_and_max = parts.first.split("-").map(&:to_i)
      valid?(min_and_max.min, min_and_max.max, parts[1], parts.last) ? line : nil
    end
    
    valids.compact.length
  end

  def self.valid?(min, max, letter, password)
    hash = {}
    password.split("").each do |char|
      hash[char.to_sym] = hash[char.to_sym] ? (hash[char.to_sym] + 1) : 1
    end

    if hash[letter.to_sym].nil?
      false
    else
      hash[letter.to_sym] <= max && hash[letter.to_sym] >= min
    end
  end
end