require 'rails_helper'

describe UsersController do
  let(:user)  { User.create(name:'Antonio', about: 'yoo', pic_loc: 'fpijfwpj') }

  context 'users#index' do

    it 'returns a successful response' do
      get :index
      expect(response).to be_success
    end

    it 'renders the correct template' do
      get :index
      expect(response).to render_template :index
    end

    it 'passes the correct instance variable' do
      get :index
      expect(assigns(:users)).to eq (User.online_users)
    end
  end

  context 'users#show' do

    it 'returns a successful response' do
      get :show, id: user.id
      expect(response).to be_success
    end

    it 'renders the correct template' do
      get :show, id: user.id
      expect(response).to render_template :show
    end

    it 'assigns the correct instance variable' do
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end

  context 'users#new' do

    it 'return a successful response' do
      get :new
      expect(response).to be_success
    end

    it 'renders the correct template' do
      get :new
      expect(response).to render_template :new
    end

    it 'instantiates a new user object' do
      get :new
      expect(assigns(:user)).to be_a_new User
    end
  end

  context 'users#create' do

    it 'creates a new user with valid attrs' do
      expect{
        post :create, user: {name:'Antonio', about: 'yoo', pic_loc: 'fpijfwpj'}
      }.to change { User.count }.by(1)
    end

    it 'doesnt create a new user with invalid attrs' do
      expect{
        post :create, user: {name:'ant'}
      }.not_to change { User.count }
      expect(response).not_to be_redirect
    end
  end

  context 'users#edit' do

    it 'returns a successful response' do
      get :edit, id: user.id
      expect(response).to be_success
    end

    it 'assigns the correct instance variable' do
      get :edit, id: user.id
      expect(assigns(:user)).to eq(user)
      expect(response).to render_template :edit
    end
  end

  context 'users#update' do

    it 'updates the correct attr' do
      expect{
        patch :update, id: user.id, user: {name: 'don'}
      }.to change { user.reload.name }.to('don')
    end

    it 'doesnt change the attr if its invalid' do
      expect{
        patch :update, id: user.id, user: {name: nil}
      }.not_to change { user.reload }
    end
  end

  context 'users#destroy' do

    let!(:other_user)  { User.create(name:'Antonio', about: 'yoo', pic_loc: 'fpijfwpj') }

    it 'deletes the user' do
      expect{
        delete :destroy, id: other_user.id
      }.to change { User.count }.by(-1)
    end
  end
end