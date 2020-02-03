# Useful for comparing package performance across versions

## In order for install_github to find the non-CRAN dependencies, remotes have to be identified
## in the GH package Description file.  Pavel has now done that for the statnet packages, so all
## Depends, Imports and Links will be installed in the dev_mode folder also.
## (ask is set to T, so you'll need to respond when asked).

# You can explicitly create a directory with dev_mode -- commented
# out code for doing that.

#my_dev <- paste0(.libPaths()[1], "/GitHubDev")
devtools::dev_mode() #on = TRUE, path = my_dev)

# 2. Change package as needed.

remotes::install_github("statnet/ergm-private", 
                        ref = "dev")
    
devtools::dev_mode()    
