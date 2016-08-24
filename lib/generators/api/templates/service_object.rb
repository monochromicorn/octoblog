<%= AnnotateModels.get_schema_info(plural_name.singularize.camelize.constantize, " == Schema Information") if plural_name.singularize.camelize.constantize.respond_to?(:table_name)  %>
module Api
  module <%= plural_name.camelize  %>
    extend self

    <% actions.each do |action| %>
    def <%= action %>(attributes, options = {})
      <%= action.capitalize %>.new(attributes, options).run
    end
    <% end %>
  end
end