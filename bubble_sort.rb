def bubble_sort(numbers)
  numbers.each do
  index = 0
    while index < numbers.length - 1
      if numbers[index] > numbers[index + 1]
        numbers[index], numbers[index + 1] = numbers[index + 1], numbers[index]
      end
    index += 1
    end
  end 
end

def bubble_sort_by(elements)
  elements.each do
  index = 0
    while index < elements.length - 1
      result = yield(elements[index], elements[index + 1])
      if result > 0
        elements[index], elements[index + 1] = elements[index + 1], elements[index]
      end
    index += 1
    end
  end 
end 
  
