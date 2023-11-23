  library(dplyr)
  library(tidyr)
  
  
    tab <-  StressLevelDataset %>% summarise(across( everything (),
                                                 .fns=list(mean = function(x) mean(x, na.rm = T),
                                                  sd = function (x) sd(x, na.rm = T),
                                                  min =  function(x) min(x, na.rm = T),
                                                  p25 = function(x) quantile(x,probs = 0.25, na.rm = T),
                                                  median= function(x) median(x, na.rm = T),
                                                  p75 = function(x) quantile(x,probs = 0.75, na.rm = T),
                                                  max = function(x) max(x, na.rm = T)),
                                                  .names=" {.col}&{.fn}"))%>%
  pivot_longer(names_to="stat", values_to= "val", cols = everything()) %>%
  separate(stat, into = c("var", "stat"), sep = "&") %>%
  pivot_wider(names_from = stat, values_from = val)

                                         