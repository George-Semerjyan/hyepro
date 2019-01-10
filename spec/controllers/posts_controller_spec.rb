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
    
   describe "GET show" do
     it "returns http success" do
       get :show, {id: my_post.id}
       expect(response).to have_http_status(:success)
     end
     
     it "renders the #show view" do
       get :show, {id: my_post.id}
       expect(response).to render_template :show
     end
     
     it "assigns my_post to @post" do
       get :show, {id: my_post.id}
       expect(assigns(:post)).to eq(my_post)
     end
   end
   
    describe "GET edit" do
    it "returns http success" do
      get :edit, params: { id: my_post.id }
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #edit view" do
      get :edit, params: { id: my_post.id }
      expect(response).to render_template :edit
    end
    
    it " assigns post to be updates to @post" do
      get :edit, params: { id: my_post.id }

      post_instance = assigns(:post)
      expect(post_instance.id).to eq my_post.id
      expect(post_instance.strain_name).to eq my_post.strain_name
      expect(post_instance.description).to eq my_post.description
      expect(post_instance.category).to eq my_post.category
      expect(post_instance.city).to eq my_post.city
      expect(post_instance.phone).to eq my_post.phone
      expect(post_instance.email).to eq my_post.email
    end
    
    describe "PUT update" do
      it "updates post with expected attributes" do
        new_strain_name = RandomData.random_word
        new_description = RandomData.random_paragraph
        new_category = RandomData.random_category
        new_city = RandomData.random_word
        new_phone = RandomData.random_number
        new_email = "changed@test.com"
       
       put :update, params: { id: my_post.id, post: { strain_name: new_strain_name, description: new_description, category: new_category, city: new_city, phone: new_phone, email: new_email}}

       updated_post = assigns(:post)
       expect(updated_post.id).to eq my_post.id
       expect(updated_post.strain_name).to eq new_strain_name
       expect(updated_post.description).to eq new_description
       expect(updated_post.category).to eq new_category
       expect(updated_post.city).to eq new_city
       expect(updated_post.phone).to eq new_phone
       expect(updated_post.email).to eq new_email
     end
 
     it "redirects to the updated post" do
        new_strain_name = RandomData.random_word
        new_description = RandomData.random_paragraph
        new_category = RandomData.random_category
        new_city = RandomData.random_word
        new_phone = RandomData.random_number
        new_email = "changed@test.com"
        
       put :update, params:{ id: my_post.id, post: { strain_name: new_strain_name, description: new_description, category: new_category, city: new_city, phone: new_phone, email: new_email}}
       expect(response).to redirect_to my_post
     end
   end
   
   describe "DELETE destroy" do
     it "deletes the post" do
       delete :destroy, {id: my_post.id}
       count = Post.where({id: my_post.id}).size
       expect(count).to eq 0
     end
 
     it "redirects to posts index" do
       delete :destroy, {id: my_post.id}
       expect(response).to redirect_to posts_path
     end
   end
  end
  end
  

