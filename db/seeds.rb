# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Project Managers
User.create(email: "test1@gmail.com", password: "password", role: "project_manager", is_active: true)
User.create(email: "test2@gmail.com", password: "password", role: "project_manager", is_active: true)

# Developers
User.create(email: "test3@gmail.com", password: "password", role: "developer", is_active: true)
User.create(email: "test4@gmail.com", password: "password", role: "developer", is_active: true)

puts "Users Created"

# Projects
first_project = Project.create(name: "Project1", added_by: User.project_manager.first, description: Faker::Lorem.paragraph, project_id: Project.new.generate_project_id)

second_project = Project.create(name: "Project2", added_by: User.project_manager.first, description: Faker::Lorem.paragraph, project_id: Project.new.generate_project_id)

third_project = Project.create(name: "Project3", added_by: User.developer.first, description: Faker::Lorem.paragraph, project_id: Project.new.generate_project_id)

fourth_project = Project.create(name: "Project4", added_by: User.developer.first, description: Faker::Lorem.paragraph, project_id: Project.new.generate_project_id)

puts "Projects Created"

# Project Users
first_project.user_ids = [3, 4]
second_project.user_ids = [3]
third_project.user_ids = [4]
fourth_project.user_ids = [3, 4]

puts "Projects Assigned"

# Tasks
first_project.tasks.create(name: "Test Task 1", description: Faker::Lorem.paragraph)
first_project.tasks.create(name: "Test Task 2", description: Faker::Lorem.paragraph, status: "in_progress")

second_project.tasks.create(name: "Test Task 3", description: Faker::Lorem.paragraph, status: "in_progress")
second_project.tasks.create(name: "Test Task 4", description: Faker::Lorem.paragraph, status: "hold")

third_project.tasks.create(name: "Test Task 5", description: Faker::Lorem.paragraph, status: "completed")
third_project.tasks.create(name: "Test Task 6", description: Faker::Lorem.paragraph, status: "deleted")

fourth_project.tasks.create(name: "Test Task 7", description: Faker::Lorem.paragraph)
fourth_project.tasks.create(name: "Test Task 8", description: Faker::Lorem.paragraph, status: "completed")

puts "Tasks for Project Created"
