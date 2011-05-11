module VideosHelper
  
  def video_button_text(video)
    return video.id.nil? ? "Add Video" : "Edit Video"
  end
  
end
