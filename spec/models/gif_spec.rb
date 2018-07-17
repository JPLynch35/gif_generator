require 'rails_helper'

describe Gif, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:category_id)}
    it { should validate_presence_of(:gif_url)}
  end
  describe 'relationships' do
    it { should belong_to(:category)}
    it { should have_many(:favorites)}
    it { should have_many(:users).through(:favorites)}
  end
end
