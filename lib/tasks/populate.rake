namespace :db do
  desc "Fill Database with default data"
  task populate: :environment do

    #Computer Science Section
    sec_cs = Section.new(name: "Course", alias: "course", description: "Computer Science Course", home: "home")
    sec_cs.save
    sec_cs.pages.create!(name: "Home", alias: "home", description: "Home Menu", content: "Welcome to the CS Courses page.<br/><br/>Please select a place from the links to the left.", visible: false)
    sec_cs.pages.create!(name: "What It Is", alias: "what_is_is", description: "What is our course about?", content: "This is all about what <b>computer science</b> is.")
    sec_cs.pages.create!(name: "Scholarships", alias: "scholarships", description: "", content: "")
    sec_cs.pages.create!(name: "Alumni and Careers", alias: "alumni_careers", description: "", content: "")
    sec_cs.pages.create!(name: "Vision and Learning Outcomes", alias: "vision", description: "", content: "")
    sec_cs.pages.create!(name: "Curriculum", alias: "curriculum",description: "",  content: "")
    sec_cs.pages.create!(name: "Research Opportunities", alias: "research", description: "", content: "")

    sec_faculty = Section.new(name: "Faculty", alias: "faculty", description: "Faculty in the Computer Science department", home: "home")
    sec_faculty.save
    sec_faculty.pages.create!(name: "Home", alias: "home", description: "Home Menu", content: "Welcome to the CS Courses Faculty page.<br/><br/>Please select a place from the links to the left.", visible: false)
    sec_faculty.pages.create!(name: "David Hunter", alias: "hunter", description: "Dr. David Hunter", content: "")
    sec_faculty.pages.create!(name: "Wayne Iba", alias: "iba", description: "Dr. Wayne Iba", content: "")
    sec_faculty.pages.create!(name: "Kim Kihlstrom", alias: "kihlstrom", description: "Dr. Kim Kihlstrom", content: "")
    sec_faculty.pages.create!(name: "Nick Lassonde", alias: "lassonde", description: "Dr. Nick Lassonde", content: "")
    sec_faculty.pages.create!(name: "Jonathan Leech", alias: "leech", description: "Dr. Jonathan Leech", content: "")


    #sec_#.pages.create!(name: "", alias: "", description: "", content: "")

  end
end