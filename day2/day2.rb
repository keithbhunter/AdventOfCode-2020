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
    min -= 1
    max -= 1
    (password[min] == letter) ^ (password[max] == letter)
  end
end