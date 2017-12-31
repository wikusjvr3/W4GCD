# **********************************************************************
# Function: AddDescn
# Author: Wikus Janse van Rensburg (github_ID: wikusjvr3)
# This function create a description of the variables based on set indicators
# **********************************************************************


AddDescn <- function(x){
    if(grepl("Time",x)==TRUE){
        z <- paste("Time domain signal for")
    }

    if(grepl("Freq",x)==TRUE){
        z <- paste("Frequency domain signal for")
    }

    if(grepl("Mean",x)==TRUE){
        z <- paste(z,"the Mean value of")
    }

    if(grepl("Stdev",x)==TRUE){
        z <- paste(z,"the Standard Deviation value of")
    }

    if(grepl("Freqavg",x)==TRUE){
        z <- paste(z,"the Weighted average of the frequency components of")
    }

    if(grepl(pattern = "Body",x)==TRUE){
        z <- paste(z,"the Body's")
    }

    if(grepl("Gravity",x)==TRUE){
        z <- paste(z,"the Gravity")
    }

    if(grepl("Acc",x)==TRUE){
        z <- paste(z,"acceleration measure")
    }

    if(grepl("Gyro",x)==TRUE){
        z <- paste(z,"Gyroscope measure")
    }

    if(grepl("Jerk",x)==TRUE){
        z <- paste(z,"for a Jerk movement")
    }

    if(grepl("Mag",x)==TRUE){
        z <- paste(z,"on a magnitude measure of the three-dimensional signals",
                   "calculated using the Euclidean norm.")
    }

    if(grepl("Subject",x)==TRUE){
        z <- "The Unique ID number given to volunteer."
    }

    if(grepl("Activity_code",x)==TRUE){
        z <- "Each activity type was given a number. See Actvty_fctrs"
    }

    if(grepl("Actvty_fctrs",x)==TRUE){
        z <- "1:Walking 2:Walking_Upstairs 3:Walking_Downstairs 4:Sitting 5:Standing 6:Laying"
    }

    if(grepl("X$",x)==TRUE){
        z <- paste(z," for the 3-axial raw signal X.")
    }
    if(grepl("Y$",x)==TRUE){
        z <- paste(z," for the 3-axial raw signal Y.")
    }
    if(grepl("Z$",x)==TRUE){
        z <- paste(z," for the 3-axial raw signal Z.")
    }
    return(z)
}
