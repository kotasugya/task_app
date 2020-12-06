class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start_day
      t.datetime :finish_day
      t.string :time
      t.string :schedule_memo

      t.timestamps
    end
  end
end
