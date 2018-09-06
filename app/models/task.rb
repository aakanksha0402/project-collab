class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum status: [:init, :in_progress, :completed, :deleted]
end
