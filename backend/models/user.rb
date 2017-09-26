class User < Sequel::Model
  plugin :timestamps, create: :created_time
  one_to_many :atoms

  def admin?
    self.usergroup == 0
  end

  def editor?
    self.usergroup == 1 
  end

  def editable?
    self.usergroup == 0 ||  self.usergroup == 1
  end
end
