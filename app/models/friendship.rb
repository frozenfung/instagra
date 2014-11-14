class Friendship < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"

  VALID_STATUS = ["pending", "friend"]

  validates_inclusion_of :status, :in => VALID_STATUS

  def get_status(user)
    result = self.status
    if result == 'pending'
      if self.founder == user.id
        return 'deliver'
      else
        return 'reply'
      end
    else
      result
    end
  end

end

