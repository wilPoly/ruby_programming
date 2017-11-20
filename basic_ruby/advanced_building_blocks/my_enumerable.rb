module Enumerable

  def my_each
     if block_given?
      case self.class
      when Hash
        0.upto(self.length-1) do |k, v|
          yield (k, self[k])
        end
      when Array || Range
        0.upto(self.length-1) do |i|
          yield self[i]
        end
      when Range
        0.upto(self.to_a.length-1)

      0.upto(self.length-1) do |i|
        yield self[i]
      end
    else
      self.to_enum :my_each
    end
  end

end

array = (0..5).to_a
array.my_each {|i| puts i}