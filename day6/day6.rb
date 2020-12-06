class CustomsForms
  def self.num_of_yes_from_everyone(groups)
    yeses = groups.reduce(0) do |sum, form|
      counts = yes_in_form(form)
      num_of_groups = form.split("\n").length

      counts = counts.filter do |answer, count|
        count == num_of_groups
      end

      sum + counts.length
    end
  end

  def self.num_of_yes(groups)
    groups.reduce(0) do |num, form|
      num + yes_in_form(form).length
    end
  end

  def self.yes_in_form(form)
    yes_answers = form
      .delete("\n")
      .split("")
      .reduce({}) do |answers, char|
        answers[char] = answers[char] ? answers[char] + 1 : 1
        answers
      end
    yes_answers
  end
end