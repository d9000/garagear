class AddAttachmentAvatarToVehs < ActiveRecord::Migration
  def self.up
    change_table :vehs do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :vehs, :avatar
  end
end
