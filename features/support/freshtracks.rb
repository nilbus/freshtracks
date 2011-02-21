# course should be like: csc 316 or ENG101
def expand_course(course)
  course = course.upcase.gsub ' ', ''
  page.find(".#{course} .expander img").click
end
