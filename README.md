# Create a personal website with blogdown in R

This is the repository of my personal blog created with blogdown in R.

Started it following this blog post:
  - https://www.dsquintana.blog/free-website-in-r-easy/

Runt the follow the steps to render a blog version on the Viewer window:
  
`install.packages("blogdown")`
`blogdown::install_hugo("0.92.1")`
`library(blogdown)`
`new_site(theme = "wowchemy/starter-academic") # if needed` 
`blogdown::serve_site()`

## Notes:

- To change what appears in your website's header menu, edit the `config/_default/menus.toml`. 

- To add your CV to the menu, add a menu item called CV (name = "CV"), that should include `url = "files/cv.pdf`

- Change contact details in `config/_default/params.toml`
