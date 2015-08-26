require("spec_helper")

describe(Employee) do
  it("belongs to many projects") do
    test_employee1 = Employee.create({:name => "Pilar Martinez"})
    test_project1 = test_employee1.projects.create({:name =>"Ender Wiggins"})
    test_project2 = test_employee1.projects.create({:name =>"Spartan Project"})

    expect(test_employee1.projects()).to(eq([test_project1, test_project2]))
  end
end
