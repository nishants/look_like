require "look_like/version"
require 'rspec/expectations'

module LookLike
  class Matchers
    @@matchers = []
    def self.define(matcher)
      @@matchers.push(matcher)
    end

    def self.find(keyword)
      @@matchers.find { |matcher|
        matcher[:select].call(keyword)
      }
    end

    def self.load
      Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), "matchers")) + "/**/*.rb"].each { |file| require file }
    end

  end
end

LookLike::Matchers.load()