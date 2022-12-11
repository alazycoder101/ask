# frozen_string_literal: true
# https://stlcc.edu/student-support/academic-success-and-tutoring/writing-center/writing-resources/topic-ideas.aspx

def add_question(title, body, user, topics=[])
  Question.create(user: user, title: title, body: body, topics: Topic.where(name: topics))
end

if Rails.env.development?
  user1 = User.find_by_login('user1')
  1.upto(50).each do |i|
    add_question("question #{i}", 'How many years did the 100 years war last? ' * i, user1, ['History'])
  end

  User.all.each do |user|
    question = add_question("question from user #{user.id}", 'How many years did the 100 years war last? ' * user.id, user)
    User.all.each do |answer_user|
      question.answers << Answer.new(body: "116 years #{answer_user.id}", user_id: answer_user.id)
    end
  end

  User.all.each do |user|
    question = add_question('second', 'my first question', user1, ['History', 'Work', 'Food'])
    User.all.each do |answer_user|
      question.answers << Answer.new(body: "116 years #{answer_user.id}", user_id: answer_user.id)
    end
  end

  question = add_question('third', 'my first question', user1, ['History'])

  1.upto(20).each do |i|
    question.comments << Comment.new(comment: "Good question #{i}")
  end

  question = add_question('last', 'my first question', user1, ['History'])
end

