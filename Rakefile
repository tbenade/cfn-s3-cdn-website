require 'cfndsl'
require 'rake'
require 'json'
require 'AWS'
require_relative 'lib/cloud-producer'


stack_name = 's3-cloudfront-site'

task default: ['print_template']

task :print_template do
  puts CloudProducer.new.parse_template 'template.rb'
end

task :create_stack do
  CloudProducer.new.create_stack stack_name
end

task :delete_stack do
  CloudProducer.new.delete_stack stack_name
end
