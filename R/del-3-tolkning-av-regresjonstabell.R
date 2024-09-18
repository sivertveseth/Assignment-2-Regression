# Laster inn nødvendige biblioteker
library(exscidata)
library(tidyverse)
library(gt)

# Laster inn data
data("hypertrophy")

## Et enkelt plot for å se sammenhenger
hypertrophy %>% 
  select(PARTICIPANT, GROUP, TRAINING_AGE, FAST_NUCLEI_T1) %>% 
    ggplot(aes(TRAINING_AGE, FAST_NUCLEI_T1)) +
  geom_point(size = 2,
             fill = "red",
             shape = 19) +
        labs(x = "Trenings\u00E5r", 
             y = "Myonucklei per fiber CSA i Type II") +
  geom_smooth(method = "lm", se = FALSE)

# Velger spesifikke variabler og gir dem mer beskrivende navn
ds <- hypertrophy %>% 
  select(participant_id = PARTICIPANT, 
         training_group = GROUP, 
         training_experience_years = TRAINING_AGE, 
         fast_nuclei_per_fiber = FAST_NUCLEI_T1)

# Lager lineær modell med ds
mod1 <- lm(fast_nuclei_per_fiber ~ training_experience_years, data = ds)

# Henter ut koeffisienter og deres statistikker
model_summary <- coef(summary(mod1))

# Lager regresjonstabell med forklarende radnavn
regression_table <- data.frame(
  term = c("Intercept (Constant)", "Training Experience (Years)"),
  t.value = round(model_summary[, "t value"], 3),
  p.value = if.else(model_summary[, "Pr(>|t|)"] < 0.001, "< 0.001", round(model_summary[, "Pr(>|t|)"], 3)),
  std.error = round(model_summary[, "Std. Error"], 3)
) %>%
  tibble() %>%
  gt() %>%
  fmt_auto() %>%
  cols_label(
    term = "Term", 
    t.value = md("*t*-value"), 
    p.value = md("*p*-value"), 
    std.error = "Standard Error"
  )

# Vis resultatene
print(regression_table)
