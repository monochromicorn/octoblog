<%= AnnotateModels.get_schema_info(plural_name.singularize.camelize.constantize, " == Schema Information") if plural_name.singularize.camelize.constantize.respond_to?(:table_name)  %>
require 'spec_helper'

describe Api::<%= plural_name.camelize  %>::<%= @action.camelize %> do
  describe "#run" do
  end
end