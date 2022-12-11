# frozen_string_literal: true
# https://stlcc.edu/student-support/academic-success-and-tutoring/writing-center/writing-resources/topic-ideas.aspx

def add_question(title, body, user, topics)
  Question.create(user: user, title: title, body: body, topics: Topic.where(name: topics))
end

if Rails.env.development?
  user1 = User.find_by_login('user1')
  add_question('first', 'my first question', user1, ['History'])
  add_question('second', 'my first question', user1, ['History', 'Demo'])
  add_question('third', 'my first question', user1, ['History'])
  add_question('last', 'my first question', user1, ['History'])
end

