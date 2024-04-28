set.seed(9)

library(readxl)
library(writexl)
library(here)
library(tidyverse)


#import all CSV from CLC:

#day 0:
CON_0 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_0_CON_001_paired_trimmed_notaligned mapping.csv")) %>% rename(CON_0 = Total.read.count)
SP1_0 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_0_SP1_002_paired_trimmed_notaligned mapping.csv")) %>% rename(SP1_0 = Total.read.count)
SP2_0 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_0_SP2_003_paired_trimmed_notaligned mapping.csv")) %>% rename(SP2_0 = Total.read.count)
SP3_0 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_0_SP3_004_paired_trimmed_notaligned mapping.csv")) %>% rename(SP3_0 = Total.read.count)

#day 12:
CON_12 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_12_CON_005_paired_trimmed_notaligned mapping.csv")) %>% rename(CON_12 = Total.read.count)
SP1_12 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_12_SP1_006_paired_trimmed_notaligned mapping.csv")) %>% rename(SP1_12 = Total.read.count)
SP2_12 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_12_SP2_007_paired_trimmed_notaligned mapping.csv")) %>% rename(SP2_12 = Total.read.count)
SP3_12 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_12_SP3_008_paired_trimmed_notaligned mapping.csv")) %>% rename(SP3_12 = Total.read.count)

#day 58:
CON_58 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_58_CON_009_paired_trimmed_notaligned mapping.csv")) %>% rename(CON_58 = Total.read.count)
SP1_58 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_58_SP1_010_paired_trimmed_notaligned mapping.csv")) %>% rename(SP1_58 = Total.read.count)
SP2_58 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_58_SP2_011_paired_trimmed_notaligned mapping.csv")) %>% rename(SP2_58 = Total.read.count)
SP3_58 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_58_SP3_012_paired_trimmed_notaligned mapping.csv")) %>% rename(SP3_58 = Total.read.count)

#day 86:
CON_86 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_86_CON_013_paired_trimmed_notaligned mapping.csv")) %>% rename(CON_86 = Total.read.count)
SP1_86 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_86_SP1_014_paired_trimmed_notaligned mapping.csv")) %>% rename(SP1_86 = Total.read.count)
SP2_86 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_86_SP2_015_paired_trimmed_notaligned mapping.csv")) %>% rename(SP2_86 = Total.read.count)
SP3_86 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_86_SP3_016_paired_trimmed_notaligned mapping.csv")) %>% rename(SP3_86 = Total.read.count)

#day 168:
CON_168 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_168_CON_017_paired_trimmed_notaligned mapping.csv")) %>% rename(CON_168 = Total.read.count)
SP1_168 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_168_SP1_018_paired_trimmed_notaligned mapping.csv")) %>% rename(SP1_168 = Total.read.count)
SP2_168 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_168_SP2_019_paired_trimmed_notaligned mapping.csv")) %>% rename(SP2_168 = Total.read.count)
SP3_168 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_168_SP3_020_paired_trimmed_notaligned mapping.csv")) %>% rename(SP3_168 = Total.read.count)

#day 376:
CON_376 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_378_CON_021_paired_trimmed_notaligned mapping.csv")) %>% rename(CON_376 = Total.read.count)
SP1_376 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_378_SP1_022_paired_trimmed_notaligned mapping.csv")) %>% rename(SP1_376 = Total.read.count)
SP2_376 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_378_SP2_023_paired_trimmed_notaligned mapping.csv")) %>% rename(SP2_376 = Total.read.count)
SP3_376 <- read.csv(here("data/CLC_megaassembly_GOI_mappings/NIJ_378_SP3_024_paired_trimmed_notaligned mapping.csv")) %>% rename(SP3_376 = Total.read.count)

all_data_list <- list(CON_0, SP1_0, SP2_0, SP3_0, CON_12, SP1_12, SP2_12, SP3_12, CON_58, SP1_58, SP2_58, SP3_58, CON_86, SP1_86, SP2_86, SP3_86, CON_168, SP1_168, SP2_168, SP3_168, CON_376, SP1_376, SP2_376, SP3_376)
names(all_data_list) <- c("CON_0", "SP1_0", "SP2_0", "SP3_0", "CON_12", "SP1_12", "SP2_12", "SP3_12", "CON_58", "SP1_58", "SP2_58", "SP3_58", "CON_86", "SP1_86", "SP2_86", "SP3_86", "CON_168", "SP1_168", "SP2_168", "SP3_168", "CON_376", "SP1_376", "SP2_376", "SP3_376")

saveRDS(all_data_list, here::here("data/NIJ_rawcounts_list.RDS"))

####################################################################
##              make a counts table with all samples              ##
####################################################################

all_data_list <- readRDS(here::here("data/NIJ_rawcounts_list.RDS"))

count_df <- all_data_list %>%  map(select, ... = -Average.coverage, ... = -Name, ... = -Consensus.length) %>% # remove columns with sample - specific data 
  Reduce(full_join, .) %>% # bind all unique columns across each df in the list
  select(Reference.sequence, Reference.length, everything()) %>% # move the shared columns to the beginning of the dataframe
  rename(Gene = Reference.sequence,
         Gene_length = Reference.length) # rename shared columns

write_xlsx(count_df, here("data/NIJ_rawcounts_matrix.xlsx"))
