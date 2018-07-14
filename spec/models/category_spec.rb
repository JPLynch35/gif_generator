require 'rails_helper'

describe Category, type: :model do
  it { should have_many(:gifs)}
end
