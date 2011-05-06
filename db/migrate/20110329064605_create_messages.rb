class CreateMessages < ActiveRecord::Migration

  def self.up

    create_table :messages do |t|

      t.text :message_text

      t.datetime :published_at

      t.integer :user_id

      t.integer :receiver_id


      t.timestamps

    end

  end


  def self.down

    drop_table :messages

  end

end
