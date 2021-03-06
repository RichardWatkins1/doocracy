require 'fileutils'

def log_in(user = {email: "amy@gmail.com", password: "testtest"})
	visit("/")
	click_link("Login")
	fill_in("Email", with: user[:email])
	fill_in("Password", with: user[:password])
	click_button("Log in")
end

def sign_up(username = "myUsername", email = "test@example.com")
	visit("/")
	click_link("Sign up")
	fill_in("user_user_name", with: username)
	fill_in("user_email", with: email)
	fill_in("user_password", with: "testtest")
	fill_in("user_password_confirmation", with: "testtest")
	click_button("Sign up")
end

def create_skill
	sign_up("asdf")
	click_link "my-profile"
	page.find("#edit-profile").click
	fill_in("Skill", with: 'Cooking')
	page.select 'Advanced', :from => 'skill_skilllevel'
	fill_in("skill_description", with: 'BBQ')
	click_button "Create Skill"
	click_button "Update Profile"
end

def create_project
	stub_request(:get, "http://maps.googleapis.com/maps/api/geocode/json?address=oxford%20street,%20london,%20england&language=en&sensor=false").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
          to_return(:status => 200, :headers => {})
	sign_up
	click_link "create-a-new-project"
	fill_in("project_title", with: "awesome project title")
	fill_in("project_description", with: "Looks like an awesome")
	fill_in("project_total_budget", with: 1000)
	fill_in("project_address", with: "oxford street, london, england")
	attach_file('Image', "spec/files/images/project-puzzle.jpg")
	click_button "Create Project"
end

def create_project_2
	stub_request(:get, "http://maps.googleapis.com/maps/api/geocode/json?address=oxford%20street,%20london,%20england&language=en&sensor=false").
          with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
          to_return(:status => 200, :headers => {})
	sign_up("user2", "user2@user.com")
	click_link "create-a-new-project"
	fill_in("project_title", with: "new project title")
	fill_in("project_description", with: "Looks like an awesome")
	fill_in("project_total_budget", with: 1000)
	fill_in("project_address", with: "oxford street, london, england")
	attach_file('Image', "spec/files/images/project-puzzle.jpg")
	click_button "Create Project"
end

def create_team
	click_link "Create a Team"
	fill_in("team_title", with: "Coding Team")
	fill_in("team_description", with: "Code Stuff")
	click_button "Create Team"
end

def create_team_budget
	fill_in("Budget item", with: 'Hammer')
	fill_in("Quantity", with: '10')
	fill_in("Cost per item", with: '10')
	click_button "add_item"
end

def remove_uploaded_file
	FileUtils.rm_rf(Rails.root + "public/system")
end
