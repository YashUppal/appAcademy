require_relative 'employee'

class Manager < Employee
  attr_reader :assigned

  def initialize(name,title,salary,boss,assigned)
    super(name,title,salary,boss)
    @assigned = assigned
  end

  def bonus(multiplier)

    return self.sub_salaries * multiplier

  end

  def sub_salaries
    # total salaries of subordinates
    total = 0
    self.assigned.each do |sub|
      if sub.instance_of?(Manager)
        total += sub.salary
        total += sub.sub_salaries
        # total += sub.salary
      else
        total += sub.salary
      end
    end
    return total
  end

end