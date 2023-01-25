class ChangeSomeColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :exam_questions, :exams_id, :exam_id
    rename_column :exam_questions, :questions_id, :question_id
  end
end
