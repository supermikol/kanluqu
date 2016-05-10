module FormHelper
  def setup_school(school)

    3.times do
      school.rankings.build
      school.prompts.build
    end

    school
  end
end