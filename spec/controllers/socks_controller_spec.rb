require 'rails_helper'

RSpec.describe SocksController, type: :controller do
  render_views

  describe '#homepage' do
    before  {get :homepage}

    specify 'that the page loads successfully' do
      expect(response).to be_success
      expect(response).to render_template('index')
    end

    specify 'that a user is assigned' do
      expect(@user.id).to exist
    end

    # context "with guest user" do
    #   expect(@user.email[0..5]).to eq("guest_")
    # end

    context "with signed-in user" do
      expect(@user).to be(current_user)
    end
  end




  # it "assigns a new sock as @sock" do
  #   expect(assigns(:sock)).to be_a_new(Sock)
  # end

  # describe "GET #index" do
  #   it "assigns all socks as @socks" do
  #     sock = Sock.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:socks)).to eq([sock])
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "assigns the requested sock as @sock" do
  #     sock = Sock.create! valid_attributes
  #     get :show, {:id => sock.to_param}, valid_session
  #     expect(assigns(:sock)).to eq(sock)
  #   end
  # end

  #
  # describe "GET #edit" do
  #   it "assigns the requested sock as @sock" do
  #     sock = Sock.create! valid_attributes
  #     get :edit, {:id => sock.to_param}, valid_session
  #     expect(assigns(:sock)).to eq(sock)
  #   end
  # end
  #

  # describe '#edit' do
  #   let(:sock) { Sock.create!(name: ) }
  #
  #   specify 'that the page loads successfully' do
  #     get :edit, id: person.id
  #     expect(response).to be_success
  #     expect(response).to render_template('edit')
  #   end
  # end


  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Sock" do
  #       expect {
  #         post :create, {:sock => valid_attributes}, valid_session
  #       }.to change(Sock, :count).by(1)
  #     end
  #
  #     it "assigns a newly created sock as @sock" do
  #       post :create, {:sock => valid_attributes}, valid_session
  #       expect(assigns(:sock)).to be_a(Sock)
  #       expect(assigns(:sock)).to be_persisted
  #     end
  #
  #     it "redirects to the created sock" do
  #       post :create, {:sock => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Sock.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved sock as @sock" do
  #       post :create, {:sock => invalid_attributes}, valid_session
  #       expect(assigns(:sock)).to be_a_new(Sock)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       post :create, {:sock => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested sock" do
  #       sock = Sock.create! valid_attributes
  #       put :update, {:id => sock.to_param, :sock => new_attributes}, valid_session
  #       sock.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested sock as @sock" do
  #       sock = Sock.create! valid_attributes
  #       put :update, {:id => sock.to_param, :sock => valid_attributes}, valid_session
  #       expect(assigns(:sock)).to eq(sock)
  #     end
  #
  #     it "redirects to the sock" do
  #       sock = Sock.create! valid_attributes
  #       put :update, {:id => sock.to_param, :sock => valid_attributes}, valid_session
  #       expect(response).to redirect_to(sock)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the sock as @sock" do
  #       sock = Sock.create! valid_attributes
  #       put :update, {:id => sock.to_param, :sock => invalid_attributes}, valid_session
  #       expect(assigns(:sock)).to eq(sock)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       sock = Sock.create! valid_attributes
  #       put :update, {:id => sock.to_param, :sock => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested sock" do
  #     sock = Sock.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => sock.to_param}, valid_session
  #     }.to change(Sock, :count).by(-1)
  #   end
  #
  #   it "redirects to the socks list" do
  #     sock = Sock.create! valid_attributes
  #     delete :destroy, {:id => sock.to_param}, valid_session
  #     expect(response).to redirect_to(socks_url)
  #   end
  # end

end
