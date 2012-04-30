class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :short_description
      t.string :long_description
      t.string :alias
      t.integer :category
      t.integer :created_by
      t.boolean :front_page
      t.string :tags

      t.timestamps
    end
  end
end
