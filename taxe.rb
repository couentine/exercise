require_relative 'cart'
require_relative 'transform'
require_relative 'calcul'
require_relative 'print'

class Tax

  def initialize(filename)
    @filename = filename
  end

  def input(filename)
    file = Cart.new(filename)
  end

  def parse(file, exclusions)
    list = Transform.new(file, exclusions)
    list.generate
    return list
  end

  def calc(list)
    costs = Calcul.new(list)
    costs.execute
    return costs
  end

  def print(items, sales_tax, total)
    show = Print.new(items, sales_tax, total)
    show.execute
    return show
  end

  def execute
    input = input(@filename)
    parsed_list = parse(input.items, input.exclusions)
    calculate = calc(parsed_list.items)
    print(calculate.items, calculate.sales_tax, calculate.total_all)
  end
end
