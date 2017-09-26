class PostSet < Sequel::Model
  many_to_many :posts
end
