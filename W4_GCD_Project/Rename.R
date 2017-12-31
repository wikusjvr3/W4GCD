# **********************************************************************
# Function: RenderName
# Author: Wikus Janse van Rensburg (github_ID: wikusjvr3)
# This function will remove any invalid characters, standarise variables
# and remove duplicated words.
# **********************************************************************


RenderName <- function(x){
    if(grepl("^[t]",x)==TRUE){
        x <- gsub("^[t]","Time",x)


    } else if(grepl("^[f]",x)==TRUE){
        x <- gsub("^[f]","Freq",x)

    }

    if (grepl("-",x)==TRUE){
        x <- gsub("-","",x)

    }

    if (grepl("[()]",x)==TRUE){
        x <- gsub("[()]","",x)

    }

    if (grepl("[Ss]td",x)==TRUE){
        x <- gsub("[Ss]td","Stdev",x)

    }

    if (grepl("[Mm]eanFreq",x)==TRUE){
        x <- gsub("[Mm]eanFreq","Freqavg",x)

    }

    if (grepl("[Mm]ean",x)==TRUE){
        x <- gsub("[Mm]ean","Mean",x)

    }


     y <- gsub(pattern = "([[:upper:]])",replacement = " \\1",x = x)
     x <- unlist(sapply(y,strsplit, " "))
     y <- unique(x)
     x <- y[y>0]

     y <- paste0(x,collapse = "")

    return(y)
}
