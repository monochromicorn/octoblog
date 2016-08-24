require 'controllers/api/api_helper'

describe Api::V2::<%= plural_name.camelize %>Controller, :type => :controller do
  let (:current_user) { create(:user, business: create(:business, :with_campaigns)) }
  let (:json) { JSON.parse(last_response.body) rescue '' }

  before(:each) do
    set_v2_user_headers(current_user) 
  end

  let(:valid_attributes) { build(:<%= plural_name.singularize %>).attributes }

  let(:invalid_attributes) { {xxx: 123} }

<% actions.each do |action| -%>
<% if action == "index" -%>
  describe "GET index" do
    it "response has all <%= plural_name %>" do
      <%= plural_name.singularize %> = create(:<%= plural_name.singularize %>)
      get '/<%= plural_name %>', {response_category_id: <%= plural_name.singularize %>.response_category_id}
      expect(json.map {|j| j["id"]}).to eq([<%= plural_name.singularize %>.id])
    end
  end

<% end -%>
<% if action == "show" -%>
  describe "GET show" do
    let!(:<%= plural_name.singularize %>) { create(:<%= plural_name.singularize %>) }
    let!(:id) { <%= plural_name.singularize %>.id }

    it "response has all <%= plural_name.singularize %>" do
      get "/<%= plural_name %>/#{id}"
      expect(json["id"]).to eq(id)
    end
  end
<% end -%>
<% if action == "create" -%>
  describe "POST create" do
    describe "with valid params" do
      it "creates a new <%= plural_name.singularize.camelize %>" do
        expect {
          post '/<%= plural_name %>', valid_attributes
        }.to change(<%= plural_name.singularize.camelize %>, :count).by(1)
      end

      it "response has the <%= plural_name.singularize %>" do
        post '/<%= plural_name %>', valid_attributes
        expect(json["id"]).to eq(<%= plural_name.singularize.camelize %>.last.id)
      end
    end

    describe "with invalid params" do
      it "does not create a new <%= plural_name.singularize.camelize %>" do
        expect {
          post '/<%= plural_name %>', invalid_attributes
        }.to_not change{<%= plural_name.singularize.camelize %>.count}
      end
    end
  end 
<% end -%>
<% if action == "update" -%>
  describe "PUT update" do
    let!(:<%= plural_name.singularize %>) { create(:<%= plural_name.singularize %>) }

    describe "with valid params" do
      let(:new_column) { "CLICK NOW!!!" }
      let(:new_attributes) { {cta: new_column} }
      let!(:id) { <%= plural_name.singularize %>.id }

      before(:each) do
        <%= plural_name.singularize %>
      end

      it "updates the <%= plural_name.singularize %>" do
        expect {
          put "/<%= plural_name %>/#{id}", new_attributes
        }.to change{<%= plural_name.singularize %>.reload.cta}.to(new_column)        
      end

      it "response has the <%= plural_name.singularize %>" do
        put "/<%= plural_name %>/#{id}", new_attributes
        expect(json["id"]).to eq(id)
      end
    end

    describe "with invalid params" do
      let(:new_column) { "CLICK NOW!!!" }
      let(:new_attributes) { {cta: new_column} }
      let!(:id) { <%= plural_name.singularize %>.id }

      it "does not update <%= plural_name.singularize %>" do
        expect {
          put "/<%= plural_name %>/#{id}", invalid_attributes
        }.to_not change{<%= plural_name.singularize %>.reload.attributes}
      end
    end
  end  
<% end -%>
<% if action == "destroy" -%>
  describe "DELETE destroy" do
    let!(:<%= plural_name.singularize %>) { create(:<%= plural_name.singularize %>) }
    let!(:id) { <%= plural_name.singularize %>.id }

    it "destroys the requested page" do
      expect {
        delete "/<%= plural_name %>/#{id}"
      }.to change{<%= plural_name.singularize.camelize %>.count}.by(-1)
    end
  end
<% end -%>
<% end -%>
end
