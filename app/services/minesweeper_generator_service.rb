class MinesweeperGeneratorService < ApplicationService
  attr_reader :width, :height, :mines, :board

  def initialize(width, height, mines)
    @width = width
    @height = height
    @mines = mines
    @board = initialize_board
  end

  def call
    plant_mines
    calculate_numbers
    @board
  end

  private

  def initialize_board
    Array.new(@height.to_i) { Array.new(@width.to_i, { revealed: false, mine: false, number: 0 }) }
  end

  def plant_mines
    mine_positions = (0...@mines).map { [rand(@height), rand(@width)] }.uniq

    mine_positions.each do |row, col|
      @board[row][col][:mine] = true
    end
  end

  def calculate_numbers
    (0...@height).each do |row|
      (0...@width).each do |col|
        next if @board[row][col][:mine]

        @board[row][col][:number] = count_adjacent_mines(row, col)
      end
    end
  end

  def count_adjacent_mines(row, col)
    mine_count = 0

    (-1..1).each do |r_offset|
      (-1..1).each do |c_offset|
        next if r_offset.zero? && c_offset.zero?

        r = row + r_offset
        c = col + c_offset
        mine_count += 1 if valid_position?(r, c) && @board[r][c][:mine]
      end
    end
    mine_count
  end

  def valid_position?(row, col)
    row.between?(0, @height - 1) && col.between?(0, @width - 1)
  end
end
