class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    projects = Project.all
    @names = projects.pluck(:name)

    @projects = projects.includes(:tasks).all
    @developers = User.developer.all
    @statuses = Task.statuses.keys

    [
      ['Task', 'Hours per Day'],
      ['Work',     11],
      ['Eat',      2],
      ['Commute',  2],
      ['Watch TV', 2],
      ['Sleep',    7]
    ]
  end
end
