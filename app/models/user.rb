class User < ApplicationRecord
  validates_presence_of :password, :name
  validates_presence_of :email, uniqueness: true
  has_many :favorites
  has_many :gifs, through: :favorites

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user.password == password
      user
    else
      nil
    end
  end
end
