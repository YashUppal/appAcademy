require "employee"

class Startup

  attr_reader :name, :funding, :salaries, :employees # create getters

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = Array.new # []
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end

  def > (startup)
    self.funding > startup.funding
    # startup1.>(startup2)
  end

  def hire(employee_name, title)
    if valid_title?(title)
      new_employee = Employee.new(employee_name, title)
      self.employees << new_employee
    else
      raise 'Title is invalid'
    end
  end

  def size
    employees.length
  end

  def pay_employee(employee)
    if funding >= salaries[employee.title]
      employee.pay(salaries[employee.title])
      @funding -= salaries[employee.title]
    else
      raise "Startup does't have enough funding."
    end
  end

  def payday
    @employees.each do |emp|
      pay_employee(emp)
    end
  end

  def average_salary
    sum = 0
    employees.each do |emp|
      sum += salaries[emp.title]
    end
    return sum / size.to_f
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(acquired)
    @funding += acquired.funding

    acquired.salaries.each do |key, value|
      if !self.salaries.has_key?(key)
        @salaries[key] = value
      end
    end

    @employees += acquired.employees

    acquired.close
  end

  
end
