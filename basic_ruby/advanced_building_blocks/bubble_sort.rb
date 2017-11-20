def bubble_sort(array)
  swap_flag = true
  array_size = array.length
  until swap_flag == false do
    swap_flag = false
    for i in 1...array_size
      if array[i-1] > array[i]
        array[i], array[i-1] = array[i-1], array[i]
        swap_flag = true
      end
    end
    array_size -= 1
  end
  p array
end

def bubble_sort_by(array)
  swap_flag = true
  array_size = array.length
  until swap_flag == false do
    swap_flag = false
    for i in 1...array_size
      if yield(array[i-1], array[i]) > 0
        array[i], array[i-1] = array[i-1], array[i]
        swap_flag = true
      end
    end
    array_size -= 1
  end
  p array
end


bubble_sort([4,3,78,2,0,2])


bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end