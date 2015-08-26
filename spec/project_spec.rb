require("spec_helper")

describe(Project) do
  it("has many employees") do
    test_project = Project.create({:name => "Terribly important project"})
    test_employee1 = test_project.employees.create({:name => "Bob"})
    test_employee2 = test_project.employees.create({:name => "Steve"})
    expect(test_project.employees()).to(eq([test_employee1,test_employee2]))
  end
end
