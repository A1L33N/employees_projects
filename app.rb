require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get("/employees") do
  @employees = Employee.all()
  erb(:employees)
end

get("/projects") do
  @projects = Project.all()
  erb(:projects)
end

post("/employees") do
  name = params.fetch("employee_name")
  Employee.create({:name => name})
  redirect("/employees")
end

post("/projects") do
  name = params.fetch("project_name")
  Project.create({:name => name})
  redirect("/projects")
end

get("/employees/:id") do
  @employee = Employee.find(params.fetch('id').to_i)
  @projects = Project.all
  erb(:employee)
end

get("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  @employees = Employee.all
  erb(:project)
end

patch("/employees/:id") do
  employee_id = params.fetch('id').to_i
  @employee = Employee.find(employee_id)
  project_ids = params.fetch('project_ids')
  @employee.update({:project_ids => project_ids})
  @projects = Project.all
  redirect back
end

patch("/projects/:id") do
  project_id = params.fetch('id').to_i
  @project = Project.find(project_id)
  employee_ids = params.fetch('employee_ids')
  @project.update({:employee_ids => employee_ids})
  @employees = Employee.all
  redirect back
end
