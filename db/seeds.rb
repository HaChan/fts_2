# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# . . .
User.create(name: "Example User",email: "example@framgia.com",
password: "123456", password_confirmation: "123456",)

User.create(name: "Nhat",email: "nhat@framgia.com",
password: "123456", password_confirmation: "123456",)

Admin.create(name: "Admin",email: "Admin@framgia.com",
password: "123456", password_confirmation: "123456",)


Examination.create(subject_id: 1, duration: 20, number_question: 30, datetime_exam: "2014-08-07", exam_type: 1)

Examination.create(subject_id: 2, duration: 20, number_question: 30, datetime_exam: "2014-09-07", exam_type: 0)

Subject.create(subject_name: "Mysql")
Subject.create(subject_name: "Git")

Question.create(subject_id: 1, subject_content: "Which of the following SQL statements 
selects the total number of orders from the Sales table?")

Question.create(subject_id: 1, subject_content: "How to push git")

ExaminationQuestion.create(examination_id: 1, question_id: 1)
ExaminationQuestion.create(examination_id: 2, question_id: 2)

TypeAnswer.create(answer_id: 1, answer_type: "Multi")
TypeAnswer.create(answer_id: 2, answer_type: "Single")
TypeAnswer.create(answer_id: 2, answer_type: "Text")

Answer.create(question_id: 1, answer_content: "abc", status: 1, type_answers_id: 1)
Answer.create(question_id: 2, answer_content: "abcd", status: 0, type_answers_id: 1)



Testing.create(examination_id: 1, user_id: 1, result: 1)
Testing.create(examination_id: 2, user_id: 2, result: 0)

TestingAnswer.create(answer_id: 1, testing_id: 1)
TestingAnswer.create(answer_id: 1, testing_id: 2)



