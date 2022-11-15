my_theme <- theme(
  plot.background = element_rect(fill = "black"),
  panel.background = element_rect(fill = "black"),
  text = element_text(color = "beige"),
  axis.text = element_text(color = "beige"),
  axis.ticks = element_blank(),
  axis.line = element_line(color = "beige", size = 0.2),
  axis.title.y = element_blank(),
  panel.grid = element_blank()
)

fifa <- read_csv("data/fifa.csv") |>
  janitor::clean_names()

ageRange <- fifa |>
  pull(age) |>
  range()

general <- fifa |>
  pull(overall) |>
  range()
