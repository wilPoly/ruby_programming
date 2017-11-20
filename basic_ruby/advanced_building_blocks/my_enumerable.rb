module Enumerable

  def my_each
    for i in 0...self.length do
      yield self[i]
    end
  end

end

array = (0..5).to_a
array.my_each {|i| puts i}