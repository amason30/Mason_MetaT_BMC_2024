#processing EGGNOG annotations (mega-assembly)
setwd("D:/NIJ_ARF_metaT/Eggnog")


library(readxl)
library(tidyverse)
NIJ_eggnog = read_excel("D:/NIJ_ARF_metaT/Eggnog/NIJ_all_annotations.emapper.annotations.xlsx", sheet = "R") #1,048,573 annotations from original 6,257,674 proteins 
per_ann = 1048573/6257674 #(16.7%)

test = NIJ_eggnog

#which cells contain 'bacteria' in the annoation?
grepl("Bacteria", test$eggNOG_OGs)

test_filter_bacteria = test %>%
  filter(grepl("Bacteria", test$eggNOG_OGs)) #956873 remain (91.3%)

test_filter_archaea = test %>%
  filter(grepl("Archaea", test$eggNOG_OGs)) #8480 remain (0.81%)

test_filter_euk = test %>%
  filter(grepl("Eukaryota", test$eggNOG_OGs)) #79547 remain (7.6%)

test_filter_euk_fungi = test_filter_euk %>%
  filter(grepl("Fungi", test_filter_euk$eggNOG_OGs)) #51216 remain (4.9% of total file, 64.4% of eukaryotes)

#make df of query names for bacteria, archaea, and fungi
GOI_bacteria = as.data.frame(test_filter_bacteria$query)
colnames(GOI_bacteria)="query"

GOI_archaea = as.data.frame(test_filter_archaea$query)
colnames(GOI_archaea)="query"

GOI_fungi = as.data.frame(test_filter_euk_fungi$query)
colnames(GOI_fungi)="query"

GOI_all = rbind(GOI_bacteria, GOI_archaea, GOI_fungi)

#export GOI
library(writexl)
write_xlsx(GOI_all, "NIJ_all_GOI.xlsx")

v = read_excel("D:/NIJ_ARF_metaT/Eggnog/NIJ_all_GOI.xlsx")


