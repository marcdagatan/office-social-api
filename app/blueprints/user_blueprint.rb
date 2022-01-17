class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :email, :created_at, :updated_at
end
