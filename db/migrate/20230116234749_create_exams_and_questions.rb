class CreateExamsAndQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.belongs_to :topic, index: true, foreign_key: true
      t.string :name
      t.timestamps
    end

    create_table :topics do |t|
      t.string :name
      t.timestamps
    end

    create_table :questions do |t|
      t.belongs_to :topic, index: true, foreign_key: true
      t.text :statement
      t.timestamps
    end

    create_table :exam_questions, id: false do |t|
      t.belongs_to :exams, index:true, foreign_key: true
      t.belongs_to :questions, index:true, foreign_key: true
    end

    create_table :alternatives do |t|
      t.belongs_to :question, index:true, foreign_key: true
      t.text :statement
      t.boolean :value
      t.timestamps
    end

  end
end
