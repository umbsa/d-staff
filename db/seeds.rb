# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(nickname: "管理者",
        email: "admin@example", 
        password: "1234567a", 
        password_confirmation: "1234567a", 
        user_birth_date: "2000-11-11", 
        full_name: "管理者", 
        full_name_kana: "カンリシャ", 
        admin: true)