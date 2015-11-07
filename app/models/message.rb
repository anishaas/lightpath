class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => 'Student', :foreign_key => 'sender_id'
  belongs_to :receiver, :class_name => 'Student', :foreign_key => 'receiver_id'
end

#Instead of relationship, belong_to student switching foreign keys
