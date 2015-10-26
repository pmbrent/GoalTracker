class UserComment < ActiveRecord::Base

  belongs_to(:author,
  class_name: 'User',
  foreign_key: :author_id,
  primary_key: :id)

  belongs_to(:profile,
  class_name: "User",
  foreign_key: :profile_id,
  primary_key: :id)

end
