require 'rails_helper'

describe User, type: :model do
  it { should have_many(:favorites)}
  it { should have_many(:gifs).through(:favorites)}
end
