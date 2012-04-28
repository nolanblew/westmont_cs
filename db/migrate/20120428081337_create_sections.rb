class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :alias
      t.string :description
      t.string :home

      t.string :visible, default: true

      t.timestamps
    end
  end
end
