class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :section_id
      t.string :alias
      t.string :name
      t.string :description
      t.text :content

      t.boolean :visible, default: true

      t.timestamps
    end

    add_index :pages, :section_id
  end
end
