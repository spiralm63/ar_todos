require_relative '../app/models/task.rb'
require 'faker'


counter = 1
15.times do 
  random_task = Faker::Company.bs
  Task.create( :content => random_task,
            :position => counter,
            :complete => 0)
  # puts "Content: #{random_task}"
  # puts "Position: #{counter}"
  # puts "------------------"
  counter += 1
end
