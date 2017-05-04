module Concerns::Findable


  def create(name)
    self.new(name).save
  end

  def find_by_name(name)
    # it returns the object it is finding
    self.all.detect {|n| n.name == name}
  end

  def find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end


end
