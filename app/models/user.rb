class User < ApplicationRecord

  include GetTasks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[project_manager developer]

  # Associations
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :added_projects, class_name: "Project", foreign_key: "added_by_id"
  has_many :tasks

  # Validations
  validates :email, presence: {message: "cannot be blank."}
  validates :role, presence: true

  def active_for_authentication?
      super and self.is_active?
  end

  def inactive_message
    "You are not allowed to log in till the account is approved."
  end
end
