library(dplyr)

# load results
files <- list.files(
  path       = ".", 
  pattern    = "^bcf_results_rep_.*\\.rds$", 
  full.names = TRUE
)

dfs <- lapply(files, readRDS)

combined <- bind_rows(dfs)

# calculate the means
col_means <- colMeans(
  do.call(rbind, 
          lapply(
            list.files(pattern="^bcf_results_rep_.*\\.rds$"), 
            readRDS
          )
  )
)

print(col_means)
