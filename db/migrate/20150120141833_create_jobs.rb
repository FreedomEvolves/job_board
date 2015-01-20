class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :category
      t.string :city
      t.text :description
      t.text :perks
      t.text :how_to_apply
      t.string :company_name
      t.string :url
      t.boolean :is_featured

      t.timestamps null: false
    end
  end
end
