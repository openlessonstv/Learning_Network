class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :videos, :dependent => :destroy

  def next
    course.lessons.each do |l|
      if l.id > self.id
        return l
        break
      end
    end
    return nil
  end
  
  def number
      x=1
      course.lessons.each do |lesson|
        if lesson.id == self.id
          return x
          break
        else 
          x +=1
        end
      end
      return nil
    end

  def previous
    course.lessons.order('id desc').each do |l|
      if l.id < self.id
        return l
        break
      end
    end
    return nil
  end
end
