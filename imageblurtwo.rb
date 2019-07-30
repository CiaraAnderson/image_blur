class Image

  def initialize(array)
    @image = array
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end



    def blur_coords!
      coords_to_blur = [] 
      @image.each_with_index do |row, row_index|
        # [0, 0, 0, 0, 0, 0]
        row.each_with_index do |column, column_index|
          # 0
          if column == 1
            # above
#            unless row_index == 0
#              coords_to_blur << [row_index - 1, column_index]
#            end

            coords_to_blur << [row_index - 1, column_index] unless row_index == 0
            # below
            unless row_index >= @image.length - 1
              coords_to_blur << [row_index + 1, column_index]
            end
            # left
            unless column_index == 0
              coords_to_blur << [row_index, column_index - 1]
            end
            # right
            unless column_index >= row.length - 1
              coords_to_blur << [row_index, column_index + 1]
            end
          end
        end
      end
      # convert 0s to 1s
      # [[0, 1], [2, 1], [1, 0], [1, 2]]
      puts coords_to_blur.to_s
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
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0]
])
image.output_image
puts "--------"
image.blur_coords!
image.output_image