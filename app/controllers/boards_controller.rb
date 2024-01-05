class BoardsController < ApplicationController
  ITEMS_PER_PAGE = 10

  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = filtered_boards.limit(10)
  end

  def all
    @pagy, @boards = pagy(filtered_boards, items: ITEMS_PER_PAGE)
  end

  def show; end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    return render :new, status: :unprocessable_entity unless @board.valid?

    minesweeper_generator = MinesweeperGeneratorService.new(@board.width, @board.height, @board.mines)
    @board.data = minesweeper_generator.call

    if @board.save
      redirect_to @board, notice: 'Board was successfully generated'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: 'Board was successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, status: :see_other
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def filtered_boards
    boards = Board.recent_boards

    if params[:name_cont].present?
      boards = boards.where('name ILIKE ?', "%#{params[:name_cont]}%")
    end

    if params[:email_cont].present?
      boards = boards.where('email ILIKE ?', "%#{params[:email_cont]}%")
    end

    boards
  end

  def board_params
    params.require(:board).permit(:name, :email, :width, :height, :mines)
  end
end
