crumb :root do
  link "Home", root_path
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

crumb :new do
  link "商品出品", new_gift_path
  parent :root
end
crumb :create do
  link "出品完了", gifts_path, method: :POST
  parent :new
end

crumb :edit do
  link "出品商品編集", edit_gift_path
  parent :root
end
crumb :update do
  link "出品商品編集完了", gift_path, method: :PATCH
  parent :edit
end

crumb :show do
  link "商品詳細", gift_path, method: :GET
  parent :root
end
