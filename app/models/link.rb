class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  def update_score
    #Have to set score to 0 each time it recalculates or the for loop would add (current score + 1) to the score
    self.score = 0
    for comment in self.comments
      self.score += comment.score
    end
    self.save
  end
end
