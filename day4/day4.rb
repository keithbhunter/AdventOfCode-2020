class PassportValidator
  def self.validate(path)
    passports = File.read(path).split("\n\n")
    passports.reduce(0) { |num_of_valid, passport|
      num_of_valid + (is_valid?(passport) ? 1 : 0)
    }
  end

  def self.is_valid?(passport)
    expected = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]
    fields = passport.split().map { |field| field.split(":").first }
    diff = expected - fields
    (diff.length == 1 && diff == ["cid"]) || diff.length == 0
  end
end
