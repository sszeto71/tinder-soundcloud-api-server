class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :soundcloud_id
      t.timestamps
    end
  end
end
