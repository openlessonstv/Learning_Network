class CreateAltvideos < ActiveRecord::Migration
  def self.up
    create_table :altvideos do |t|
      t.integer :video_id
      t.integer :alt_video_id

      t.timestamps
    end
  end

  def self.down
    drop_table :altvideos
  end
end
