require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create!(strain_name: "OG Kush", description: "thats some good shit", category: "indica", city: "LA", phone: "8181111111", email: "test@test.com") }
  
  describe "attributes" do
      it "has strain_name, description, category, city, phone and email attributes" do
          expect(post).to have_attributes(strain_name: "OG Kush", description: "thats some good shit", category: "indica", city: "LA", phone: "8181111111", email: "test@test.com")
      end
  end
end
