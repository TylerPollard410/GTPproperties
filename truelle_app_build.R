golem::create_golem(
  path = "~/Documents/BnB Formula/GTPproperties",
  open = FALSE,
  overwrite = TRUE,
  project_hook = function(path, package_name, ...) {
    golem::fill_desc(
      pkg_name = "GTPproperties",
      pkg_title = "Property Analysis App",
      pkg_description = "App to analyze potential properties.",
      author_first_name = "Tyler",
      author_last_name = "Pollard",
      author_email = "tylerpollard410@gmail.com",
      repo_url = "https://github.com/TylerPollard410/GTPproperties"
    )

    usethis::use_rstudio()
    usethis::use_mit_license( "Golem User" )
    usethis::use_readme_rmd( open = FALSE )
    usethis::use_code_of_conduct(contact = "tylerpollard410@gmail.com")
    usethis::use_lifecycle_badge( "Experimental" )
    usethis::use_news_md( open = FALSE )
    usethis::use_data_raw()
    usethis::use_git()

    golem::use_recommended_deps()
    golem::use_utils_ui()
    golem::use_utils_server()

    golem::add_module( name = "my_first_module" )
    golem::add_fct("my_first_module")
    golem::add_utils("my_first_module")

    golem::add_js_input_binding(
      "myInputBinding",
      initialize = FALSE,
      dev = FALSE,
      events = list(name = "click", rate_policy = FALSE)
    )
    golem::add_js_output_binding("myOutputBinding")
    golem::add_js_handler("script")
    golem::add_js_file("script")
    golem::add_css_file(
      "custom_css",
      template = function(path, ...){
        # Define a CSS template
        write_there <- function(...){
          write(..., file = path, append = TRUE)
        }
        write_there("body {")
        write_there("    background-color:white;")
        write_there("}")
      }
    )

    unlink("R/app_ui.R", TRUE, TRUE)
    file.copy(
      system.file(
        "templates_ui/shinyMobile_tabs.R",
        package = "truelle"
      ),
      "R/app_ui.R"
    )
    unlink("R/app_server.R", TRUE, TRUE)
    file.copy(
      system.file(
        "templates_server/shinyMobile_tabs.R",
        package = "truelle"
      ),
      "R/app_server.R"
    )
    usethis::use_package("shinyMobile")
    devtools::document()
  }
)
