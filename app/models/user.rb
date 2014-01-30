class User < ActiveRecord::Base
  include RatingAverage

  has_secure_password

  validates :username, uniqueness: true,
            length: { minimum: 3 },
            length: { maximum: 15}

  has_many :ratings   # käyttäjällä on monta ratingia
  has_many :beers, through: :ratings
end
