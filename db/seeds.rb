DATA = {
  :user_keys =>
    ["username", "first_name", "last_name", "email", "admin", "password"],
  :users => [
    ["admin", "Admin_First_Name", "Admin_Last_Name","admin@email.com",true, "password"],
    ["skai", "Skai", "Jackson", "skai@gmail.com", false, "password"],
    ["kaleo", "Kaleo", "Elam", "kaleo@gmail.com", false,"password"],
    ["olena", "Olena","Ageyeva", "olena@gmail.com", true, "password"],

  ],
  :nurse_keys =>
   ["first_name", "last_name", "role"],
  :nurses => [
    ["Nurse1","Nurse1_Last_Name","nurse"],
    ["Nurse2","Nurse2_Last_Name", "nurse"],
    ["Nurse3","Nurse3_Last_Name", "nurse"],
  ],

  :patient_keys =>
   ["first_name", "last_name", "nurse_id"],
  :patients => [
    ["Patient1","Patient1_Last_Name",1],
    ["Patient2","Patient2_Last_Name",2],
    ["Patient3","Patient3_Last_Name",1],

  ],

:visit_keys =>
["patient_id", "nurse_id", "date"],
:visits =>[
  [1,2,DateTime.strptime('01/11/2018', '%m/%d/%Y') ],
  [2,2,DateTime.strptime('09/11/2018', '%m/%d/%Y') ],
  [3,1,DateTime.strptime('01/03/2018', '%m/%d/%Y') ],
],
  :admins => [
    "olena",
    "admin"
  ]
}

def main
  make_users
  make_admin
  make_nurses
  make_patients
  make_visits
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_admin
  DATA[:admins].each do |username|
    User.create(username: username, admin: true, password: 'password')
  end
end

def make_nurses
  DATA[:nurses].each do |nurse|
    new_nurse = Nurse.new
    nurse.each_with_index do |attribute, i|
      new_nurse.send(DATA[:nurse_keys][i] + "=", attribute)
    end
    new_nurse.save
  end
end

def make_patients
  DATA[:patients].each do |patient|
    new_patient = Patient.new
    patient.each_with_index do |attribute, i|
      new_patient.send(DATA[:patient_keys][i] + "=", attribute)
    end
    new_patient.save
  end
end

def make_visits
  DATA[:visits].each do |visit|
    new_visit = Visit.new
    visit.each_with_index do |attribute, i|
      new_visit.send(DATA[:visit_keys][i] + "=", attribute)
    end
    
    new_visit.save
  end
  #Visit.create(:nurse_id=> 2, :patient_id => 2, :date => DateTime.strptime('09/11/2009', '%m/%d/%Y'))
end


main
