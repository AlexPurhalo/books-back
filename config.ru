require 'rack'
require 'rubygems'
require 'bundler/setup'
require 'grape'
require './app/core'

run App

use ActiveRecord::ConnectionAdapters::ConnectionManagement