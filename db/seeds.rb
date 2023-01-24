# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


ActiveRecord::Base.transaction do

  #Populate User table
  25.times do |i|
    name = Faker::Sports::Basketball.unique.player
    email = Faker::Internet.email(name: name, domain: 'nba.com')
    is_adm = false
    if(i%2 == 0)
      is_adm = true
    end
    password = "123456"
    User.create!(
      name: name, 
      email:email, 
      password: password,
      admin: is_adm
    )
  end

  #Populate Topics table
  topics = Topic.create!([
    {name: "Mathematics"}, 
    {name: "History"}, 
    {name: "Physics"},
    {name: "Chemistry"},
    {name: "Portuguese"},
    {name: "English"}
  ])

  #Populate Exams table
  exams = Array.new()
  5.times do |i|
    exam = Exam.create!(name: "Prova 1", topic_id: i+1)
    exams.push(exam.id)
  end

  #Populate Questions, Alternatives
  questions = Array.new()
  30.times do |i|
    question = Question.create!(
      statement:"What is the result of #{i} + #{i}?", 
      topic_id: rand(1..6) 
    )
    questions.push(question.id)

    4.times do |j|
      if(j == 2)
        alternative = Alternative.create!(
          question_id: question.id,
          statement: "#{j*i}",
          value: true
        )
      else
        alternative = Alternative.create!(
          question_id: question.id,
          statement: "#{j*i}",
          value: false
        )
      end
    end
  end

  #Associate exams and questions
  qid = 1
  exams.each do |e|
    5.times do |j|      
      ExamsQuestions.create!(
        exam_id: e, 
        question_id: questions[qid]
        )
      qid+= 1
    end
  end

  #Associate exams and questions
  question_index = 1
  exams.each do |e|
    5.times do |j|      
      ExamsQuestions.create!(
        exam_id: e, 
        question_id: questions[question_index]
        )
      question_index += 1
    end
  end

  #Add User Answers to some tests
  test_takers = Set.new()
  10.times do |i|
    test_takers.add(rand(1...25))
  end

  exams.each do |e|
    test_takers.each do |t|
      Participant.create!(user_id: t, exam_id: e)
      question_list = ExamsQuestions.where(exam_id: e)
      question_list.each do |q|     
        alts = Alternative.where(question_id: q.question_id).order('random()')
        UserAnswer.create!(
          user_id: t,
          exam_id: e,
          alternative_id: alts[0].id
        )
      end
    end
  end
end

                        
