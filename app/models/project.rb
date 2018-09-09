class Project < ApplicationRecord

  include GetTasks, Status

  # Associations
  has_many :project_users
  has_many :users, through: :project_users
  has_many :tasks
  belongs_to :added_by, class_name: "User", foreign_key: :added_by_id

  # Validations
  validates :name, :project_id, presence: :true

  # before_save :check_status

  def generate_project_id
    "#{get_random_string}-#{get_random_number}"
  end

  def prepare_data
    data = [['Task', 'Hours per Day']]
    tasks.group_by(&:status).map {|key, value| data << [key.humanize, value.count]}
    data
  end

  protected

  def check_status
    if self.deleted?
      errors.add(:base, "This project has been deleted and cannot be edited now")
      throw(:abort)
    else
      true
    end
  end

  def get_random_string
    SecureRandom.hex.chars.first(5).join()
  end

  def get_random_number
    SecureRandom.random_number(10000)
  end

end
