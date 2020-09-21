module Concerns::Findable
  def find_by_name(name) #explicit self here doesn't work
    all.find {|i|i.name == name}
  end
  
  def find_or_create_by_name(name)
    find_by_name(name) || self.create(name)
  end
end