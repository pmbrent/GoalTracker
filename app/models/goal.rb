class Goal < ActiveRecord::Base
  validates :user_id, :title, presence: true
  validates :completed, inclusion: { in: [true, false] }
  validates :private, inclusion: { in: [true, false] }

  belongs_to :user

  has_many(:comments,
    class_name: "GoalComment",
    foreign_key: :goal_id,
    primary_key: :id
    )

end
