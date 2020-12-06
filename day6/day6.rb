class CustomsForms
  def self.num_of_yes(groups)
    groups.reduce(0) do |num, form|
      num + num_of_yes_in_form(form)
    end
  end

  def self.num_of_yes_in_form(form)
    yes_answers = form
      .delete("\n")
      .split("")
      .reduce({}) do |answers, char|
        answers[char] = true
        answers
      end
    yes_answers.length
  end
end