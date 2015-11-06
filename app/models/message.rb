class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => 'LightbulbShare', :foreign_key => 'sender_id'
  belongs_to :receiver, :class_name => 'LightbulbShare', :foreign_key => 'receiver_id'
end

class Relationship < ActiveRecord::Base
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'receiver_id'
end
