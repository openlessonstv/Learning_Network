class Video < ActiveRecord::Base
  belongs_to :lesson
  default_scope :order => 'popularity desc'

  def url
    return "http://www.youtube.com/v/#{youtube_id}"
  end

  def thumbnail_url
    return "http://img.youtube.com/vi/#{youtube_id}/1.jpg"
  end
end
