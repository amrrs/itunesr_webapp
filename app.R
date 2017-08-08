library(shiny)
library(shinymaterial)
library(itunesr)

# Wrap shinymaterial apps in material_page
ui <- material_page(
  title = "iTunes AppStore Reviews Analysis", nav_bar_color = 'indigo',
  #background_color = 'grey',
  # Place side-nav in the beginning of the UI
  #material_side_nav(
  #  fixed = TRUE,
  #  tags$h3("Menu Item 1")
  #),
  # Define tabs
  material_tabs(
    tabs = c(
      "Download" = "first_tab",
      "Analyze" = "second_tab",
      'Contact' = 'third-tab'
    ),color = 'deep-purple'
  ),
  # Define tab content
  material_tab_content(
    tab_id = "first_tab",
    #tags$h1("First Tab Content"),
    material_row(
      material_column(
        material_dropdown(
          input_id = "country_code",
          label = "AppStore Region",
          choices = c(
            "United Arab Emirates" = "ae",
            "Antigua and Barbuda" = "ag",
            "Anguilla" = "ai",
            "Albania" = "al",
            "Armenia" = "am",
            "Angola" = "ao",
            "Argentina" = "ar",
            "Austria" = "at",
            "Australia" = "au",
            "Azerbaijan" = "az",
            "Barbados" = "bb",
            "Belgium" = "be",
            "Burkina Faso" = "bf",
            "Bulgaria" = "bg",
            "Bahrain" = "bh",
            "Benin" = "bj",
            "Bermuda" = "bm",
            "Brunei" = "bn",
            "Bolivia" = "bo",
            "Brazil" = "br",
            "Bahamas" = "bs",
            "Bhutan" = "bt",
            "Botswana" = "bw",
            "Belarus" = "by",
            "Belize" = "bz",
            "Canada" = "ca",
            "Republic Of Congo" = "cg",
            "Switzerland" = "ch",
            "Chile" = "cl",
            "China" = "cn",
            "Colombia" = "co",
            "Costa Rica" = "cr",
            "Cape Verde" = "cv",
            "Cyprus" = "cy",
            "Czech Republic" = "cz",
            "Germany" = "de",
            "Denmark" = "dk",
            "Dominica" = "dm",
            "Dominican Republic" = "do",
            "Algeria" = "dz",
            "Ecuador" = "ec",
            "Estonia" = "ee",
            "Egypt" = "eg",
            "Spain" = "es",
            "Finland" = "fi",
            "Fiji" = "fj",
            "Federated States Of Micronesia" = "fm",
            "France" = "fr",
            "United Kingdom" = "gb",
            "Grenada" = "gd",
            "Ghana" = "gh",
            "Gambia" = "gm",
            "Greece" = "gr",
            "Guatemala" = "gt",
            "Guinea-Bissau" = "gw",
            "Guyana" = "gy",
            "Hong Kong" = "hk",
            "Honduras" = "hn",
            "Croatia" = "hr",
            "Hungary" = "hu",
            "Indonesia" = "id",
            "Ireland" = "ie",
            "Israel" = "il",
            "India" = "in",
            "Iceland" = "is",
            "Italy" = "it",
            "Jamaica" = "jm",
            "Jordan" = "jo",
            "Japan" = "jp",
            "Kenya" = "ke",
            "Kyrgyzstan" = "kg",
            "Cambodia" = "kh",
            "St. Kitts and Nevis" = "kn",
            "Republic Of Korea" = "kr",
            "Kuwait" = "kw",
            "Cayman Islands" = "ky",
            "Kazakstan" = "kz",
            "Lao People's Democratic Republic" = "la",
            "Lebanon" = "lb",
            "St. Lucia" = "lc",
            "Sri Lanka" = "lk",
            "Liberia" = "lr",
            "Lithuania" = "lt",
            "Luxembourg" = "lu",
            "Latvia" = "lv",
            "Republic Of Moldova" = "md",
            "Madagascar" = "mg",
            "Macedonia" = "mk",
            "Mali" = "ml",
            "Mongolia" = "mn",
            "Macau" = "mo",
            "Mauritania" = "mr",
            "Montserrat" = "ms",
            "Malta" = "mt",
            "Mauritius" = "mu",
            "Malawi" = "mw",
            "Mexico" = "mx",
            "Malaysia" = "my",
            "Mozambique" = "mz",
            "Namibia" = "na",
            "Niger" = "ne",
            "Nigeria" = "ng",
            "Nicaragua" = "ni",
            "Netherlands" = "nl",
            "Norway" = "no",
            "Nepal" = "np",
            "New Zealand" = "nz",
            "Oman" = "om",
            "Panama" = "pa",
            "Peru" = "pe",
            "Papua New Guinea" = "pg",
            "Philippines" = "ph",
            "Pakistan" = "pk",
            "Poland" = "pl",
            "Portugal" = "pt",
            "Palau" = "pw",
            "Paraguay" = "py",
            "Qatar" = "qa",
            "Romania" = "ro",
            "Russia" = "ru",
            "Saudi Arabia" = "sa",
            "Solomon Islands" = "sb",
            "Seychelles" = "sc",
            "Sweden" = "se",
            "Singapore" = "sg",
            "Slovenia" = "si",
            "Slovakia" = "sk",
            "Sierra Leone" = "sl",
            "Senegal" = "sn",
            "Suriname" = "sr",
            "Sao Tome and Principe" = "st",
            "El Salvador" = "sv",
            "Swaziland" = "sz",
            "Turks and Caicos" = "tc",
            "Chad" = "td",
            "Thailand" = "th",
            "Tajikistan" = "tj",
            "Turkmenistan" = "tm",
            "Tunisia" = "tn",
            "Turkey" = "tr",
            "Trinidad and Tobago" = "tt",
            "Taiwan" = "tw",
            "Tanzania" = "tz",
            "Ukraine" = "ua",
            "Uganda" = "ug",
            "United States" = "us",
            "Uruguay" = "uy",
            "Uzbekistan" = "uz",
            "St. Vincent and The Grenadines" = "vc",
            "Venezuela" = "ve",
            "British Virgin Islands" = "vg",
            "Vietnam" = "vn",
            "Yemen" = "ye",
            "South Africa" = "za",
            "Zimbabwe" = "zw"
            
          ),
          selected = "us"
        ),
        width=3
      )
      ,
      
      material_column(
      
        material_text_box(
          input_id = 'app_id_1',
          label = 'App ID',
          color = "#ef5350"
          
        ),
        width = 3
      )
      ,
      
      material_column(
      
        material_button(
          input_id = "get_button",
          label = "Get Reviews"
          
      ),
      width = 3
      )
      ,
      
      material_column(
        
        material_button("downloadData", "Download",color = 'pink'),
        width = 3
      ) 
    )
    ,
    
   # material_column(
      
    #  material_button("downloadLogo", "Download",color = 'pink'),
    #  width = 3
    #) 
  
    #,
    
    material_card(
      #title = 'Displaying Top 10 Reviews',
      #tags$h3('Reviews Output'),
      depth = 1,
      dataTableOutput('downloaded_data_table')
      
    )
    
    #downloadLink("downloadData", "Download")
    
    
    
  ),
  material_tab_content(
    tab_id = "second_tab",
    tags$h1("Under Development!")
    
  )
)

server <- function(input, output) {
  
  output$downloaded_data_table <- renderDataTable(
    
    if(input$get_button){
      
      reviews_data <- getReviews(input$app_id_1,input$country_code,1)
  
      
      
      
      head(reviews_data)
      
    }
    
    
  )
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("reviews-data-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      reviews_data <- getReviews(input$app_id_1,input$country_code,1)
      write.csv(reviews_data, file,row.names = F)
    }
  )
  
  
  output$downloadLogo <- downloadHandler(
    #filename = function() {
    #  paste("reviews-data-", Sys.Date(), ".csv", sep="")
    #},
    #content = function(file) {
     # reviews_data <- getReviews(input$app_id_1,input$country_code,1)
     # write.csv(reviews_data, file,row.names = F)
    #}
    getLogo(input$app_id_1,input$country_code)
  )
  
  
    
}
shinyApp(ui = ui, server = server)
