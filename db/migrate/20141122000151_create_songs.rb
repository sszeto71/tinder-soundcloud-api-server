class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :soundcloud_id
      t.string :genre
      t.string :song_url
      t.timestamps
    end
  end
end
