#mapping using plotly

#load packages:
import json
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go

#load data here
gap = px.data.gapminder().query("year==2007")
gap.head

#min level choropleth
fig = px.choropleth(gap, 
    locations = "iso_alpha",
    color = "lifeExp",
    hover_name="country",
    color_continuous_scale = "viridis",
    title = "Life Expectancy by Country 2007"
    )

fig.show()

#crop and improve labels
fig.update_layout(
    coloraxis_colorbar_title = "Years",
    margin = dict(l=0, r=0, t=50, b=0)
)


fig = px.choropleth(
    gap,
    locations="iso_alpha",
    color="gdpPercap",
    hover_name="country",
    hover_data={
        "lifeExp": ":.1f",
        "pop": ":,",
        "gdpPercap": ":,.0f",
        "iso_alpha": False
    },
    color_continuous_scale="Plasma",
    title="GDP per capita by country (2007)"
)
fig.show()

#update outlines of gdp map
fig.update_geos(
    showframe = False,
    showcoastlines = False
)

#crop to one zoomed in region
americas = gap.query("continent == 'Americas'")
americas

fig = px.choropleth(gap, 
    locations = "iso_alpha",
    color = "lifeExp",
    hover_name="country",
    color_continuous_scale = "Tealgrn",
    title = "Life Expectancy the the Americas 2007"
    )
fig.show()

fig.update_geos(
    scope ="north america", 
    showland = True,
    landcolor = "rgb(240,240,240)"
)
fig.show()


#look at some projections
fig.update_geos(projection_type="natural earth")
