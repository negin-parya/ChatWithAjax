class AddRecieverIdToMessages < ActiveRecord::Migration

  def self.up

    add_column :messages, :receiver_id, :integer

  end


  def self.down


   remove_column :messages, :receiver_id
  end

end
