class CalcGradesJob < ApplicationJob
  queue_as :default

  def perform(eid, uid) #exam_id, user_id
    # Do something later
    participant = Participant.find_by(user_id: uid, exam_id: eid)
    num_questions = ExamQuestion.where(exam_id: eid).count

    answers = UserAnswer.where(user_id: uid, exam_id: eid)

    num_correct = 0
    answers.each do |a|
      alt = Alternative.find(a.alternative_id)
      if (alt.value == true)
        num_correct += 0
      end
    end

    participant.update(grade: g)

  end
end
