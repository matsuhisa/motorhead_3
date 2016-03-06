require 'motorhead/engine'

module NewBooks
  class Engine < ::Rails::Engine
    include Motorhead::Engine
    active_if { rand(2).odd? }
  end
end
