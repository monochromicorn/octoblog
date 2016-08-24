<%= AnnotateModels.get_schema_info(plural_name.singularize.camelize.constantize, " == Schema Information") if plural_name.singularize.camelize.constantize.respond_to?(:table_name)  %>
require 'spec_helper'

describe Api::<%= plural_name.camelize  %>::<%= @action.camelize %> do
  describe "#run" do
    let(:<%= plural_name.singularize %>_attributes) { build(:<%= plural_name.singularize %>).attributes }

    it "creates a record" do
      expect{Api::<%= plural_name.camelize  %>::<%= @action.camelize %>.new(<%= plural_name.singularize %>_attributes).run}.
        to change{<%= plural_name.singularize.camelize  %>.count}.by(1)
    end

    it "returns the created record" do
       expect(Api::<%= plural_name.camelize  %>::<%= @action.camelize %>.new(<%= plural_name.singularize %>_attributes).run).
        to eql(<%= plural_name.singularize.camelize  %>.last)
    end    
  end
end