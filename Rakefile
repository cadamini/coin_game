#!/usr/bin/env Rake
# frozen_string_literal: true

require 'bundler/setup'
require 'rake'
require 'rake/testtask'
require 'rubocop/rake_task'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
task default: :spec

RuboCop::RakeTask.new(:rubocop) do |task|
  task.formatters = ['simple']
  task.fail_on_error = true
end

task default: %i[spec rubocop]
