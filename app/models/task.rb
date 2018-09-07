class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user, optional: true

  enum status: [:init, :in_progress, :completed, :deleted]
end
