class CreateUserAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_answers do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :exam, index: true, foreign_key: true
      t.belongs_to :alternative, index: true, foreign_key: true

      t.timestamps
    end
  end
end
