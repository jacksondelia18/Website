#GLMs
#april 14 2026

bee_dat <- read_csv("Burnham_field_data_pathogens_wide.csv")

bee_dat <- bee_dat %>%
  mutate(
    sampling_date = mdy(sampling_date),
    site_code = factor(site_code),
    field_id = factor(field_id),
    bee_caste = factor(bee_caste),
    bombus_spp = factor(bombus_spp),
    host_plant = factor(host_plant),
    sampling_event = factor(sampling_event),
    sampling_event_num = as.numeric(as.character(sampling_event)),
    log10_BQCV_load = log10(BQCV_pathogen_load + 1),
    log10_DWV_load = log10(DWV_pathogen_load + 1),
    log10_Nosema_load = log10(Nosema_pathogen_load + 1)
  )

glimpse(bee_dat)


library(tidyverse)
library(lubridate)
library(lme4)
library(car)


df_filtered <- bee_dat[bee_dat$log10_DWV_load > 0 & bee_dat$log10_BQCV_load > 0, ]

#continuous y continuous x
m_cont_cont <- lm(data = df_filtered, log10_DWV_load~log10_BQCV_load)
summary(m_cont_cont)



qplot(
  x = log10_BQCV_load,
  y = log10_DWV_load,
  data = df_filtered) +
geom_smooth(method = "lm", se = TRUE)

hist(df_filtered$log10_DWV_load)


####
#cont y cat x
m_cont_cat <- lm(data=df_filtered, log10_BQCV_load~bombus_spp)
summary(m_cont_cat)


#####
#cat y cont x
m_cat_cont <- glm(data = bee_dat, DWV_pathogen_binary~log10_BQCV_load, family = binomial(link="logit"))
summary(m_cat_cont)


######
#cat y cat x
m_cat_cat <- glm(data = bee_dat, DWV_pathogen_binary~bee_caste, family = binomial(link="logit"))
summary(m_cat_cat)


#signifigance testing
#companion of applied regression packagd

#build some models
bin_mod <- glm(data = bee_dat, DWV_pathogen_binary~bombus_spp * sampling_event + host_plant, family = binomial(link="logit"))
gaus_mod <- lm(data=bee_dat, log10_Nosema_load~sampling_event * host_plant)

summary(gaus_mod)
Anova(bin_mod)
Anova(gaus_mod)

#full v null model
m_dwv_null <- lm(data = df_filtered, log10_DWV_load ~ 1)
m_dwv_full <- lm(data = df_filtered, log10_DWV_load ~ sampling_event + host_plant)

anova(m_dwv_null, m_dwv_full, test = "LRT")


#reduced model
m_dwv_reduced <- lm(data = df_filtered, log10_DWV_load ~ sampling_event)

anova(m_dwv_reduced, m_dwv_full, test = "LRT")


#random effects
g_bqcv_site <- lmer(
  log10_BQCV_load ~ bombus_spp + sampling_event + (1 | site_code),
  data = df_filtered)

Anova(g_bqcv_site)

#nesting blocks
#biggest block on left, going down in signifigance to the right
#adding mutiple discretely also works
#only nest if they are related to each other, often due to experimental design.


#nesting
g_bqcv_site <- lmer(
  log10_BQCV_load ~ bombus_spp + (1 | site_code/sampling_event),
  data = df_filtered)

Anova(g_bqcv_site)

# make pos only nosema
nosPos <- bee_dat[bee_dat$Nosema_pathogen_load > 0,]

# gamma
nos_gamma <- glmer(
  Nosema_pathogen_load ~ bombus_spp * sampling_event + (1 | site_code),
  data = nosPos, family = Gamma)
Anova(nos_gamma)

