class Rule
  def initialize(name, quantity)
    @name = name
    @quantity = quantity.to_i
    @sub_rules = []
  end

  def add_sub_rule(sub_rule)
    @sub_rules << sub_rule
  end
  
  def sub_rules
    @sub_rules
  end

  def name
    @name
  end

  def quantity
    @quantity
  end
end

class Rules
  def initialize(file)
    lines = File.read(file).split("\n")
    
    @rules = lines.reduce({}) do |rules, line|
      components = line.gsub(/bags|bag|\./, "")
                       .split(/contain|,/)
                       .map(&:strip)
    
      name = components.shift()
      rule = Rule.new(name, 0)

      components.each do |component|
        next if component == "no other"
        sub_components = component.split(/\s/, 2)
        sub_rule = Rule.new(sub_components.last, sub_components.first)
        rule.add_sub_rule(sub_rule)
      end

      rules[name] = rule
      rules
    end
  end

  def rules_containing(rule_name)
    @rules.filter { |name, rule| rule_contains?(rule, rule_name) }
  end

  def rule_contains?(rule, rule_name)
    rule = @rules[rule.name]
    includes = false

    rule.sub_rules.each do |sub_rule|
      includes = sub_rule.name == rule_name
      break if includes
      includes = rule_contains?(sub_rule, rule_name)
      break if includes
    end

    includes
  end

  def number_of_bags_in(name)
    rule = @rules[name]

    rule.sub_rules.reduce(0) do |num, sub_rule|
      num_of_bags = number_of_bags_in(sub_rule.name)
      if num_of_bags == 0
        num + sub_rule.quantity
      else
        num + sub_rule.quantity + sub_rule.quantity * num_of_bags
      end
    end
  end
end
