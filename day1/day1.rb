def findTwoSum2020AndMultiply(array)
  array.each_with_index do |a, index|
    array.drop(index + 1).each do |b|
      return a * b if a + b == 2020
    end
  end
end

def findThreeSum2020AndMultiply(array)  
  array.each_with_index do |a, a_index|                     
    array.drop(a_index + 1).each_with_index do |b, b_index| 
      array.drop(a_index + 2 + b_index).each do |c|         
        return a * b * c if a + b + c == 2020
      end
    end
  end
end
