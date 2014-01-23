module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
    return ratings.inject(0) {|x,y| x+y.score}/ratings.count
  end

end