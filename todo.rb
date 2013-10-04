require_relative 'config/application'

def add_task(task)
  Task.create(content: task,
              position: last_position,
              complete: 0)
end

def last_position
  last = Task.order('position DESC').take
  last = last.position + 1
end

def list_all
  list = Task.all
  list.each do |item|
    complete = item.complete
    if complete == 0
      complete = " "
    else
      complete = "X"
    end
    puts "(#{complete}) #{item.position}. #{item.content}"
  end
end

def mark_complete(position)
  task = Task.find_by(position: position)
  task.update(complete: 1)
end

def delete(position)
  task = Task.find_by(position: position)
  decrease_position(position)
  task.destroy
end

def decrease_position(position)
  tasks = Task.where("position > ?", position)
  tasks.each do |task|
    task.update_attributes(:position => task.position - 1)
  end
end


if ARGV.any?
  if ARGV[0] == "list"
    list_all
  elsif ARGV[0] == "add"
    add_task(ARGV[1])
    list_all
  elsif ARGV[0] == "delete"
    delete(ARGV[1])
    list_all
  elsif ARGV[0] == "complete"
    mark_complete(ARGV[1])
    list_all
  end
end
