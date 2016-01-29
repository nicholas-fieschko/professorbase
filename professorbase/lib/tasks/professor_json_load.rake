namespace :profbase do
  
  desc "Load Yale professors from yalecs.json into DB"
  task :yale => :environment do
    sanitizer = ActionView::Base.full_sanitizer
    University.create!(name: "Yale University", nickname: "Yale")
    yale_id = University.find_by!(nickname: "Yale").id
    file = File.read('lib/assets/yalecs.json')
    data = JSON.parse(file)
    data.each do |prof|
      new_prof = Professor.new
      new_prof.university_id = yale_id
      new_prof.website = prof["website"] unless prof["website"].empty?
      new_prof.bio = sanitizer.sanitize prof["bio"] unless sanitizer.sanitize(prof["bio"]).empty?
      new_prof.name = prof["name"]
      new_prof.title = prof["title"]
      new_prof.email = prof["email"]
      new_prof.phone = prof["phone"] unless prof["phone"].empty?
      new_prof.address = prof["address"] unless prof["address"].empty?
      new_prof.profile_link = prof["profile_link"]
      new_prof.save!
      prof_id = Professor.find_by(name: prof["name"]).id
      prof["publications"].each do |pub|
          new_pub = Publication.new 
          new_pub.info = sanitizer.sanitize pub
          new_pub.professor_id = prof_id
          new_pub.save!
      end
    end
  end

  desc "Load Harvard professors from ../harvcs.json into DB"
  task :harvard => :environment do
    sanitizer = ActionView::Base.full_sanitizer
    University.create!(name: "Harvard University", nickname: "Harvard")
    harvard_id = University.find_by!(nickname: "Harvard").id
    file = File.read('lib/assets/harvcs.json')
    data = JSON.parse(file)
    data.each do |prof|
      new_prof = Professor.new
      new_prof.university_id = harvard_id
      new_prof.website = prof["website"] unless prof["website"].empty?
      new_prof.bio = sanitizer.sanitize(prof["bio"]) unless sanitizer.sanitize(prof["bio"]).empty?
      new_prof.name = prof["name"]
      new_prof.title = prof["title"]
      new_prof.email = prof["email"]
      new_prof.phone = prof["phone"] unless prof["phone"].empty?
      new_prof.address = (prof["address"]+", Cambridge, Massachusetts") unless prof["address"].empty?
      new_prof.profile_link = prof["profile_link"]
      new_prof.save!
      prof_id = Professor.find_by(name: prof["name"]).id
      prof["study_areas"].each do |area|
        db_area = StudyArea.find_by(name:sanitizer.sanitize(area))
        if db_area.nil?
          StudyArea.create!(name:sanitizer.sanitize(area))
          db_area = StudyArea.find_by(name:sanitizer.sanitize(area))
        end
        new_interest = Interest.create!(professor_id:  prof_id, 
                                        study_area_id: db_area.id)
      end
    end
  end

  desc "Load MIT professors from ../mitcs.json into DB"
  task :mit => :environment do
    sanitizer = ActionView::Base.full_sanitizer
    University.create!(name: "Massachusetts Institute of Technology", nickname: "MIT")
    mit_id = University.find_by!(nickname: "MIT").id
    file = File.read('lib/assets/mitcs.json')
    data = JSON.parse(file)
    data.each do |prof|
      new_prof = Professor.new
      new_prof.university_id = mit_id
      new_prof.website = prof["website"] unless prof["website"].empty?
      new_prof.bio = sanitizer.sanitize(prof["bio"]) unless sanitizer.sanitize(prof["bio"]).empty?
      new_prof.name = prof["name"]
      new_prof.title = prof["title"]
      new_prof.email = prof["email"]
      new_prof.phone = prof["phone"] unless prof["phone"].empty?
      new_prof.profile_link = prof["profile_link"]
      new_prof.save!
      prof_id = Professor.find_by(name: prof["name"]).id
      prof["publications"].each do |pub|
          new_pub = Publication.new 
          new_pub.info = sanitizer.sanitize pub
          new_pub.professor_id = prof_id
          new_pub.save!
      end
      prof["study_areas"].each do |area|
        unless sanitizer.sanitize(area).empty?
          db_area = StudyArea.find_by(name:sanitizer.sanitize(area))
          if db_area.nil?
            StudyArea.create!(name:sanitizer.sanitize(area))
            db_area = StudyArea.find_by(name:sanitizer.sanitize(area))
          end
          new_interest = Interest.create!(professor_id:  prof_id, 
                                          study_area_id: db_area.id)
        end
      end
    end
  end




end