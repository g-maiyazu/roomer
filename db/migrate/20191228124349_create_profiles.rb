class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.integer :job
      t.string :address
      t.integer :living_style
      t.integer :floor_plan
      t.string :floor_width
      t.string :web_site
      t.text :introduction
      t.integer :user_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
