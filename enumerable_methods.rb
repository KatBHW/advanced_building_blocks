module Enumerable
  
  def my_each
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
  end
  
  def my_each_with_index
    i = 0
    while i < self.length
      yield self[i], i
      i +=1
    end
  end

  def my_select
    results = []
    self.my_each do |element|
      if yield(element)
      results << element    
      end
    end
    results 
  end  

  def my_all?
    result = true
    self.my_each do |element|
      unless yield(element)
        result = false   
      end
    end
    result
  end
  
  def my_any?
    result = false
    self.my_each do |element|
      if yield(element)
        result = true   
      end
    end
    result
  end
  
  def my_none?
    result = true
    self.my_each do |element|
      if yield(element)
        result = false   
      end
    end
    result
  end
  
  def my_count
    counter = 0
    self.my_each do |element|
      counter += 1
    end
    counter
  end
  
  def my_map
    results = []
    self.my_each do |element|
      results << yield(element)    
    end
    results 
  end  

  def my_inject(index=0)
    accumulator = self[index]
    self.my_each do |element|
      if element == self[index]
        accumulator = accumulator
      else
        accumulator = yield(accumulator, element)
      end
    end
    accumulator
  end
  
  def multiply_els
    self.my_inject {|accumulator, element| accumulator * element}
  end
  
  def my_map_with_proc(&my_proc)
    results = []
    self.my_each do |element|
      results << my_proc.call(element)    
    end
    results 
  end  
	
  def my_map_with_proc_or_block(my_proc=nil)
    results = []
    if my_proc && block_given?
      self.my_each do |element|
        results << my_proc.call(yield(element))
      end
    elsif my_proc && !block_given?
      self.my_each do |element|
        results << my_proc.call(element)    
      end
    else  
      self.my_each do |element|
        results << yield(element)
      end
    end
    results 
  end 
  
end  
  

