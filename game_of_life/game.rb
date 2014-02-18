class Game
  def initialize(cells)
    @cells = cells
    @y_length = cells.length
    @x_length = cells[0].length
    @next_tick_cells = init_cells
  end

  def tick
   @y_length.times do |i|
     @x_length.times do |j|
       if alive?(i, j) && (alive_neighbors_count(i, j) == 2 || alive_neighbors_count(i, j) == 3)
          set_alive!(i, j)
       end

       if !alive?(i, j) && alive_neighbors_count(i, j) == 3
          set_alive!(i, j)
       end
     end
   end

   @next_tick_cells
  end

  private
  def init_cells
   @y_length.times.map { [0] * @x_length }
  end

  def alive?(i, j)
    @cells[i][j] == 1
  end

  def set_alive!(i,j)
    @next_tick_cells[i][j] = 1
  end

  def alive_neighbors_count(i, j)
    neighbors = 0
    neighbors += 1 if up_cell_alive?(i, j)
    neighbors += 1 if down_cell_alive?(i, j)
    neighbors += 1 if left_cell_alive?(i, j)
    neighbors += 1 if right_cell_alive?(i, j)
    neighbors += 1 if left_down_cell_alive?(i, j)
    neighbors += 1 if left_up_cell_alive?(i, j)
    neighbors += 1 if right_up_cell_alive?(i, j)
    neighbors += 1 if right_down_cell_alive?(i, j)
    neighbors
  end

  def up_cell_alive?(i, j)
   i > 0 && alive?(i-1, j)
  end

  def down_cell_alive?(i, j)
   i < @y_length - 1 && alive?(i+1, j)
  end

  def left_cell_alive?(i, j)
   j > 0 && alive?(i, j-1)
  end

  def right_cell_alive?(i, j)
   j < @x_length - 1 && alive?(i, j+1)
  end

  def left_down_cell_alive?(i, j)
    i < @y_length - 1 && j > 0 && alive?(i+1, j-1)
  end

  def right_up_cell_alive?(i, j)
    j < @x_length - 1 && i > 0 && alive?(i-1, j+1)
  end

  def right_down_cell_alive?(i, j)
    j < @x_length - 1  && i < @y_length - 1 && alive?(i+1, j+1)
  end

  def left_up_cell_alive?(i, j)
    j > 0 && i > 0 && alive?(i-1, j-1)
  end

end
