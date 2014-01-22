class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings

  def average_rating
    #return ratings.average('score')
    return ratings.inject(0) {|x,y| x+y.score}/ratings.count

  end

end
