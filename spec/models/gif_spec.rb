require 'rails_helper'

describe Gif, type: :model do
  it { should belong_to(:categories)}
  it { should have_many(:favorites)}
  it { should have_many(:users).through(:favorites)}
end
