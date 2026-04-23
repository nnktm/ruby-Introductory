def calc(nums)
    sum = 0
    for i in nums
        sum += i
        puts "sum: " + sum.to_s
    end
    return sum  
end

array = [1, 2, 3, 4, 5]

puts calc(array)