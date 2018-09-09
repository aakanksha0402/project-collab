require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'users' do
    context '#index' do
      it 'should get all developer users' do
        login_project_manager
        expect { get :index }
        expect(response).to be_successful
      end
    end
  end
end
