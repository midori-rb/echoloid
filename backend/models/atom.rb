class Atom < Sequel::Model
  plugin :timestamps, create: :created_time, update: :updated_time
  many_to_one :post
  many_to_one :user
end
