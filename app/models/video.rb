class Video < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :user
  
  default_scope :order => 'popularity desc'

  def url
    return "http://www.youtube.com/v/#{youtube_id}"
  end

  def thumbnail_url
    return "http://img.youtube.com/vi/#{youtube_id}/1.jpg"
  end

  def voteup
    self.popularity = popularity + 1
    save
  end

  def votedown
    if popularity > 0
      self.popularity = popularity - 1
      save
    end
  end
end
