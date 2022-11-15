library(tidyverse)
source("variables.R")

theme_set(my_theme)



plot_potential <-
  function(data,
           ageRange,
           obs,
           general) {
    conditionalSub <- if (length(seq.int(min(ageRange),(max(ageRange)))) > 1) {
      glue::glue(
        "Top {obs} players between {min(ageRange)} and {max(ageRange)} years old"
      )
    } else if (length(seq.int(min(ageRange),(max(ageRange)))) == 1) {
      glue::glue("Top {obs} players who are {ageRange} years old")
    }

    data |>
      select(known_as, overall, potential, age) |>
      filter(age %in% seq.int(ageRange[1], ageRange[2])) |>
      filter(overall %in% seq.int(general[1], general[2])) |>
      mutate(evolution = potential - overall) |>
      mutate(total = potential + overall) |>
      filter(evolution != 0) |>
      arrange(total) |>
      mutate(known_as = fct_inorder(known_as)) |>
      tail(obs) |>
      ggplot() +
      geom_segment(
        aes(
          x = overall,
          xend = potential,
          y = known_as,
          yend = known_as
        ),
        color = "beige",
        size = 0.6
      ) +
      geom_point(aes(potential, known_as),
                 color = "beige",
                 size = 4) +
      geom_point(aes(overall, known_as),
                 color = "orange",
                 size = 2) +
      labs(title = "Fifa 23 player potential evolution",
           subtitle = conditionalSub,
           x = "Evolution (General -> Potential)")
  }
