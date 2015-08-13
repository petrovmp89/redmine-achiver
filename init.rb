Redmine::Plugin.register :redmine_achiever do
  name 'Redmine Achiever plugin'
  author 'Maksim Petrov'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/petrovmp89/redmine-achiver'
  author_url ''
  settings :default => {'achiever_url' => "http://achiever.kodep.ru:3000"}, :partial => 'settings/redmine_achiever_settings'
end

ActionDispatch::Callbacks.to_prepare do 
  TimeEntry.send(:include, Patches::TimeEntryPatch)
end