require 'rails_helper'

RSpec.describe Board, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:width) }
    it { should validate_numericality_of(:width).only_integer.is_greater_than(0) }
    it { should validate_presence_of(:height) }
    it { should validate_numericality_of(:height).only_integer.is_greater_than(0) }
    it { should validate_presence_of(:mines) }
    it { should validate_numericality_of(:mines).only_integer.is_greater_than(0) }
    it { should validate_presence_of(:name) }
  end
end
