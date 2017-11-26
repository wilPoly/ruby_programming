module Enumerable

  def my_each
    if block_given?
      for i in self
        yield i
      end
    else
      self.to_enum :my_each
    end
  end

  def my_each_with_index
    if block_given?
      for i in 0...self.length
        yield(self[i], i)
      end
    else
      self.to_enum :my_each_with_index
    end
  end

  def my_select
    if block_given?
      if self.class == Array
        result = []
        self.my_each do |i|
          result << i if yield i
        end
        result
      elsif self.class == Hash
        result = {}
        self.my_each do |k, v|
          if yield(k, v)
            result[k] = v
          end
        end
        result
      end
    else
      self.to_enum :my_select
    end
  end
  
  def my_all?
    result = true
    if block_given?
      if self.class == Hash
        self.my_each {|k, v| result = false unless yield(k, v)}
        result
      elsif self.class == Array
        self.my_each {|i| result = false unless yield i}
        result
      end
    else
      self.my_all? {|obj| obj}
    end
  end

  def my_any?
    result = false
    if block_given?
      if self.class == Hash
        self.my_each {|k, v| result = true if yield(k, v)}
        result
      elsif self.class == Array
        self.my_each {|i| result = true if yield i}
        result
      end
    else
      self.my_any? {|obj| obj}
    end
  end
end