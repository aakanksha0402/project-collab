class Task < ApplicationRecord
  include Status

  # Validations
  belongs_to :project
  belongs_to :user, optional: true

  # Associations
  validates :name, :description, presence: true
end
