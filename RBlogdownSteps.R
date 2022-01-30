
# Following https://www.dsquintana.blog/free-website-in-r-easy/
# install.packages("blogdown")
if (!requireNamespace("remotes")) install.packages("remotes")
remotes::install_github("rstudio/blogdown")
library(blogdown)

new_site(theme = "wowchemy/starter-academic")
# blogdown::install_hugo(force = TRUE)
## Render a blog version on the Viewer window
blogdown::serve_site()
  ## Hero and demo deactivate in content/home
  ## content/authors/admin change image and save as avatar.jpg
  ## content/author/admin change the _index.md with info
  ## change publication Folder - Journal-article
# To change what appears in your website's header menu, edit the config/_default/menus.toml
# If you would like to add your CV to the menu, just add a menu item, which you can call CV (name = "CV"), which includes url = "files/cv.pdf"
# change contact details: config/_default/params.toml
#devtools::install_github("ropenscilabs/gramr")

## check box: https://rpubs.com/grigory/RNotebookProductivity
