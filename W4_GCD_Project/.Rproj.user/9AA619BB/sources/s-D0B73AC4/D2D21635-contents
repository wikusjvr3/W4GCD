# **********************************************************************
# Function: CodeBook
# Author: Wikus Janse van Rensburg (github_ID: wikusjvr3)
# This function will create a text file suitable for easy import to .md
# file as a list.  The column names are default and cannot exceed length
# four.
# **********************************************************************

CodeBook <- function(x,filename, colname = c("Column", "FieldName",
                                             "Description", "Type")) {
       for (i in seq_len(ncol(x))) {
        if (i > 4){break
        } else {
            vec <- paste(rep("-", max(nchar(as.character(x[,i])))),sep="",
                         collapse="")
            vec2df <- as.data.frame(vec,stringsAsFactors = FALSE)

            names(vec2df) <- colname[i]
                if (i == 1) {
                    namesforx <- colname[i]
                    tableSep <- vec2df
                } else {
                    namesforx <- c(namesforx,colname[i])
                    tableSep <- cbind(tableSep,vec2df)
                }
        }
    }

    names(x) <- namesforx
    codebookDF <- rbind(tableSep,x)
    fwrite(codebookDF,filename,sep = "|")

    rm(codebookDF)
    rm(vec)
    rm(vec2df)
    rm(namesforx)
    rm(tableSep)
}
