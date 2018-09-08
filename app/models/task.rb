class Task < ApplicationRecord

  enum status: [:init, :in_progress, :completed, :deleted]

  # Validations
  belongs_to :project
  belongs_to :user, optional: true

  # Associations
  validates :name, :description, presence: true
end
