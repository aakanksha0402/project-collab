module Status
  extend ActiveSupport::Concern

  included do

    enum status: [:init, :in_progress, :completed, :hold, :deleted]

  end
end
