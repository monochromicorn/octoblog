<%= AnnotateModels.get_schema_info(plural_name.singularize.camelize.constantize, " == Schema Information") if plural_name.singularize.camelize.constantize.respond_to?(:table_name)  %>
module Api
  module <%= plural_name.camelize  %>
    class <%= @action.camelize %>
      attr_accessor :attributes, :options, :<%= plural_name.singularize %>

      def initialize(attributes, options = {})
        @attributes = attributes
        @options    = options
      end

      def run
        database_transaction

        <%= plural_name.singularize %>
      end

      protected

      def database_transaction
        ActiveRecord::Base.transaction do
          @<%= plural_name.singularize %> = <%= plural_name.singularize.camelize  %>.create!(attributes)
        end
      end

    end
  end
end