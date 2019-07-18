class Image

  def initialize(array)
    @image = array
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur!(distance=1)    
    distance.times do
      blur_coords!
    end
  end

  private

    def blur_coords!
      coords_to_blur = [] 
      @image.each_with_index do |row, row_index|
        # [0, 0, 0, 0, 0, 0]
        row.each_with_index do |column, column_index|
          # 0
          if column == 1
            # above
            coords_to_blur << [row_index - 1, column_index]
            # below
            coords_to_blur << [row_index + 1, column_index]
            # left
            coords_to_blur << [row_index, column_index - 1]
            # right
            coords_to_blur << [row_index, column_index + 1]
          end
        end
      end
      # convert 0s to 1s
      # [[0, 1], [2, 1], [1, 0], [1, 2]]
      coords_to_blur.each do |coord_to_blur|
        # @image[0][2] = 1
        # coord_to_blur == [0, 1] [row_index, column_index]
        row_index = coord_to_blur[0]
        column_index = coord_to_blur[1]
        @image[row_index][column_index] = 1
      end
      #puts @image.to_s

    end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]
])
image.output_image
puts "--------"
image.blur!(2)
image.output_image