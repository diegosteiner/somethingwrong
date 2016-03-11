class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems, id: :uuid do |t|
      t.uuid :app_id, index: true, null: false
      t.json :data
      t.string :source
      t.datetime :solved_at

      t.timestamps
    end
  end
end
