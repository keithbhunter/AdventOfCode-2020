class PassportValidator
  def self.validate(path)
    passports = File.read(path).split("\n\n")
    passports.reduce(0) { |num_of_valid, passport|
      fields = passport.split().reduce({}) { |hash, field|
        key_and_value = field.split(":")
        hash[key_and_value.first] = key_and_value.last
        hash
      }
      
      valid = (all_fields_are_present?(fields) && 
        byr_valid?(fields["byr"]) && 
        iyr_valid?(fields["iyr"]) && 
        eyr_valid?(fields["eyr"]) && 
        hgt_valid?(fields["hgt"]) && 
        hcl_valid?(fields["hcl"]) && 
        ecl_valid?(fields["ecl"]) && 
        pid_valid?(fields["pid"])) ? 1 : 0
      num_of_valid + valid
    }
  end

  def self.all_fields_are_present?(fields)
    expected = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]
    keys = fields.map { |key, value| key }
    diff = expected - keys
    (diff.length == 1 && diff == ["cid"]) || diff.length == 0
  end

  def self.byr_valid?(value)
    # byr (Birth Year) - four digits; at least 1920 and at most 2002.
    value.to_i >= 1920 && value.to_i <= 2002
  end

  def self.iyr_valid?(value)
    # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
    value.to_i >= 2010 && value.to_i <= 2020
  end

  def self.eyr_valid?(value)
    # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
    value.to_i >= 2020 && value.to_i <= 2030
  end

  def self.hgt_valid?(value)
    # hgt (Height) - a number followed by either cm or in:
      # If cm, the number must be at least 150 and at most 193.
      # If in, the number must be at least 59 and at most 76.
    unit = value.slice(value.length - 2, 2)
    measurement = value.slice(0, value.length - 2)

    if unit == "cm"
      measurement.to_i >= 150 && measurement.to_i <= 193
    else
      measurement.to_i >= 59 && measurement.to_i <= 76
    end
  end

  def self.hcl_valid?(value)
    # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
    value.match(/^#([abcdef]|\d){6}$/)
  end

  def self.ecl_valid?(value)
    # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
    ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(value)
  end

  def self.pid_valid?(value)
    # pid (Passport ID) - a nine-digit number, including leading zeroes.
    value.match(/^\d{9}$/)
  end
end
