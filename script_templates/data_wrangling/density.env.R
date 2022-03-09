
# make sure the 'tidyverse' package is installed and loaded to run the code below

# macro.env and master.taxa must both be imported before you can run the code below

macro.density <- ___ %>% #replace blank with data frame name
  
  #calculate density for each row
  mutate(invDens = number/benthicArea) %>% 
  
  #join taxonomic information 
  left_join(., master.taxa) %>% 
  
  # Sum for each sampleID and the different taxa 
  # remove the organism_aggr variable if you want
  # density of ALL macroinvertebrates
  # replace blank in the group_by function with grouping variables as needed 
  # such as season, location, year, etc
  # if you want a specific group of organisms, add that column name into 
  #the list of grouping variables (family, organism_aggr, etc)
  #then filter for the organism or group you want
  group_by(sampleID, ___) %>% 
  dplyr::summarise (density = sum(invDens, na.rm = TRUE),
                    
                    # replace the blanks below with an abiotic variable 
                    ___ = mean(___, na.rm = TRUE)) 


