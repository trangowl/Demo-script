### So far only works on excel files

library(readxl)
library(vietnameseConverter)
library(dplyr)
library(lubridate)
library(readr)

setwd("C:\\Users\\tranglq\\OUCRU AMS Dropbox\\ITS data\\
      32HN\\Dong Thap\\Jan 2019 - May 2020 - v1-T")

### datf() to call data with Unicode convert and generated ID
datf <- function(data) {
  dat <- read_excel(data)
  dat <- decodeVN(dat, from = "Unicode", diacritics = FALSE)
  dat <- dat %>%
    mutate(GenID=gsub(paste0("^(.{", 0, "})(.*)$"),
                      paste0("\\1", "HN32", "\\2"),
                      Countba+11))
  return(dat)
  
}

### Call datf()
# Admin data
dth_admin_2019jan <- datf("32HN_ITS_DTH_Admin_from 2019Jan to 2019Jun.xlsx")
dth_admin_2019jul <- datf("32HN_ITS_DTH_Admin_from 2019Jul to 2019Dec.xlsx")
dth_admin_2020jan <- datf("32HN_ITS_DTH_Admin_from 2020Jan to 2020May.xlsx")
dth_admin_2019jan_noant <- datf("Jan 2019 - May 2020 - v1-T\\32HN_ITS_DTH_Admin_No Antibiotic_from 2019Jan to2019Dec.xlsx")
dth_admin_2019jan2020may_full <- rbind(dth_admin_2019jan, dth_admin_2019jul,
                                       dth_admin_2020jan, dth_admin_2019jan_noant)

# Bedflow data
dth_bed_2019jan <- datf("Jan 2019 - May 2020 - v1-T\\32HN_ITS_DTH_Bedflow_from 2019Jan to 2019Jun.xlsx")
dth_bed_2019jul <- datf("Jan 2019 - May 2020 - v1-T\\32HN_ITS_DTH_Bedflow_from 2019Jul to 2019Dec.xlsx")
dth_bed_2020jan <- datf("Jan 2019 - May 2020 - v1-T\\32HN_ITS_DTH_Bedflow_from 2020Jan to 2020May.xlsx")
dth_bed_2019jan_noant <- datf("Jan 2019 - May 2020 - v1-T\\32HN_ITS_DTH_Bedflow_No Antibiotic_from 2019Jan to 2019Dec.xlsx")
dth_bed_2019jan2020may_full <- rbind(dth_bed_2019jan, dth_bed_2019jul,
                                     dth_bed_2020jan, dth_bed_2019jan_noant)

# Drug data
dth_drug_2019jan <- datf("Jan 2019 - May 2020 - v1-T\\32HN_ITS_DTH_Drug_from 2019Jan to 2019Jun.xlsx")
dth_drug_2019jul <- datf("Jan 2019 - May 2020 - v1-T\\32HN_ITS_DTH_Drug_from 2019Jul to 2019Dec.xlsx")
dth_drug_2020jan <- datf("Jan 2019 - May 2020 - v1-T\\32HN_ITS_DTH_Drug_from 2020Jan to 2020May.xlsx")
dth_drug_2019jan_noant <- datf("Jan 2019 - May 2020 - v1-T\\32HN_ITS_DTH_Drug_No Antibiotic_from 2019Jan to 2019Dec.xlsx")

dth_drug_2019jan2020may_full <- rbind(dth_drug_2019jan, dth_drug_2019jul,
                                      dth_drug_2020jan, dth_drug_2019jan_noant)
### Export data
write_excel_csv(dth_admin_2019jan, "dth_admin_2019jan_unicodeconvert.csv")
write_excel_csv(dth_admin_2019jul, "dth_admin_2019jul_unicodeconvert.csv")
write_excel_csv(dth_admin_2020jan, "dth_admin_2020jan_unicodeconvert.csv")
write_excel_csv(dth_admin_2019jan_noant, "dth_admin_2019jan_noant_unicodeconvert.csv")
write_excel_csv(dth_admin_2019jan2020may_full, "dth_admin_2019jan2020may_full_unicodeconvert.csv")

write_excel_csv(dth_bed_2019jan, "dth_bed_2019jan_unicodeconvert.csv")
write_excel_csv(dth_bed_2019jul, "dth_bed_2019jul_unicodeconvert.csv")
write_excel_csv(dth_bed_2020jan, "dth_bed_2020jan_unicodeconvert.csv")
write_excel_csv(dth_bed_2019jan_noant, "dth_bed_2019jan_noant_unicodeconvert.csv")
write_excel_csv(dth_bed_2019jan2020may_full, "dth_bed_2019jan2020may_full_unicodeconvert.csv")


write_excel_csv(dth_drug_2019jan, "dth_drug_2019jan_unicodeconvert.csv")
write_excel_csv(dth_drug_2019jul, "dth_drug_2019jul_unicodeconvert.csv")
write_excel_csv(dth_drug_2020jan, "dth_drug_2020jan_unicodeconvert.csv")
write_excel_csv(dth_drug_2019jan_noant, "dth_drug_2019jan_noant_unicodeconvert.csv")
write_excel_csv(dth_drug_2019jan2020may_full, "dth_drug_2019jan2020may_full_unicodeconvert.csv")
