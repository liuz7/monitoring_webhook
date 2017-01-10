class CreateApp < ActiveRecord::Migration[5.0]
  def change
    create_table :apps do |t|
      t.string :url
      t.integer :pub_id, :limit => 8
      t.string :client_id
      t.string :client_secret
      t.timestamps
    end
  end
end
