class BootCode
  def initialize(file)
    @file = file
    @instructions = load_boot_code(file)
    @index, @acc = 0, 0
  end

  def load_boot_code(file)
    lines = File.read(file).split("\n")
    lines.map do |line|
      components = line.split(" ")
      { "operation" => components.first, 
        "value" => components.last.to_i,
        "count" => 0 }
    end
  end

  def fix
    replace_index = 0
    runs = 0

    while replace_index <= @instructions.length do
      @acc = 0
      @index = 0

      begin
        while @index < @instructions.length do
          instruction = @instructions[@index]
          raise if instruction["count"] > 10
          execute(instruction)
        end
        return @acc
      rescue
        @instructions = load_boot_code(@file)

        until 
          @instructions[replace_index]["operation"] == "nop" ||
          @instructions[replace_index]["operation"] == "jmp" ||
          replace_index == @instructions.length - 1 do
            replace_index += 1
        end

        instruction = @instructions[replace_index]
        op = instruction["operation"]
        raise unless op == "nop" || op == "jmp"

        instruction["operation"] = op == "jmp" ? "nop" : "jmp"
        replace_index += 1
      end
    end

    raise
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