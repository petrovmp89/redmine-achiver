module RedmineAchiever
  module Patches
    module TimeEntryPatch
      def self.included(base)
        base.class_eval do
        unloadable
        after_save :send_update_achiever_notification
        after_destroy :send_destroy_achiever_notification
        end
      
        def send_update_achiever_notification
          notification_parameters = { time_entry_id: id,
                                      project_id: project_id,
                                      project_name: Project.find(project_id).name,
                                      user_id: user_id,
                                      user_name: User.find(user_id).mail,
                                      hours: hours,
                                      status: 'updated' }
          send_achiever_notification(notification_parameters)
        end

        def send_destroy_achiever_notification
          notification_parameters = { time_entry_id: id,
                                      status: 'deleted' }
          send_achiever_notification(notification_parameters)
        end

        def send_achiever_notification(notification_parameters)
          uri = URI.parse(Setting.plugin_redmine_achiever['achiever_url'])
          puts "-"*50
	  puts notification_parameters.to_json
          Net::HTTP.new(uri.host, uri.port).start do |client|
            request                 = Net::HTTP::Post.new(uri.path)
            request.body            = notification_parameters.to_json
            request['Content-Type'] = 'application/json'
            client.request(request)
          end
          return true
        end
      end
    end
  end
end

unless TimeEntry.included_modules.include?(RedmineAchiever::Patches::TimeEntryPatch)
  TimeEntry.send(:include, RedmineAchiever::Patches::TimeEntryPatch)
end
