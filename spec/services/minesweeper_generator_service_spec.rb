require 'rails_helper'

RSpec.describe MinesweeperGeneratorService, type: :service do
  describe '#initialize' do
    it 'initializes with width, height, and mines' do
      service = MinesweeperGeneratorService.new(5, 5, 5)
      expect(service.instance_variable_get(:@width)).to eq(5)
      expect(service.instance_variable_get(:@height)).to eq(5)
      expect(service.instance_variable_get(:@mines)).to eq(5)
    end
  end

  describe '#generate_board' do
    let(:service) { MinesweeperGeneratorService.new(5, 5, 5) }
    let(:board) { service.call }

    it 'returns a 2D array' do
      expect(board).to be_an(Array)
      expect(board.all? { |row| row.is_a?(Array) }).to be_truthy
    end

    it 'creates a board with correct dimensions' do
      expect(board.length).to eq(5)
      expect(board.all? { |row| row.length == 5 }).to be_truthy
    end
  end
end
