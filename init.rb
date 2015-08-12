Redmine::Plugin.register :redmine_achiever do
  name 'Redmine Achiever plugin'
  author 'Maksim Petrov'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  settings :default => {'empty' => true}, :partial => 'settings/poll_settings'
end
