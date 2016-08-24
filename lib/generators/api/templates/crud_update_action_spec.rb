<%= AnnotateModels.get_schema_info(plural_name.singularize.camelize.constantize, " == Schema Information") if plural_name.singularize.camelize.constantize.respond_to?(:table_name)  %>
require 'spec_helper'

describe Api::<%= plural_name.camelize  %>::<%= @action.camelize %> do
  describe "#run" do
    let(:<%= plural_name.singularize %>) { create(:<%= plural_name.singularize %>) }
    let(:new_column) { "new value" }

    before(:each) do
      <%= plural_name.singularize %>
    end

    it "updates the record" do
      expect{Api::<%= plural_name.camelize  %>::Update.new(<%= plural_name.singularize %>.attributes.merge({column: new_column})).run}.
        to change{<%= plural_name.singularize %>.reload.column}.to (new_column)
    end

    it "returns the updated record" do
      expect(Api::<%= plural_name.camelize  %>::Update.new(<%= plural_name.singularize %>.attributes.merge({column: new_column})).run).
        to eql(<%= plural_name.singularize %>.reload)
    end
  end
end