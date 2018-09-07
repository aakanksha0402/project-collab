class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    if user.project_manager?
      # can :manage, :all
      # cannot :edit, Project do |project|
      #   project.deleted?
      # end

      can :manage, Project
      can :add_resource, Project
      can [:read, :edit, :create, :delete, :change_status], Task, project: {added_by: user}
      can :all_tasks, Task
      can :read, User
    elsif user.developer?
      can :read, Project
      cannot :update, Project
      cannot :delete, Project
      can [:create, :read], Task, project: {project_users: {user_id: user.id}}
      can [:update, :delete, :change_status], Task, user_id: user.id
    end
  end
end
