ENV["RAILS_ENV"] ||= 'test'
require_relative '../config/environment.rb'
require 'rails/all'
require 'spec_helper'
require 'helpers/factory_girl'
require 'rspec/rails'
require File.expand_path("../../config/environment", __FILE__)
