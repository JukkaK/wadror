class Brewery < ActiveRecord::Base
  include RatingAverage
  has_many :beers, :dependent => :destroy
  has_many :ratings, :through => :beers

  validates :name, presence: true
  validate :validate_year_format, :validate_start_year, :validate_end_year

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
    puts "number of ratings #{ratings.count}"
  end

  def restart
    self.year = 2014
    puts "changed year to #{year}"
  end

  def validate_year_format
    if !year.integer?
        errors.add(:year, "Year must be a 4-digit integer")
    end
  end

  def validate_end_year
    if year > Time.new.year
      errors.add(:year, "Year cannot be set higher than the current year")
    end
  end

  def validate_start_year
    if year < 1042
      errors.add(:year, "Year cannot be set lower than 1042")
    end
  end

end

