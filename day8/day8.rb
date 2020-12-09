class BootCode
  def initialize(file)
    lines = File.read(file).split("\n")
    @instructions = lines.map do |line|
      components = line.split(" ")
      { "operation" => components.first, 
        "value" => components.last.to_i,
        "count" => 0 }
    end
    @index, @acc = 0, 0
  end

  def acc_before_repeat_instruction
    while @index < @instructions.length do
      instruction = @instructions[@index]
      return @acc if instruction["count"] > 0
      execute(instruction)
    end
    @acc
  end

  def execute(instruction)
    case instruction["operation"]
    when "nop"
      @index += 1
    when "acc"
      @acc += instruction["value"]
      @index += 1
    when "jmp"
      @index += instruction["value"]
    end
    instruction["count"] += 1
  end
end