# frozen_string_literal: true

module Manufacturer
  def set_name(lev)
    self.name = lev
  end

  def get_name
    name
  end

  protected

  attr_accessor :name
end
