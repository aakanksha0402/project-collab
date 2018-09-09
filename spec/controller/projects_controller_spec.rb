require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe 'projects' do
    context '#index' do
      it 'should get all projects' do
        login_project_manager
        expect { get :index }
        expect(response).to be_successful
      end
    end

    context '#create' do
      it 'to create new project' do
        login_project_manager
        expect { post :create, params: { project: FactoryGirl.attributes_for(:project_1) } }
        expect(response).to be_successful
      end
    end

    context '#update' do
      it 'to update project' do
        login_project_manager
        project = FactoryGirl.create(:project_1)
        expect { post :update, params: { id: project.id, project: {status: :in_progress} } }
        expect(response).to be_successful
      end
    end

    context '#delete' do
      it 'to delete project' do
        login_project_manager
        project = FactoryGirl.create(:project_1)
        expect { put :delete, params: { id: project.id } }        
        expect(response).to be_successful
      end
    end
  end
end
