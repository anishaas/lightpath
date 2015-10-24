json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :first_name, :last_name, :username, :email, :password_digest
  json.url teacher_url(teacher, format: :json)
end
