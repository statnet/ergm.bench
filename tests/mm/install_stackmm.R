install.packages(c("remotes", "sessioninfo"))
loadedNamespaces() #check for Namespaces loaded by default
defaultPaths <- .libPaths()

devtools::dev_mode()
remotes::install_github(c("statnet/ergm@master", #depends = statnet.common, network
                          "statnet/tergm@master", #616fdfd24 depends = networkDynamic
                          "statnet/ergm.ego@master",
                          "statnet/EpiModel@master",
                          "statnet/EpiModelHPC@master",
                          "statnet/tergmLite@master",
                          "EpiModel/EpiABC@c32ecb6",
                          "EpiModel/EpiModelHIV-p@WHAMP-2.0"),
                        upgrade = "ask")

#remotes::install_github("statnet/tergmLite@master", force = T)
devtools::dev_mode()


# Make ~/R-Dev 1st position in libPath
devPath <- "~/R-dev"
.libPaths(c(devPath, defaultPaths))
.libPaths()


## Install into R-test
devtools::dev_mode(path = '~/R-test')
remotes::install_github(c("statnet/ergm@8fce4b222")) #depends = statnet.common, network
devtools::dev_mode()


# Make ~/R-Dev 1st position in libPath
testPath <- "~/R-test"
.libPaths(c(testPath, defaultPaths))
.libPaths()


library(EpiModelHIV)

options(width = 100)
sessioninfo::package_info(pkgs = c("network", "networkDynamic", "statnet.common",
                                   "ergm", "tergm", "EpiModel", "EpiModelHPC",
                                   "tergmLite", "EpiABC", "EpiModelHIV",
                                   "ARTnetData", "ARTnet"), dependencies = FALSE)

##### Package version used (mm)
# package        * version     date       lib source                                 
# ARTnet           2.0.0       2020-02-13 [1] Github (epimodel/ARTnet@f32ff8f)       
# ARTnetData       1.1         2020-02-12 [1] Github (epimodel/ARTnetData@d5423b2)   
# EpiABC           1.0         2020-02-01 [2] Github (EpiModel/EpiABC@c32ecb6)       
# EpiModel       * 1.8.0       2020-02-24 [1] Github (statnet/EpiModel@1a609be)      
# EpiModelHIV    * 1.5.0       2020-02-24 [1] Github (EpiModel/EpiModelHIV-p@6102b0d)
# EpiModelHPC    * 2.1.0       2020-02-24 [1] Github (statnet/EpiModelHPC@257bbf3)   
# ergm           * 3.10.4-5400 2020-02-24 [1] Github (statnet/ergm@aeac0ce)          
# network        * 1.17.0-411  2020-02-24 [1] Github (statnet/network@87f47bb)       
# networkDynamic * 0.10.1      2020-02-24 [1] Github (statnet/networkDynamic@157dede)
# statnet.common   4.4.0-258   2020-02-25 [1] Github (statnet/statnet.common@ba376e1)
# tergm          * 3.6.2-1883  2020-02-25 [1] Github (statnet/tergm@616fdfd)         
# tergmLite      * 2.1.7       2020-02-25 [1] Github (statnet/tergmLite@b989564)     

# [1] C:/Users/Martina Morris/Documents/R-dev
# [2] C:/Users/Martina Morris/Documents/R/win-library/3.6
# [3] C:/Program Files/R/R-3.6.2/library

##### Package version used (Zoe)
# package        * version    date       lib source                                 
# ARTnet           2.0.0      2020-01-17 [1] local                                  
# ARTnetData       1.0        2019-11-13 [1] local                                  
# EpiABC           1.0        2019-12-19 [1] Github (EpiModel/EpiABC@c32ecb6)       
# EpiModel       * 1.7.3      2019-12-19 [1] Github (statnet/EpiModel@2c131f0)      
# EpiModelHIV    * 1.5.0      2020-02-19 [1] local                                  
# EpiModelHPC    * 2.0.2      2019-12-19 [1] Github (statnet/EpiModelHPC@a64dbf2)   
# ergm           * 3.10.4     2019-12-19 [1] Github (statnet/ergm@3ce3a88)          
# network        * 1.16.0     2019-12-01 [1] CRAN (R 3.6.2)                         
# networkDynamic * 0.10       2019-12-19 [1] Github (statnet/networkDynamic@14182bf)
# statnet.common   4.4.0-252  2019-12-19 [1] Github (statnet/statnet.common@635bf7c)
# tergm          * 3.6.0-1659 2019-12-19 [1] Github (statnet/tergm@d3af135)         
# tergmLite      * 2.0.0      2019-12-20 [1] Github (statnet/tergmLite@4a96d5e) 
