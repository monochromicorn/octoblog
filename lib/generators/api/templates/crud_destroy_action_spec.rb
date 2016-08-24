<%= AnnotateModels.get_schema_info(plural_name.singularize.camelize.constantize, " == Schema Information") if plural_name.singularize.camelize.constantize.respond_to?(:table_name)  %>
require 'spec_helper'

describe Api::<%= plural_name.camelize  %>::Destroy do
  describe "#run" do
    let(:<%= plural_name.singularize %>) { create(:<%= plural_name.singularize %>) }

    before(:each) do
      <%= plural_name.singularize %>
    end

    it "destroys the record" do
      expect{Api::<%= plural_name.camelize  %>::Destroy.new({id: <%= plural_name.singularize %>.id}).run}.
        to change{<%= plural_name.singularize.camelize  %>.count}.by(-1)
    end

    it "returns the record" do
      expect(Api::<%= plural_name.camelize  %>::Destroy.new({id: <%= plural_name.singularize %>.id}).run).
        to eql(<%= plural_name.singularize %>)
    end 
  end
end