def findSum2020AndMultiply(array)
  array.each_with_index do |a, index|
    array.drop(index).each do |b|
      if a + b == 2020
        return a * b
      end
    end
  end
end
