# class ActiveRecord::SessionStore::Session
#   def data
#     # Could not load
#     @data ||= ActiveSupport::HashWithIndifferentAccess.new(self.class.deserialize(read_attribute(@@data_column_name))) || ActiveSupport::HashWithIndifferentAccess.new
#   end
# end

Rails.application.config.session_store :active_record_store, :key => '_my_app_session'

