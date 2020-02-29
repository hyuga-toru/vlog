class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :place
      t.datetime :start_time
      t.datetime :end_time
      t.text :content

      t.timestamps
    end
  end
end
