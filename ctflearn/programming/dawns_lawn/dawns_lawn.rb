#- [Dawns Lawn](https://ctflearn.com/problems/434)
# 
# There is a description of the problem in *dawn.txt*

# First, we need to set up the mowing loop

# Then, we need to set up the data structure of the lawn
# and the ability to update it

# Flag is: 194

class Lawn
  attr_accessor :lawn, :cells_left

  GROWTH_STAGE = [
    ".", # infertile dirt (cannot grow)
    "_", # fertile dirt
    "\\", # grass 1
    "-", # grass 2
    "/", # grass 3
    "|", # grass 4
    "*" # flower
  ]

  def initialize
    lines = File.open(__dir__ + "/dawn2.txt").readlines
    lawn_grid = lines.map{|l| l.strip.chars}

    lawn_grid_dummy = [
      ['*','-','*'],
      ['_','|','.'],
      ['/',"\\",'/']
    ]

    # convert symbols to growth stage values
    @lawn = lawn_grid.map do |row|
      row.map do |col|
        GROWTH_STAGE.index(col)
      end
    end

    @cells_left = lawn.length ** 2
  end

  # mow() - loop to mow the entire lawn grid
  # start in top left(0,0), mow down the first column,
  # move right, mow up, then down, repeating until (n,n)
  def mow_lawn
    grid_size = lawn.length
    (0...grid_size).each do |col|
      # start from bottom if odd col, otherwise top
      rows = col.odd? ? (grid_size - 1).downto(0) : (0...grid_size) 
      rows.each do |row|
        mow_cell(row, col)
      end
    end
  end

  # We can immediately calculate what the mowed cell will 
  # end up as based off the cells left in the grid
  def mow_cell(row, col)
    # cut cell back two stages
    lawn[row][col] -= 2
    lawn[row][col] = 0 if lawn[row][col] < 0

    # grow as if the lawn has been completely mowed
    growth_rate = lawn.length

    unless lawn[row][col] == 0 # infertile can't grow
      lawn[row][col] += cells_left / growth_rate
    end
    lawn[row][col] = 6 if lawn[row][col] > 6 # can't grow more than a flower

    @cells_left -= 1
  end

  # count how many cells have reach growth stage 6
  def count_flowers
    lawn.inject(0) do |count, row|
      count + row.select{|col| col == 6}.count
    end
  end

  def print
    lawn_s = lawn.each_with_index do |row,i|
      puts "#{i},#{row.index(nil)}" if row.any?(&:nil?)
      puts row.map{|col| GROWTH_STAGE[col]}.join
    end

    puts "\nNumber of Flowers: #{count_flowers}"
  end
end

l = Lawn.new
l.mow_lawn
l.print
