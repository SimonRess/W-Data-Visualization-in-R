# 1. gganimate ####

  ## 1.1 required packages ####
  if(!require("gapminder")) install.packages("gapminder") #contains: gapminder-dataset
  library(gapminder)
  if(!require("ggplot2")) install.packages("ggplot2") # contains: ggplot()
  library(ggplot2)
  if(!require("gganimate")) install.packages("gganimate") # A Grammar of Animated Graphics, contains: transition_states()
  library(gganimate)

  ## 1.2 Syntax ####
    ggplot(gapminder, aes(gdpPercap, lifeExp, color = continent)) +
      geom_point(aes(size = pop)) +
      scale_x_log10() +
      transition_states(year,
                        transition_length = 2,
                        state_length = 1)

# 2. plotly::ggploty() ####
  ## 2.1 required packages ####
    if(!require("gapminder")) install.packages("gapminder")
      library(gapminder)
    if(!require("ggplot2")) install.packages("ggplot2")
      library(ggplot2)
    if(!require("plotly")) install.packages("plotly") # Create Interactive Web Graphics via 'plotly.js', contains: ggplotly() [Convert ggplot2 to plotly]
      library(plotly)

  ## 2.2 Syntax ####
    ggplotly(
      ggplot(gapminder, aes(gdpPercap, lifeExp, color = continent)) +
        geom_point(aes(size = pop, frame = year, ids = country)) +
        scale_x_log10()
    )


# 3. plotly::plot_ly() ####
  ## 3.1 required packages ####
    if(!require("gapminder")) install.packages("gapminder")
      library(gapminder)
    if(!require("plotly")) install.packages("plotly")
      library(plotly)

  ## 3.2 Syntax ####
    plot_ly(data=gapminder,
            x = ~gdpPercap, 
            y = ~lifeExp, 
            size = ~pop, 
            color = ~continent, 
            frame = ~year, 
            text = ~country, 
            hoverinfo = "text",
            hovertemplate = paste(
              "<b>%{text}</b><br><br>",
              "%{yaxis.title.text}: %{y:.0f}<br>",
              "%{xaxis.title.text}: %{x:$,.0f}<br>",
              "<extra></extra>"
            ),
            type = 'scatter',
            mode = 'markers'
    ) %>%
      layout(
        xaxis = list(type = "log")
      )
