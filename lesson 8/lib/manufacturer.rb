module Manufacturer
  def set_name(lev)
    self.name = lev
  end

  def get_name
    self.name
  end

  protected
  attr_accessor :name
end
