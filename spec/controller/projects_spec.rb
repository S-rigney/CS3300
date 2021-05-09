require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
  context "GET #index" do
    it "returns a success response" do
      get :index
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  context "GET #show" do
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      get :show, params: { id: project }
      expect(response).to be_success
    end
  end

  context "GET #new" do
    login_student
    it "returns a success response" do
      get :new
      # expect(response.success).to eq(true)
      expect(response).to be_success
    end
  end

  context "POST #create" do
    login_student
    it "returns a success response" do
      post :create, :params => {:project => {:title => 'This is a title', :description => 'This is a description'}}
      expect(Project.count).to equal(1)
    end
  end

  context "PATCH #update" do
    login_student
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      patch :update, :params => {:id => project, :project => {:title => 'This is a title', :description => 'This is a description'}}
      expect(Project.first.description).to eq 'This is a description'
    end
  end

  context "DELETE #destroy" do
    login_student
    let!(:project) { Project.create(title: "Test title", description: "Test description") }
    it "returns a success response" do
      expect(Project.count).to equal(1)
      delete :destroy, params: { id: project }
      expect(Project.count).to equal(0)
    end
  end
end