##Creating Ego Weights


wide_data <- DSdata::sam_ergm_wide

## Generating Ego Weights based on observed ego demographics, with reweighting to match Washington State.

pop_inf <- DSdata::pop.totals
age_cnts <- pop_inf$pop.age
aac <- rbind(age_cnts[age_cnts$age_cat_rwt == c("15-24"), ],
             c("25-34", sum(age_cnts[age_cnts$age_cat_rwt %in% c("25-29", "30-34"), "Freq"])),
             c("35-44", sum(age_cnts[age_cnts$age_cat_rwt %in% c("35-39", "40-44"), "Freq"])),
             c("45-54", sum(age_cnts[age_cnts$age_cat_rwt %in% c("45-49", "50-54"), "Freq"])),
             c("55-65", sum(age_cnts[age_cnts$age_cat_rwt %in% c("55-59", "60-65"), "Freq"])))

aac$age_cat_rwt <- factor(aac$age_cat_rwt, 
                          levels = c("15-24", "25-34", "35-44", "45-54", "55-65"))
aac$Freq <- as.numeric(aac$Freq)

race_cnts <- pop_inf$pop.hbo

hbo_cnts <- pop_inf$pop.hbo

ego_dems <- wide_data[, c("AMIS_ID", "age.grp", "race.cat3")]
ego_dems$race.cat3 <- c("Black", "Hispanic", "Other")[ego_dems$race.cat3]
ego_dems$race.cat3 <- factor(ego_dems$race.cat3, levels = c("Black", "Hispanic", "Other"))
ego_dems$age.grp <- c("15-24", "25-34", "35-44", 
                      "45-54", "55-65", "55-65")[ego_dems$age.grp]
ego_dems$age.grp <- factor(ego_dems$age.grp,
                           levels = c("15-24", "25-34", "35-44", "45-54", "55-65"))
colnames(ego_dems) <- c("ego.id", "age_cat_rwt", "hbo")


egos_svy <- suppressWarnings(survey::svydesign(id=~1, data = ego_dems))
egos_raked <-  survey::rake(egos_svy, list(~hbo, ~age_cat_rwt), list(hbo_cnts, aac))
wts <- cbind.data.frame("AMIS_ID" = egos_raked$variables$ego.id,
                        "weight" = (1/egos_raked$prob), stringsAsFactors = FALSE)
saveRDS(wts, "WAweights.rds")



