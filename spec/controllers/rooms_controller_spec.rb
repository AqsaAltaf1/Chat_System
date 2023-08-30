require 'rails_helper'

RSpec.describe RoomsController, type: :controller do

  describe "GET index" do
    let(:room) { Room.create(name: "Example") }
    it "assigns @rooms" do
      get :index
      expect(assigns(:rooms)).to eq([room])
    end
  end

  describe 'GET #show' do
    let(:room) {Room.create(name: "room1", id: 90)}
    it 'renders the show template' do
      get :show, params: { id: room.id }
      expect(response).to render_template(:index) 
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #index' do
    before(:each,:example) { get rooms_path } 
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
  end

  # describe 'PATCH #update' do
  #   it 'updates the room' do
  #     patch :update, params: { id: @room.id, room: { name: 'New Name' } }
  #     @room.reload
  #     debugger
  #     expect(@room.name).to eq('New Name')
  #   end
  # end
end