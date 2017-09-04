library(shiny)
library(shinymaterial)
library(itunesr)
library(shinyjs)
library(dplyr)
library(ggplot2)
library(tidytext)
library(topicmodels)
library(magrittr)
library(highcharter)

options(shiny.sanitize.errors = TRUE)

# Wrap shinymaterial apps in material_page
ui <- material_page(
  useShinyjs(),  # Set up shinyjs
  title = "iTunes AppStore Reviews Analysis", nav_bar_color = 'deep-purple',
  background_color = 'light-blue lighten-5',
  # Place side-nav in the beginning of the UI
  #material_side_nav(
  #  fixed = TRUE,
  #  tags$h3("Menu Item 1")
  #),
  # Define tabs
  material_row(
    material_column(
    material_tabs(
    tabs = c(
      "Download" = "first_tab",
      "Analyze" = "second_tab",
      #"Package Details" = 'package_details',
      'Contact' = 'third_tab'
      
    ),color = 'deep-purple lighten-5'
  ),width=4)),
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
          selected = "gb"
        ),
        width=2
      )
      ,
      
      material_column(
      
        material_text_box(
          input_id = 'app_id_1',
          label = 'App ID',
          color = "#ef5350"
          
        ),
        width = 2
      )
      ,
      
      material_column(
      
        material_button(
          input_id = "get_button",
          label = "Get Reviews"
          
      ),
      
      
      downloadButton('downloadData','Download CSV',class = 'waves-effect waves-light btn deep-purple'),
      
      width = 3
      )
      ,
      
      material_column(
        
        # material_button(
        #   input_id = "downloadLogo",
        #   label = "Download Logo"
          
         #),
        actionButton('downloadLogo','Download Logo',class = 'waves-effect waves-light btn orange'),
       
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
      title = 'Displaying Top Reviews',
      tableOutput('downloaded_data_table'),
      depth = 1
      
    )
   
   
    
    #downloadLink("downloadData", "Download")
    
    
    
  ),
  material_tab_content(
    tab_id = "second_tab",
    #tags$h1("Under Development!")
    material_row(
      material_column(
        material_card(
          title = 'Average Rating Trend',
          highchartOutput('rating_trend'),
          depth = 1
          
        )
        ,width = 6
      ),
      
      material_column(
        material_card(
          title = 'Word Cloud',
          plotOutput('reviews_wordcloud'),
          depth = 1
          
        )
        ,width = 6
      )
    ),
    material_row(
      material_column(
        downloadButton('downloadTopicPlot','Download Topics Image',class = 'waves-effect waves-light btn deep-purple'),
        material_card(
          title = 'Reviews Topics and Keywords',
          plotOutput('reviews_topics'),
          depth = 1
      
        )
        ,width = 12
      )
    )
    
    
    
  ),
  material_tab_content(
    tab_id = "third_tab",
    material_column(
    
      material_card(
        #title = 'Contact',
        #tableOutput('downloaded_data_table'),
        tags$strong('Contact'),
        tags$strong('Fork this on github:'),
        tags$a('amrrs/itunesr_webapp',href='https://github.com/amrrs/itunesr_webapp'),
        tags$br(),
        tags$strong('Download this repo:'),
        tags$a('itunesr_webapp.zip',href='https://github.com/amrrs/itunesr_webapp/archive/master.zip'),
        depth = 1
        
      ),
      width = 6
        
    )
    
  )
    
  )
  
  server <- function(input, output) {
    
  selectedData <- reactive({
    
    if(input$get_button){
      
      if(nchar(input$app_id_1)>1){
      #getLogo(input$app_id_1,input$country_code)  
        
        getReviews(input$app_id_1,input$country_code,1)    
        }
      
      else {
        shinyjs::alert('Please enter App ID and Try again!')
      }
      
    }
    
  })
  
  
  output$downloaded_data_table <- renderTable(
    
   
    if(input$get_button){
      head(as.matrix(selectedData()))
    } 
    
    
  )
  
  output$rating_trend <- renderHighchart({
    
    if(input$get_button){
    
    dt <- selectedData()
      
    dt$Date <- as.Date(dt$Date)
    dt$Rating <- as.numeric(dt$Rating)    
      
    dt <- dt %>% select(Date,Rating) %>% group_by(Date) %>% summarise(Rating = round(mean(Rating),2))
      
    
    highchart() %>%   hc_add_series_times_values(dt$Date,dt$Rating, name = 'Average Rating')
    
                                                                                                           
    }
    
  })
  
  output$reviews_wordcloud <- renderPlot({
    
    if(input$get_button){
      
      pal <- RColorBrewer::brewer.pal(9,"BuGn")
      wordcloud::wordcloud(iconv(selectedData()$Review, "UTF-8", "ASCII", sub = ""),min.freq=2,random.color=TRUE,colors=pal)
         
    }
    
  })
  
  
  
  
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("reviews-data-", Sys.Date(), ".csv", sep="")
    },
     content = function(file) {
       #reviews_data <- getReviews(input$app_id_1,input$country_code,1)
       write.csv(selectedData(), file, row.names = F)
     }
  )
   
  
  
  downloadLogo1 <- reactive(
    
     
      
       getLogo(input$app_id_1,input$country_code)
     
      
    
    
  )
    
  observeEvent(input$downloadLogo, {
    if(nchar(input$app_id_1)>1){
      downloadLogo1()
      shinyjs::alert('Download Successful!')
    }
    else{
      
      shinyjs::alert('Enter Right App ID and Try Again!')

    }
    
    
    
    
    
    
    
    
    #cat("some text")
  })
     
 
  
  reviews_topics_r <-  reactive({
    
    
    sss <- selectedData()
    
    files <- sss$Review[sss$Rating=='1']
    
    files <- iconv(files, "latin1", "ASCII", sub="")
    
    #create corpus from vector
    docs <- Corpus(VectorSource(files))
    
    #inspect a particular document in corpus
    #writeLines(as.character(docs[[30]]))
    
    
    #start preprocessing
    #Transform to lower case
    docs <-tm_map(docs,content_transformer(tolower))
    
    
    #remove punctuation
    docs <- tm_map(docs, removePunctuation)
    #Strip digits
    docs <- tm_map(docs, removeNumbers)
    #remove stopwords
    docs <- tm_map(docs, removeWords, stopwords(kind = 'en'))
    #remove whitespace
    docs <- tm_map(docs, stripWhitespace)
    #Good practice to check every now and then
    #writeLines(as.character(docs[[30]]))
    #Stem document
    #docs <- tm_map(docs,stemDocument)
    
    #Create document-term matrix
    dtm <- DocumentTermMatrix(docs)
    #convert rownames to filenames
    #rownames(dtm) <- filenames
    #collapse matrix by summing over columns
    freq <- colSums(as.matrix(dtm))
    #length should be total number of terms
    length(freq)
    #create sort order (descending)
    ord <- order(freq,decreasing=TRUE)
    #List all terms in decreasing order of freq and write to disk
    freq[ord]
    
    #load topic models library
    #library(topicmodels)
    
    
    #Set parameters for Gibbs sampling
    burnin <- 4000
    iter <- 2000
    thin <- 500
    seed <-list(2003,5,63,100001,765)
    nstart <- 5
    best <- TRUE
    
    
    #Number of topics
    k <- 6
    
    
    #Run LDA using Gibbs sampling
    ldaOut <-LDA(dtm,k, method='Gibbs', control=list(nstart=nstart, seed = seed, best=best, burnin = burnin, iter = iter, thin=thin))
    
    
    #write out results
    #docs to topics
    #ldaOut.topics <- as.matrix(topics(ldaOut))
    
    #ldaOut.topics
    
    #top 6 terms in each topic
    #ldaOut.terms <- as.matrix(terms(ldaOut,6))
    #ldaOut.terms
    
    
    ###tidy text
    
    topics <- tidy(ldaOut, matrix = "beta")
    
    
    top_terms <- topics %>%
      group_by(topic) %>%
      top_n(6, beta) %>%
      ungroup() %>%
      arrange(topic, -beta)
    
    top_terms %>%
      mutate(term = reorder(term, beta)) %>%
      ggplot(aes(term, beta, fill = factor(topic))) +
      geom_col(show.legend = FALSE) +
      facet_wrap(~ topic, scales = "free") +
      coord_flip()
    
    
    
  })
  
  
  output$reviews_topics <- renderPlot({
    reviews_topics_r()
  })
  
  
  output$downloadTopicPlot <- downloadHandler(
    filename = function(){'topic_model.png'},
    content = function(filename){ ggsave(filename, plot = reviews_topics_r(), device='png',width = 25.6,height = 14.4, units='in')
    })
     
}
shinyApp(ui = ui, server = server)
