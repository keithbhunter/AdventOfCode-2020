def first_number_thingy(file, preamble)
  numbers = File.read(file).split("\n").map(&:to_i)

  numbers.drop(preamble).each_with_index do |number, index|
    has_sum = false
    perms = numbers.slice(index, preamble).permutation(2).to_a
    perms.each do |perm|
      has_sum = perm.first + perm.last == number
      break if has_sum
    end
    return number if !has_sum
  end

  raise
end

def contiguous_number_sum(file, num)
  numbers = File.read(file).split("\n").map(&:to_i)
  start = 0

  while start < numbers.length do
    offset = 1

    while start + offset < numbers.length do
      range = numbers.slice(start, offset)
      sum = range.reduce(0, :+)
      return range if sum == num
      offset += 1
    end

    start += 1
  end

  raise
end
