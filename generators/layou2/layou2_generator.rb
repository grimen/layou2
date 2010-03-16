# encoding: utf-8

class Layou2Generator < Rails::Generator::Base

  def manifest
    record do |m|
      m.template 'initializer.rb', File.join(*%w[config initializers layou2.rb])
    end
  end

end