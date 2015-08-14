require 'redmine_achiever'

Redmine::Plugin.register :redmine_achiever do
  name 'Redmine Achiever plugin'
  author 'Maksim Petrov'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/petrovmp89/redmine-achiver'
  author_url ''
  settings default: { achiever_url: 'http://achiever.expamlpe.com/api/event/redmine' },
           partial: 'settings/redmine_achiever_settings'
end
