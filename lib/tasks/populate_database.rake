namespace :populate_database do
  desc 'Create Default Type of Results'
  task create_types_of_results: :environment do
    TypeOfResult.find_or_create_by({
                                     title: 'approved',
                                     description: 'Aprovado'
                                   })
    TypeOfResult.find_or_create_by({
                                     title: 'failed',
                                     description: 'Reprovado'
                                   })
    TypeOfResult.find_or_create_by({
                                     title: 'failed_for_lack',
                                     description: 'Reprovado por falta'
                                   })
  end

  desc 'Create Default Courses'
  task create_courses: :environment do
    require 'securerandom'

    Course.find_or_create_by({ code: SecureRandom.hex(4), name: 'Ciências da Computação' })
  end
end
