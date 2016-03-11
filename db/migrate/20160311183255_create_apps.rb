class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps, id: :uuid do |t|
      t.string :name
      t.boolean :ok

      t.timestamps
    end
  end
end
