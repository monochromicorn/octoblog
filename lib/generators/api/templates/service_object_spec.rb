<%= AnnotateModels.get_schema_info(plural_name.singularize.camelize.constantize, " == Schema Information") if plural_name.singularize.camelize.constantize.respond_to?(:table_name)  %>
require 'spec_helper'

describe Api::<%= plural_name.camelize %> do
  let!(:action_object) { double("action_object") } 

  <% actions.each do |action| %>
  describe ".<%= action %>" do
    let(:attributes) {}
    let(:options) {}

    it "calls <%= action.camelize %>" do
      expect(action_object).to receive(:run)
      expect(Api::<%= plural_name.camelize %>::<%= action.camelize %>).to receive(:new).
        with(attributes, options).and_return(action_object)

      Api::<%= plural_name.camelize %>.<%= action %>(attributes, options)
    end
  end
  <% end %>
end