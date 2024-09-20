# Laster inn nødvendige biblioteker
library(exscidata)
library(tidyverse)
library(gt)
library(broom)

# Laster inn data
data("hypertrophy")

# Filtrerer ut NA-verdier før du velger variabler
ds <- hypertrophy %>%
  filter(!is.na(TRAINING_AGE) & !is.na(FAST_NUCLEI_T1)) %>%
  select(PARTICIPANT, GROUP, TRAINING_AGE, FAST_NUCLEI_T1)

# Plotter data uten NA-verdier
ds %>% 
  ggplot(aes(TRAINING_AGE, FAST_NUCLEI_T1)) +
  geom_point(size = 2, fill = "red") +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Sammenheng mellom treningserfaring og myonuklei",
    x = "Treningsår", 
    y = "Myonuklei per fiber CSA i Type II") +
  theme_minimal()

# Lager lineær modell med ds uten NA-verdier
mod1 <- lm(FAST_NUCLEI_T1 ~ TRAINING_AGE, data = ds)

# Henter ut koeffisienter og deres statistikker
model_summary <- tidy(mod1)

# Tilpasser p-verdier og runder av, og fjerner interceptet
model_summary <- model_summary %>%
  mutate(
    term = ifelse(term == "(Intercept)", "Intercept (Konstantledd)", "Treningserfaring (år)"),
    p.value = ifelse(p.value < 0.001, "< 0.001", round(p.value, 3)),
    estimate = round(estimate, 3),
    std.error = round(std.error, 3),
    statistic = round(statistic, 3)
  ) %>%
  # Filtrer ut interceptet
  filter(term != "Intercept (Konstantledd)")
  # Velger å fitrere ut intercept da det ikkje er aktuelt når vi kun skal se om
  # det er en lineær sammenheng mellom dei to variablene

# Lager regresjonstabell med forklarende radnavn
regression_table <- model_summary %>%
  select(term, estimate, std.error, statistic, p.value) %>%
  gt() %>%
  fmt_auto() %>%
  cols_label(
    term = "Term",
    estimate = "Estimert koeffisient",
    std.error = "Standardfeil",
    statistic = md("*t*-verdi"),
    p.value = md("*p*-verdi")
  ) %>% 
  tab_header(
    title = "Resultater fra lineær regresjon",
    subtitle = "Sammenhengen mellom treningserfaring og myonuklei per fiber"
  ) %>%
  tab_source_note(
    source_note = "**Notat**: *p*-verdier mindre enn 0.05 anses som statistisk signifikante."
  )

# Vis resultatene
print(regression_table)
