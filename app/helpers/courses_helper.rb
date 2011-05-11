module CoursesHelper

  def lesson_link_text
    return (signed_in? && current_user.is_admin?) ? "Edit Lessons" : "Lessons"
  end
  
end
