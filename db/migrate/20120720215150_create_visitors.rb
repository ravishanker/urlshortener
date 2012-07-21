class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :ip
      t.string :location
      t.references :url

      t.timestamps
    end
    add_index :visitors, :url_id
  end
end
