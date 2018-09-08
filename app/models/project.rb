class Project < ApplicationRecord

  enum status: [:init, :in_progress, :completed, :hold, :deleted]

  # Associations
  has_many :project_users
  has_many :users, through: :project_users
  has_many :tasks
  belongs_to :added_by, class_name: "User", foreign_key: :added_by_id

  # Validations
  validates :name, :project_id, presence: :true

end
