require 'rails_helper'

RSpec.describe BoardsController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get boards_path
      expect(response).to be_successful
    end

    it 'assigns recent boards to @boards' do
      boards = create_list(:board, 10)
      get boards_path
      expect(assigns(:boards)).to eq(boards.reverse)
    end
  end

  describe 'GET #all' do
    it 'returns a successful response' do
      get all_path
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get new_board_path
      expect(response).to be_successful
    end

    it 'assigns a new board to @board' do
      get new_board_path
      expect(assigns(:board)).to be_a_new(Board)
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      board = create(:board)
      get edit_board_path(board)
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    let(:board) { create(:board) }
    let(:valid_params) { attributes_for(:board, name: 'Updated Name') }

    context 'with valid params' do
      it 'updates the board' do
        put board_path(board), params: { board: valid_params }
        board.reload
        expect(board.name).to eq('Updated Name')
      end

      it 'redirects to the updated board' do
        put board_path(board), params: { board: valid_params }
        expect(response).to redirect_to(board_path(board))
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { attributes_for(:board, width: nil) }

      it 'does not update the board' do
        put board_path(board), params: { board: invalid_params }
        board.reload
        expect(board.name).not_to eq(nil)
      end

      it 'renders the edit template' do
        put board_path(board), params: { board: invalid_params }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the board' do
      board = create(:board)
      expect do
        delete board_path(board)
      end.to change(Board, :count).by(-1)
    end

    it 'redirects to the boards index' do
      board = create(:board)
      delete board_path(board)
      expect(response).to redirect_to(boards_path)
    end
  end

  describe 'POST #create' do
    let(:valid_params) { attributes_for(:board) }

    context 'with valid params' do
      it 'creates a new board' do
        expect do
          post boards_path, params: { board: valid_params }
        end.to change(Board, :count).by(1)
      end

      it 'redirects to the created board' do
        post boards_path, params: { board: valid_params }
        expect(response).to redirect_to(board_path(Board.last))
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { attributes_for(:board, width: nil) }

      it 'does not create a new board' do
        expect do
          post boards_path, params: { board: invalid_params }
        end.to_not change(Board, :count)
      end

      it 'renders the new template' do
        post boards_path, params: { board: invalid_params }
        expect(response).to render_template(:new)
      end
    end
  end
end
