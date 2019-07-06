class Image
  def initialize (arr)
      @image = arr
  end
 
  def arr
    @image
  end

def output_image
  @image.each do |row|
  puts row.join
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])


image.output_image
end
