module FormHelper
  def setup_school(school)

    3.times do
      school.rankings.build
      school.prompts.build
    end

    school
  end

  def setup_application(application)
    4.times do
      application.test_scores.build
      application.extracurriculars.build
    end
    (School.all - application.schools).each do |school|
      application.admits.build(:school => school)
    end
    # application.admits.sort_by {|x| x.school.name }
    application
  end
end