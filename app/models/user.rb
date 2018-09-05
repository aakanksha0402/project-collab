class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :project_users
  has_many :projects, through: :project_users
  has_many :added_projects, class_name: "Project", foreign_key: "added_by_id"

  enum role: %i[project_manager developer]

  validates :role, presence: true

end
