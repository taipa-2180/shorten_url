class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :code

      t.timestamps
    end

    add_index :urls, :code, unique: true
  end
end
