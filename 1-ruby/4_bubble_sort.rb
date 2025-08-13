def bubble_sort(array)
    for i in 0..array.size
        for j in i...array.size
            if array[i] > array[j]
                array[i], array[j] = array[j], array[i]
            end
        end
    end
    array
end

puts bubble_sort([4,3,78,2,0,2])