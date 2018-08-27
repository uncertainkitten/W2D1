class Employee 
  attr_reader :name, :title, :salary
  attr_accessor :boss
  def initialize(name, title, salary)
    @name = name
    @title = title 
    @salary = salary 
    @manager = nil 
  end 
  
  def add_manager(manager)
    @manager = manager if @manager == nil
  end 
  
  def reassign_manager(manager)
    @manager = manager
  end
  
  def bonus(multiplier)
    @salary * multiplier
  end    

end

class Manager < Employee
  def initialize(name,title,salary)
    super
    @subordinates = []
  end 
  
  def bonus(multiplier)
    total_salary = 0
    @subordinates.each do |el|
      total_salary += el.salary
    end
    
    total_salary * multiplier
      
  end 
  
  def add_employee(employee)
    @subordinates << employee if employee.manager == nil
  end
  
  def remove_employee(employee)
    @subordinates.delete(employee)
  end
  
  def reassign_employee
  end
end 