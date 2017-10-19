# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.find_or_create_by!(title: 'Nákupy')
Category.find_or_create_by!(title: 'Dům')
Category.find_or_create_by!(title: 'Mlsání')
Category.find_or_create_by!(title: 'Dárky')
Category.find_or_create_by!(title: 'Zdraví')
Category.find_or_create_by!(title: 'Pišta osobní výdaje')
