class Board < ApplicationRecord
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :width, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :height, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :mines, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :name, presence: true
  validate :mines_within_board_size

  scope :recent_boards, -> { order(created_at: :desc) }

  private

  def mines_within_board_size
    total_cells = width.to_i * height.to_i

    return unless mines.to_i > total_cells

    errors.add(:mines, 'Cannot be greater than the total number of cells on the board')
  end
end
