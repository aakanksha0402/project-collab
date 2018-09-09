module GetTasks
  extend ActiveSupport::Concern

  included do

    def get_tasks_by_status(status)
      self.tasks.send(status.to_sym)
    end
    
  end
end
