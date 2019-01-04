require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:my_post) { Post.create!(strain_name: RandomData.random_word, description: RandomData.random_paragraph, category: RandomData.random_category, city: RandomData.random_word, phone: RandomData.random_number, email: "test@test.com") }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_post] to @post" do
      get:index
      expect(assigns(:posts)).to eq([my_post])
    end
  end
  
    describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @post" do
      get :new
      expect(assigns(:post)).not_to be_nil
      end
    end
  end
  
=begin


    describe "POST create" do
      it "increases the number of Post by 1" do
        expect{post :create, post: {strain_name: RandomData.random_word, description: RandomData.random_paragraph, category: RandomData.random_category, city: RandomData.random_word, phone: RandomData.random_number, email: "test@test.com"}}.to change(Post,:count).by(1)
      end
 
      it "assigns the new post to @post" do
        post :create, post: {strain_name: RandomData.random_word, description: RandomData.random_paragraph, category: RandomData.random_category, city: RandomData.random_word, phone: RandomData.random_number, email: "test@test.com"}
        expect(assigns(:post)).to eq Post.last
      end
 
      it "redirects to the new post" do
        post :create, post: {strain_name: RandomData.random_word, description: RandomData.random_paragraph, category: RandomData.random_category, city: RandomData.random_word, phone: RandomData.random_number, email: "test@test.com"}
        expect(response).to redirect_to Post.last
      end
    end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end
=end

