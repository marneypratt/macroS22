
# make sure the 'tidyverse' package is installed and loaded to run the code below

# macro and master.taxa data must both be imported before you can run the code below

macro.tol <- ___ %>% #replace blank with data frame name
  
  #join taxonomic information 
  left_join(., master.taxa) %>% 

  # remove missing values
  dplyr::filter(!is.na(number), !is.na(tolerance)) %>% 
  
  # make sure each taxa is summarized usng organism_aggr and within sampleID
  #you can add more grouping variables if desired (year, season, siteID, location etc)
  group_by(sampleID, organism_aggr, ___) %>% 
  dplyr::summarise(num = sum(number), 
                   tol = mean(tolerance)) %>% 
  mutate(x.t = num*tol)

macro.HBI <- macro.tol %>% 
  group_by(___, sampleID) %>% #replace blank with grouping variable
  dplyr::summarise(x.t.sum = sum(x.t),
                   total.n = sum(num)) %>% 
  mutate(HBI = x.t.sum/total.n)
