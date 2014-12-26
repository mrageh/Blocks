module Jem
  class Specification
    attr_accessor :name, :version, :summary

    def initialize
      @version = "0.1"
      yield(self) if block_given?
    end
  end
end

spec = Jem::Specification.new do |s|
  s.name = "Adam"
  s.version = "0.0.1"
  s.summary = "This is a cool block pattern"
end
p spec
