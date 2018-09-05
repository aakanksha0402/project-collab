class Project < ApplicationRecord
  belongs_to :added_by

  has_many :projects_users
  has_many :users, through: :projects_users

  belongs_to :added_by, class_name: "User", foreign_key: :added_by_id

  enum status: [:init, :in_progress, :completed, :hold, :deleted]

  validates :name, :project_id, presence: :true
end
