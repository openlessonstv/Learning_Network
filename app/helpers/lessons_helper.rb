module LessonsHelper
  def edit_video_link_text(lesson)
    return "Edit Videos (#{lesson.videos.length})"
  end

  def lesson_button_text(lesson)
    return lesson.id.nil? ? "Add Lesson" : "Edit Lesson"
  end
end
