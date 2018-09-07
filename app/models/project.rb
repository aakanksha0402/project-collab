class Project < ApplicationRecord
  belongs_to :added_by

  has_many :project_users
  has_many :users, through: :project_users
  has_many :tasks

  belongs_to :added_by, class_name: "User", foreign_key: :added_by_id

  enum status: [:init, :in_progress, :completed, :hold, :deleted]

  validates :name, :project_id, presence: :true

  # def self.totals_by_year_month
  #   find_by_sql(<<-SQL
  #     SELECT
  #       date_trunc('month', created_at) AS year_month,
  #       sum(amount) as amount
  #     FROM orders
  #     GROUP BY year_month
  #     ORDER BY year_month, amount
  #     SQL
  #   ).map do |row|
  #     [
  #       row['year_month'].strftime("%B %Y"),
  #       row.amount.to_f,
  #     ]
  #   end
  # end
end
