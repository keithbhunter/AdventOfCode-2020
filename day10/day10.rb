def chain_differences(file)
  chain = File.read(file).split("\n").map(&:to_i).sort
  chain.unshift(0)

  diffs = {}
  chain.each_with_index do |jolt, index|
    next unless index < chain.length - 1
    diff = chain[index+1] - jolt
    diffs[diff] = diffs[diff] ? diffs[diff] + 1 : 1
  end

  diffs[3] = diffs[3] ? diffs[3] + 1 : 1
  diffs
end