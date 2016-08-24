<%= AnnotateModels.get_schema_info(plural_name.singularize.camelize.constantize, " == Schema Information") if plural_name.singularize.camelize.constantize.respond_to?(:table_name)  %>
module Api
  module V2
    class <%= plural_name.camelize  %>Controller < ApiController
      authorize_resource
      respond_to :json
      
<% actions.each do |action| -%>
<% instance_var_name = action == "index" ? plural_name : plural_name.singularize -%>
      def <%= action %>
        @<%= instance_var_name %> = Api::<%= plural_name.camelize  %>.<%= action %>(<%= action %>_params)
        respond_with @<%= instance_var_name %>
      end        
<% end -%>

      protected

<% actions.each do |action| -%>
      def <%= action %>_params
      end

<% end -%>
    end
  end
end