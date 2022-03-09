
# make sure the `vegan` and 'tidyverse' packages are installed and loaded to run the code below

# macro and master.taxa data must both be imported before you can run the code below

# remove missing values, and make sure each taxon is summarized within sampleID
macro.long <- macro %>%  
  
  #join taxonomic information 
  left_join(., master.taxa) %>% 
  
  dplyr::filter(!is.na(number)) %>% 
  dplyr::select(sampleID, organism_aggr, number) %>% 
  group_by(sampleID, organism_aggr) %>% 
  dplyr::summarise(num = sum(number))


# convert to wide format
macro.wide <- macro.long %>% 
  pivot_wider(names_from = organism_aggr, 
              values_from = num,
              values_fill = list(num = 0),
              values_fn = list(num = mean)) %>%
  tibble::column_to_rownames("sampleID")


#Calculate diversity index values

#Shannon
H <- diversity(macro.wide)


#effective number of species
effective.sp <- exp(H)


#Richness
sp.rich <- specnumber(macro.wide) 

#Max possible diversity
max.H <- log(sp.rich)


#Pielou's Evenness J 
J <- H / max.H

#put all diversity values into a single data frame
macro.div <- data.frame(H, effective.sp, sp.rich, max.H, J) %>% 
  tibble::rownames_to_column("sampleID")


#macro.div at this point only has the sampleID and the diversity measures
#if you want to add back in some other variables, you can do that using the code below
mydf <- ___ %>%  #place the name of the original data frame (with all the variables of interest included) here
  select(sampleID, ___) %>% #add in the names of any variables you want in the final data
  distinct()

#this script takes the macro.div and joins it with the mydf one we just created
#sampleID is the "key" used to match up the two data frames
macro.div <- left_join(macro.div, mydf)


