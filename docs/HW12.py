###HW 12
#plotly mapping


#####
#Q1
#####

import plotly.express as px

# Load the built-in Gapminder dataset
df = px.data.gapminder()

# Filter to Europe, single year
year = 2002
europe_df = df[(df["continent"] == "Europe") & (df["year"] == year)]

# Build the choropleth map
fig = px.choropleth(
    europe_df,
    locations="iso_alpha",         
    color="gdpPercap",             
    hover_name="country",      
    hover_data={
        "gdpPercap": ":,.0f",     
        "pop": ":,.0f",            
    },
    color_continuous_scale="Viridis",              
    title=f"GDP per Capita in Europe ({year})",
    labels={
        "gdpPercap": "GDP per Capita (USD)",
        "pop": "Population",
    },
)

fig.update_layout(
    coloraxis_colorbar=dict(title="GDP per Capita (USD)"),
    margin=dict(l=0, r=0, t=50, b=0),
)

fig.show()

###
#add additional argument, changing scope of map:

fig = px.choropleth(
    europe_df,
    locations="iso_alpha",         
    color="gdpPercap",             
    hover_name="country",      
    hover_data={
        "gdpPercap": ":,.0f",     
        "pop": ":,.0f",            
    },
    color_continuous_scale="Viridis",   
    scope="europe",            
    title=f"GDP per Capita in Europe ({year})",
    labels={
        "gdpPercap": "GDP per Capita (USD)",
        "pop": "Population",
    },
)

fig.update_layout(
    coloraxis_colorbar=dict(title="GDP per Capita (USD)"),
    margin=dict(l=0, r=0, t=50, b=0),
)

fig.show()

#I added the "scope" argument
#this zooms the map in to just our continent of interest.

#-----

#####
#Q2
#####

# Load the built-in Gapminder dataset
df = px.data.gapminder()
 
# Filter to a single year
year = 2007
df_year = df[df["year"] == year]
 
# Build the bubble map
fig = px.scatter_geo(
    df_year,
    locations="iso_alpha",
    size="pop",
    color="continent",
    hover_name="country",
    hover_data={
        "lifeExp": ":.1f",
        "iso_alpha": False,
        "continent": False,
    },
    size_max=60,
    title=f"World Population by Country ({year})",
    labels={
        "pop": "Population",
        "lifeExp": "Life Expectancy (years)",
        "continent": "Continent",
    },
)
 
fig.update_layout(
    legend=dict(title="Continent", orientation="v"),
    margin=dict(l=0, r=0, t=50, b=0),
)
 
fig.show()

#one additional argument
#lets change the projection of this map with "projection"

fig = px.scatter_geo(
    df_year,
    locations="iso_alpha",
    size="pop",
    color="continent",
    hover_name="country",
    projection="natural earth",
    hover_data={
        "lifeExp": ":.1f",
        "iso_alpha": False,
        "continent": False,
    },
    size_max=60,
    title=f"World Population by Country ({year})",
    labels={
        "pop": "Population",
        "lifeExp": "Life Expectancy (years)",
        "continent": "Continent",
    },
)
 
fig.update_layout(
    legend=dict(title="Continent", orientation="v"),
    margin=dict(l=0, r=0, t=50, b=0),
)
 
fig.show()

#I added the "projection" argument and set it to "natural earth"
#this changed the map from something like a mercator 
# to something more proportional and rounded.