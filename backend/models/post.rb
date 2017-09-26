class Post < Sequel::Model
  one_to_many :atoms
  many_to_many :sets
end
