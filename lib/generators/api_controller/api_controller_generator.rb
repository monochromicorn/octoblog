class ApiControllerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  argument :actions, type: :array, required: false, default: [], desc: "CRUD or custom actions"

  def create_controller_file
    template "api_controller.rb",      "app/controllers/api/v2/#{plural_name}_controller.rb"
    template "api_controller_spec.rb", "spec/controllers/api/v2/#{plural_name}_spec.rb"
  end
end


# class ApiGenerator < Rails::Generators::NamedBase
#   CRUD_ACTIONS = %w{create update destroy index show}
#   source_root File.expand_path('../templates', __FILE__)

#   argument :actions, type: :array, required: false, default: [], desc: "CRUD or custom actions"

#   def create_root_file
#     template "service_object.rb", "app/services/api/#{plural_name}.rb"
#     template "service_object_spec.rb", "spec/services/api/#{plural_name}_spec.rb"
#   end

#   def create_action_files
#     actions.each do |action|
#       @action = action

#       case action
#       when "index"
#         template "crud_index_action.rb", "app/services/api/#{plural_name}/#{action}.rb", @action
#         template "crud_index_action_spec.rb", "spec/services/api/#{plural_name}/#{action}_spec.rb", @action
#       when "update"
#         template "crud_update_action.rb", "app/services/api/#{plural_name}/#{action}.rb", @action
#         template "crud_update_action_spec.rb", "spec/services/api/#{plural_name}/#{action}_spec.rb", @action
#       when "destroy"
#         template "crud_destroy_action.rb", "app/services/api/#{plural_name}/#{action}.rb", @action
#         template "crud_destroy_action_spec.rb", "spec/services/api/#{plural_name}/#{action}_spec.rb", @action
#       when "create"
#         template "crud_create_action.rb", "app/services/api/#{plural_name}/#{action}.rb", @action
#         template "crud_create_action_spec.rb", "spec/services/api/#{plural_name}/#{action}_spec.rb", @action
#       when "show"
#         template "crud_show_action.rb", "app/services/api/#{plural_name}/#{action}.rb", @action
#         template "crud_show_action_spec.rb", "spec/services/api/#{plural_name}/#{action}_spec.rb", @action
#       else
#         template "crud_action.rb", "app/services/api/#{plural_name}/#{action}.rb", @action
#         template "crud_action_spec.rb", "spec/services/api/#{plural_name}/#{action}_spec.rb", @action
#       end
      
#     end
#   end
# end