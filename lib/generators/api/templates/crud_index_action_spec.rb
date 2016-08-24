<%= AnnotateModels.get_schema_info(plural_name.singularize.camelize.constantize, " == Schema Information") if plural_name.singularize.camelize.constantize.respond_to?(:table_name)  %>
require 'spec_helper'

describe Api::<%= plural_name.camelize  %>::<%= @action.camelize %> do
  describe "#run" do
    let(:<%= plural_name %>_99) { create_list(:<%= plural_name.singularize %>, 3, some_id: 99).sort {|a,b| a.id <=> b.id } }
    let(:<%= plural_name %>_66) { create_list(:<%= plural_name.singularize %>, 3, some_id: 66).sort {|a,b| a.id <=> b.id } }

    before(:each) do
      <%= plural_name %>_99
      <%= plural_name %>_66
    end

    it "returns the <%= plural_name %>" do
      expect(Api::<%= plural_name.camelize  %>::Index.new({some_id: 99}).run.sort {|a,b| a.id <=> b.id }).
        to eql(<%= plural_name %>_99)
    end    
  end
end