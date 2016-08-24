<%= AnnotateModels.get_schema_info(plural_name.singularize.camelize.constantize, " == Schema Information") if plural_name.singularize.camelize.constantize.respond_to?(:table_name)  %>
require 'spec_helper'

describe Api::<%= plural_name.camelize  %>::<%= @action.camelize %> do
  describe "#run" do
    let(:<%= plural_name.singularize %>) { create(:<%= plural_name.singularize %>) }

    it "returns the requested record" do
      expect(Api::<%= plural_name.camelize  %>::Show.new({id: <%= plural_name.singularize %>.id}).run).
        to eql(<%= plural_name.singularize %>)
    end 
  end
end