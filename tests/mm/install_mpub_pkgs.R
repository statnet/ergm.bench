
####################################################################################
# Master public branches

devtools::dev_mode(path = '~/R-mpub')
remotes::install_github(c("statnet/ergm@master", upgrade = T))#, #depends = statnet.common, network
# 
#                           "statnet/tergm@master", #616fdfd24 depends = networkDynamic
#                           "statnet/ergm.ego@master",
#                           "statnet/EpiModel@master",
#                           "statnet/EpiModelHPC@master",
#                           "statnet/tergmLite@master",
#                           "EpiModel/EpiABC@c32ecb6",
#                           "EpiModel/EpiModelHIV-p@WHAMP-2.0"),
#                         upgrade = "ask")

devtools::dev_mode()


# Make ~/R-test 1st position in libPath
# Note -- needs defaultPaths to be set already, so as not to clobber that in
# test scripts that install/load different versions.

testPath <- "~/R-mpub"
.libPaths(c(testPath, defaultPaths))
.libPaths()

library(ergm.ego)

options(width = 100)
sessioninfo::package_info(pkgs = c("network", "statnet.common",
                                   "ergm", "ergm.ego"), dependencies = FALSE)