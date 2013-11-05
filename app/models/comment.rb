class Comment < ActiveRecord::Base
  belongs_to :link

  def vote_up
    self.score += 1
    self.save
  end

  after_save :update_link_score

  def update_link_score
    self.reload
    if self.link != nil 
      self.link.update_score
    end
  end
end
