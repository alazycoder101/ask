# frozen_string_literal: true
# https://stlcc.edu/student-support/academic-success-and-tutoring/writing-center/writing-resources/topic-ideas.aspx

return unless Rails.env.development?

puts 'seeding questions answers......'

def all_users
  @user ||= User.all
end

def random_user
  all_users[(rand * 100) % all_users.count]
end

def add_question(title, body, user, topics=[])
  cnt = Question.where("title like '#{title}%'").count
  suffix = ''
  if cnt > 1
    suffix = (cnt + 1).to_s
  end
  Question.create(user: user, title: title + ' ' + suffix, body: body, topics: Topic.where(name: topics), views_count: (rand * 100).to_i)
end

def add_answer(question, body, user)
  question.answers << Answer.new(body: body, user_id: random_user.id)
end

questions = [
  'While testing stored procedures what are the steps does a tester takes?',
  'How would you know for database testing, whether trigger is fired or not?',
  'In data base testing, what are the steps to test data loading?',
  'Without using Database Checkpoints, how you test a SQL Query in QTP?',
  'To manage and manipulate the test table what are the SQL statements that you have used in Database testing?',
  'How to test database procedures and triggers?',
  'How you can write testcases from requirements and do the requirements represents exact functionality of AUT (Application Under Test)?',
  'What are DCL commands? What are the two types of commands used by DCL?',
  'What RDBMS stands for and what are the important RDMBS that SQL use?',
  'What is performance testing and what are the bottlenecks of performance testing?',
  'What is DDL and what are their commands?',
  'In database testing, what do we need to check normally?'
]

answers = [
  'RDBMS stands for Relational Database Management Systems that use SQL, and the important RDBMS that SQL uses are Sybase, Oracle, Access ,Ingres, Microsoft SQL server etc.',
  'To measure the system response, load testing is done. If the load exceeds the users pattern it is known as stress testing. Examples of load testing are downloading the set of large files, executing multiple applications on a single computer, subjecting a server to large number of e-mails and allotting many tasks to a printer one after another.',
  'Once the testing is done, QTP will generate a report. This report will show the checkpoints, system message and error that were detected while testing. The test results window will show any mismatches encountered at the checkpoints.',
  'DML stands for Data Manipulation Language, It is used to manage data with schema objects. It is a subset of SQL.',
  'To write a testcases from requirements, you need to analyse the requirements thoroughly in terms of functionality. Thereafter you think about the appropriate testcases design techniques like Equivalence partitioning, Black box design, Cause effect graphing etc. for writing the testcases.Yes, the requirements represent exact functionality of AUT.'
]

users = User.all

1.upto(40).each do |i|
  question = add_question(questions[i%questions.count], '', random_user, ['History'])
  1.upto(10).each do |j|
    add_answer(question, answers[j % answers.count], random_user)
  end
end

question = add_question('What is your favourite quote?', '', random_user)
1.upto(5) do
  add_answer(question, Faker::Quote.yoda, random_user)
end

question = add_question('What is your favourite movie?', '', random_user)
1.upto(5) do
  add_answer(question, Faker::Movie.title, random_user)
end

1.upto(20).each do |i|
  1.upto(10).each do |i|
    question.comments << Comment.new(comment: "Good question #{i}", user_id: random_user)
  end
end
