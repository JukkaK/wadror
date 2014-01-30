class User < ActiveRecord::Base
  include RatingAverage

  has_secure_password

  validates :username, uniqueness: true,
            length: { minimum: 3 },
            length: { maximum: 15}

  validates :password, :format => {:with => /\A.*(?=.{4,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*\z/,
                                   message: "must contain at least one numeric, one lower- and one uppercase letter, mininum of 4 digits"}


  has_many :ratings   # käyttäjällä on monta ratingia
  has_many :beers, through: :ratings
end
