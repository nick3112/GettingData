Project Description
-------------------

The purpose of this project is to demonstrate my ability to collect,
work with, and clean a data set. The goal is to prepare tidy data that
can be used for later analysis.

The data relate to accelerometer and gyroscope sensor signals collected
from 30 participants in a study while carrying out 6 activities

{WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING,
LAYING}.

The final output is a tidy dataset with named columns and a summary of
the mean and standard deviation statistics by Activity type and
participant.

Study design and data processing
--------------------------------

### Collection of the raw data

The raw data were downloaded from the site below:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

There is a test and train sample with 3 files: - subject, containing the
indicator of which of the 30 participants the dataline refers to - x,
containing the sensor readings with a variety of metrics (mean, min,
max, std, etc) for each of the available sensors - y, contianing the
reference from 1-6 for which activity was being observed on the
dataline.

### Notes on the original (raw) data

Some additional notes (if avaialble, otherwise you can leave this
section out).

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years. Each person performed six
activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING,
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the
waist. Using its embedded accelerometer and gyroscope, we captured
3-axial linear acceleration and 3-axial angular velocity at a constant
rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two
sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window). The sensor
acceleration signal, which has gravitational and body motion components,
was separated using a Butterworth low-pass filter into body acceleration
and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency
was used. From each window, a vector of features was obtained by
calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset.

A video of the experiment including an example of the 6 recorded
activities with one of the participants can be seen in the following
link: <http://www.youtube.com/watch?v=XOEN9W05_4A>

Creating the tidy datafile
--------------------------

### Guide to create the tidy data file

All the processing is included in the R script "Assignment.r" which is
in the GitHub Repo. The steps are as follows:

1.  The data was download and unzip the file
2.  Import the 6 files from test and train
3.  Merge the datasets to crease *subject, x, y*
4.  Minimise the columns of dataset *x* to include only the mean and
    standard deviation measurements from the sensors to create the
    *x\_clean* dataset.
5.  Apply appropriate column names of all datasets *subject, y,
    x\_clean* and merge them to create the *full* dataset
6.  Summarise the *full* dataset by taking the mean of each of the
    sensor readings by subject and activity to create the *full\_sum*
    dataset
7.  Output the *full\_sum* dataset to a *tidydata.csv* file

Description of the variables in the tiny\_data.txt file
-------------------------------------------------------

The general attributes of the data are below:

Data dimensions with 1 row for eachof the 6 activities by each of the 30
participants giving 180 rows. There are 81 variables including Subject
and Activity leaving 79 mean sensor measurements:

    dim(tidyT)

    ## [1] 180  81

The column names are as below

    names(tidyT)

    ##  [1] "Subject"                         "Activity"                       
    ##  [3] "tBodyAcc.mean...X"               "tBodyAcc.mean...Y"              
    ##  [5] "tBodyAcc.mean...Z"               "tBodyAcc.std...X"               
    ##  [7] "tBodyAcc.std...Y"                "tBodyAcc.std...Z"               
    ##  [9] "tGravityAcc.mean...X"            "tGravityAcc.mean...Y"           
    ## [11] "tGravityAcc.mean...Z"            "tGravityAcc.std...X"            
    ## [13] "tGravityAcc.std...Y"             "tGravityAcc.std...Z"            
    ## [15] "tBodyAccJerk.mean...X"           "tBodyAccJerk.mean...Y"          
    ## [17] "tBodyAccJerk.mean...Z"           "tBodyAccJerk.std...X"           
    ## [19] "tBodyAccJerk.std...Y"            "tBodyAccJerk.std...Z"           
    ## [21] "tBodyGyro.mean...X"              "tBodyGyro.mean...Y"             
    ## [23] "tBodyGyro.mean...Z"              "tBodyGyro.std...X"              
    ## [25] "tBodyGyro.std...Y"               "tBodyGyro.std...Z"              
    ## [27] "tBodyGyroJerk.mean...X"          "tBodyGyroJerk.mean...Y"         
    ## [29] "tBodyGyroJerk.mean...Z"          "tBodyGyroJerk.std...X"          
    ## [31] "tBodyGyroJerk.std...Y"           "tBodyGyroJerk.std...Z"          
    ## [33] "tBodyAccMag.mean.."              "tBodyAccMag.std.."              
    ## [35] "tGravityAccMag.mean.."           "tGravityAccMag.std.."           
    ## [37] "tBodyAccJerkMag.mean.."          "tBodyAccJerkMag.std.."          
    ## [39] "tBodyGyroMag.mean.."             "tBodyGyroMag.std.."             
    ## [41] "tBodyGyroJerkMag.mean.."         "tBodyGyroJerkMag.std.."         
    ## [43] "fBodyAcc.mean...X"               "fBodyAcc.mean...Y"              
    ## [45] "fBodyAcc.mean...Z"               "fBodyAcc.std...X"               
    ## [47] "fBodyAcc.std...Y"                "fBodyAcc.std...Z"               
    ## [49] "fBodyAcc.meanFreq...X"           "fBodyAcc.meanFreq...Y"          
    ## [51] "fBodyAcc.meanFreq...Z"           "fBodyAccJerk.mean...X"          
    ## [53] "fBodyAccJerk.mean...Y"           "fBodyAccJerk.mean...Z"          
    ## [55] "fBodyAccJerk.std...X"            "fBodyAccJerk.std...Y"           
    ## [57] "fBodyAccJerk.std...Z"            "fBodyAccJerk.meanFreq...X"      
    ## [59] "fBodyAccJerk.meanFreq...Y"       "fBodyAccJerk.meanFreq...Z"      
    ## [61] "fBodyGyro.mean...X"              "fBodyGyro.mean...Y"             
    ## [63] "fBodyGyro.mean...Z"              "fBodyGyro.std...X"              
    ## [65] "fBodyGyro.std...Y"               "fBodyGyro.std...Z"              
    ## [67] "fBodyGyro.meanFreq...X"          "fBodyGyro.meanFreq...Y"         
    ## [69] "fBodyGyro.meanFreq...Z"          "fBodyAccMag.mean.."             
    ## [71] "fBodyAccMag.std.."               "fBodyAccMag.meanFreq.."         
    ## [73] "fBodyBodyAccJerkMag.mean.."      "fBodyBodyAccJerkMag.std.."      
    ## [75] "fBodyBodyAccJerkMag.meanFreq.."  "fBodyBodyGyroMag.mean.."        
    ## [77] "fBodyBodyGyroMag.std.."          "fBodyBodyGyroMag.meanFreq.."    
    ## [79] "fBodyBodyGyroJerkMag.mean.."     "fBodyBodyGyroJerkMag.std.."     
    ## [81] "fBodyBodyGyroJerkMag.meanFreq.."

### Variable 1: Subject

The variable indicates the subject that the sensor data refers to from
the 1-30 participants involved

Data dimensions with 1 row for each 6

    t<-as.data.frame(table(tidyT$Subject));
    names(t)<-c("Participant","RowCount")
    t

    ##    Participant RowCount
    ## 1            1        6
    ## 2            2        6
    ## 3            3        6
    ## 4            4        6
    ## 5            5        6
    ## 6            6        6
    ## 7            7        6
    ## 8            8        6
    ## 9            9        6
    ## 10          10        6
    ## 11          11        6
    ## 12          12        6
    ## 13          13        6
    ## 14          14        6
    ## 15          15        6
    ## 16          16        6
    ## 17          17        6
    ## 18          18        6
    ## 19          19        6
    ## 20          20        6
    ## 21          21        6
    ## 22          22        6
    ## 23          23        6
    ## 24          24        6
    ## 25          25        6
    ## 26          26        6
    ## 27          27        6
    ## 28          28        6
    ## 29          29        6
    ## 30          30        6

The data are numeric from 1-30 with 6 observations for each; one
observation for each Activity measured. file)

### Variable 2: Activity

The variable indicates the subject that the sensor data refers to from
the 1-30 participants involved

Data dimensions with 1 row for each 6

    q<-as.data.frame(table(tidyT$Activity));
    names(t)<-c("Activity","RowCount")
    q

    ##                 Var1 Freq
    ## 1             LAYING   30
    ## 2            SITTING   30
    ## 3           STANDING   30
    ## 4            WALKING   30
    ## 5 WALKING_DOWNSTAIRS   30
    ## 6   WALKING_UPSTAIRS   30

The data are text with 30 observations for each; one observation for
each participant measured in the study.

### Variable 3-81: Mean of Sensor Observations

A sample of the first 6 rows of the data from the 79 saensor factors is
included below: these are all numeric in type.

    head(tidyT[,3:81])

    ##   tBodyAcc.mean...X tBodyAcc.mean...Y tBodyAcc.mean...Z tBodyAcc.std...X
    ## 1         0.2773308      -0.017383819        -0.1111481      -0.28374026
    ## 2         0.2554617      -0.023953149        -0.0973020      -0.35470803
    ## 3         0.2891883      -0.009918505        -0.1075662       0.03003534
    ## 4         0.2612376      -0.001308288        -0.1045442      -0.97722901
    ## 5         0.2789176      -0.016137590        -0.1106018      -0.99575990
    ## 6         0.2215982      -0.040513953        -0.1132036      -0.92805647
    ##   tBodyAcc.std...Y tBodyAcc.std...Z tGravityAcc.mean...X
    ## 1      0.114461337      -0.26002790            0.9352232
    ## 2     -0.002320265      -0.01947924            0.8933511
    ## 3     -0.031935943      -0.23043421            0.9318744
    ## 4     -0.922618642      -0.93958629            0.8315099
    ## 5     -0.973190056      -0.97977588            0.9429520
    ## 6     -0.836827406      -0.82606140           -0.2488818
    ##   tGravityAcc.mean...Y tGravityAcc.mean...Z tGravityAcc.std...X
    ## 1           -0.2821650          -0.06810286          -0.9766096
    ## 2           -0.3621534          -0.07540294          -0.9563670
    ## 3           -0.2666103          -0.06211996          -0.9505598
    ## 4            0.2044116           0.33204370          -0.9684571
    ## 5           -0.2729838           0.01349058          -0.9937630
    ## 6            0.7055498           0.44581772          -0.8968300
    ##   tGravityAcc.std...Y tGravityAcc.std...Z tBodyAccJerk.mean...X
    ## 1          -0.9713060          -0.9477172            0.07404163
    ## 2          -0.9528492          -0.9123794            0.10137273
    ## 3          -0.9370187          -0.8959397            0.05415532
    ## 4          -0.9355171          -0.9490409            0.07748252
    ## 5          -0.9812260          -0.9763241            0.07537665
    ## 6          -0.9077200          -0.8523663            0.08108653
    ##   tBodyAccJerk.mean...Y tBodyAccJerk.mean...Z tBodyAccJerk.std...X
    ## 1          0.0282721096          -0.004168406          -0.11361560
    ## 2          0.0194863076          -0.045562545          -0.44684389
    ## 3          0.0296504490          -0.010971973          -0.01228386
    ## 4         -0.0006191028          -0.003367792          -0.98643071
    ## 5          0.0079757309          -0.003685250          -0.99460454
    ## 6          0.0038382040           0.010834236          -0.95848211
    ##   tBodyAccJerk.std...Y tBodyAccJerk.std...Z tBodyGyro.mean...X
    ## 1            0.0670025           -0.5026998        -0.04183096
    ## 2           -0.3782744           -0.7065935         0.05054938
    ## 3           -0.1016014           -0.3457350        -0.03507819
    ## 4           -0.9813720           -0.9879108        -0.04535006
    ## 5           -0.9856487           -0.9922512        -0.02398773
    ## 6           -0.9241493           -0.9548551        -0.01655309
    ##   tBodyGyro.mean...Y tBodyGyro.mean...Z tBodyGyro.std...X
    ## 1        -0.06953005         0.08494482        -0.4735355
    ## 2        -0.16617002         0.05835955        -0.5448711
    ## 3        -0.09093713         0.09008501        -0.4580305
    ## 4        -0.09192415         0.06293138        -0.9772113
    ## 5        -0.05939722         0.07480075        -0.9871919
    ## 6        -0.06448612         0.14868944        -0.8735439
    ##   tBodyGyro.std...Y tBodyGyro.std...Z tBodyGyroJerk.mean...X
    ## 1      -0.054607769        -0.3442666            -0.08999754
    ## 2       0.004105184        -0.5071687            -0.12223277
    ## 3      -0.126349195        -0.1247025            -0.07395920
    ## 4      -0.966473895        -0.9414259            -0.09367938
    ## 5      -0.987734440        -0.9806456            -0.09960921
    ## 6      -0.951090440        -0.9082847            -0.10727095
    ##   tBodyGyroJerk.mean...Y tBodyGyroJerk.mean...Z tBodyGyroJerk.std...X
    ## 1            -0.03984287            -0.04613093            -0.2074219
    ## 2            -0.04214859            -0.04071255            -0.6147865
    ## 3            -0.04399028            -0.02704611            -0.4870273
    ## 4            -0.04021181            -0.04670263            -0.9917316
    ## 5            -0.04406279            -0.04895055            -0.9929451
    ## 6            -0.04151729            -0.07405012            -0.9186085
    ##   tBodyGyroJerk.std...Y tBodyGyroJerk.std...Z tBodyAccMag.mean..
    ## 1            -0.3044685            -0.4042555        -0.13697118
    ## 2            -0.6016967            -0.6063320        -0.12992763
    ## 3            -0.2388248            -0.2687615         0.02718829
    ## 4            -0.9895181            -0.9879358        -0.94853679
    ## 5            -0.9951379            -0.9921085        -0.98427821
    ## 6            -0.9679072            -0.9577902        -0.84192915
    ##   tBodyAccMag.std.. tGravityAccMag.mean.. tGravityAccMag.std..
    ## 1       -0.21968865           -0.13697118          -0.21968865
    ## 2       -0.32497093           -0.12992763          -0.32497093
    ## 3        0.01988435            0.02718829           0.01988435
    ## 4       -0.92707842           -0.94853679          -0.92707842
    ## 5       -0.98194293           -0.98427821          -0.98194293
    ## 6       -0.79514486           -0.84192915          -0.79514486
    ##   tBodyAccJerkMag.mean.. tBodyAccJerkMag.std.. tBodyGyroMag.mean..
    ## 1            -0.14142881           -0.07447175         -0.16097955
    ## 2            -0.46650345           -0.47899162         -0.12673559
    ## 3            -0.08944748           -0.02578772         -0.07574125
    ## 4            -0.98736420           -0.98412002         -0.93089249
    ## 5            -0.99236779           -0.99309621         -0.97649379
    ## 6            -0.95439626           -0.92824563         -0.87475955
    ##   tBodyGyroMag.std.. tBodyGyroJerkMag.mean.. tBodyGyroJerkMag.std..
    ## 1         -0.1869784              -0.2987037             -0.3253249
    ## 2         -0.1486193              -0.5948829             -0.6485530
    ## 3         -0.2257244              -0.2954638             -0.3065106
    ## 4         -0.9345318              -0.9919763             -0.9883087
    ## 5         -0.9786900              -0.9949668             -0.9947332
    ## 6         -0.8190102              -0.9634610             -0.9358410
    ##   fBodyAcc.mean...X fBodyAcc.mean...Y fBodyAcc.mean...Z fBodyAcc.std...X
    ## 1       -0.20279431       0.089712726        -0.3315601      -0.31913472
    ## 2       -0.40432178      -0.190976721        -0.4333497      -0.33742819
    ## 3        0.03822918       0.001549908        -0.2255745       0.02433084
    ## 4       -0.97964124      -0.944084550        -0.9591849      -0.97641231
    ## 5       -0.99524993      -0.977070848        -0.9852971      -0.99602835
    ## 6       -0.93909905      -0.867065205        -0.8826669      -0.92443743
    ##   fBodyAcc.std...Y fBodyAcc.std...Z fBodyAcc.meanFreq...X
    ## 1       0.05604001      -0.27968675           -0.20754837
    ## 2       0.02176951       0.08595655           -0.41873500
    ## 3      -0.11296374      -0.29792789           -0.30739520
    ## 4      -0.91727501      -0.93446956           -0.04951360
    ## 5      -0.97229310      -0.97793726            0.08651536
    ## 6      -0.83362556      -0.81289156           -0.15879267
    ##   fBodyAcc.meanFreq...Y fBodyAcc.meanFreq...Z fBodyAccJerk.mean...X
    ## 1            0.11309365            0.04972652           -0.17054696
    ## 2           -0.16069721           -0.52011479           -0.47987525
    ## 3            0.06322008            0.29432270           -0.02766387
    ## 4            0.07594608            0.23882987           -0.98659702
    ## 5            0.11747895            0.24485859           -0.99463080
    ## 6            0.09753484            0.08943766           -0.95707388
    ##   fBodyAccJerk.mean...Y fBodyAccJerk.mean...Z fBodyAccJerk.std...X
    ## 1           -0.03522552            -0.4689992           -0.1335866
    ## 2           -0.41344459            -0.6854744           -0.4619070
    ## 3           -0.12866716            -0.2883347           -0.0863279
    ## 4           -0.98157947            -0.9860531           -0.9874930
    ## 5           -0.98541870            -0.9907522           -0.9950738
    ## 6           -0.92246261            -0.9480609           -0.9641607
    ##   fBodyAccJerk.std...Y fBodyAccJerk.std...Z fBodyAccJerk.meanFreq...X
    ## 1            0.1067399           -0.5347134                -0.2092620
    ## 2           -0.3817771           -0.7260402                -0.3770231
    ## 3           -0.1345800           -0.4017215                -0.2531643
    ## 4           -0.9825139           -0.9883392                 0.2566108
    ## 5           -0.9870182           -0.9923498                 0.3141829
    ## 6           -0.9322179           -0.9605870                 0.1324191
    ##   fBodyAccJerk.meanFreq...Y fBodyAccJerk.meanFreq...Z fBodyGyro.mean...X
    ## 1               -0.38623714              -0.185530281         -0.3390322
    ## 2               -0.50949553              -0.551104284         -0.4926117
    ## 3               -0.33758970               0.009372239         -0.3524496
    ## 4                0.04754378               0.092392003         -0.9761615
    ## 5                0.03916190               0.138581479         -0.9863868
    ## 6                0.02451362               0.024387945         -0.8502492
    ##   fBodyGyro.mean...Y fBodyGyro.mean...Z fBodyGyro.std...X
    ## 1        -0.10305942        -0.25594094        -0.5166919
    ## 2        -0.31947461        -0.45359721        -0.5658925
    ## 3        -0.05570225        -0.03186943        -0.4954225
    ## 4        -0.97583859        -0.95131554        -0.9779042
    ## 5        -0.98898446        -0.98077312        -0.9874971
    ## 6        -0.95219149        -0.90930272        -0.8822965
    ##   fBodyGyro.std...Y fBodyGyro.std...Z fBodyGyro.meanFreq...X
    ## 1       -0.03350816        -0.4365622            0.014784499
    ## 2        0.15153891        -0.5717078           -0.187450248
    ## 3       -0.18141473        -0.2384436           -0.100453729
    ## 4       -0.96234504        -0.9439178            0.189153021
    ## 5       -0.98710773        -0.9823453           -0.120293021
    ## 6       -0.95123205        -0.9165825           -0.003546796
    ##   fBodyGyro.meanFreq...Y fBodyGyro.meanFreq...Z fBodyAccMag.mean..
    ## 1            -0.06577462           0.0007733216        -0.12862345
    ## 2            -0.47357479          -0.1333739043        -0.35239594
    ## 3             0.08255115          -0.0756762068         0.09658453
    ## 4             0.06312707          -0.0297839207        -0.94778292
    ## 5            -0.04471920           0.1006076351        -0.98535636
    ## 6            -0.09152913           0.0104581257        -0.86176765
    ##   fBodyAccMag.std.. fBodyAccMag.meanFreq.. fBodyBodyAccJerkMag.mean..
    ## 1        -0.3980326             0.19064372                -0.05711940
    ## 2        -0.4162601            -0.09774335                -0.44265216
    ## 3        -0.1865303             0.11918714                 0.02621849
    ## 4        -0.9284448             0.23665501                -0.98526213
    ## 5        -0.9823138             0.28455529                -0.99254248
    ## 6        -0.7983009             0.08640856                -0.93330036
    ##   fBodyBodyAccJerkMag.std.. fBodyBodyAccJerkMag.meanFreq..
    ## 1                -0.1034924                     0.09382218
    ## 2                -0.5330599                     0.08535241
    ## 3                -0.1040523                     0.07649155
    ## 4                -0.9816062                     0.35185220
    ## 5                -0.9925360                     0.42222010
    ## 6                -0.9218040                     0.26639115
    ##   fBodyBodyGyroMag.mean.. fBodyBodyGyroMag.std..
    ## 1              -0.1992526             -0.3210180
    ## 2              -0.3259615             -0.1829855
    ## 3              -0.1857203             -0.3983504
    ## 4              -0.9584356             -0.9321984
    ## 5              -0.9846176             -0.9784661
    ## 6              -0.8621902             -0.8243194
    ##   fBodyBodyGyroMag.meanFreq.. fBodyBodyGyroJerkMag.mean..
    ## 1                0.2688443675                  -0.3193086
    ## 2               -0.2193033761                  -0.6346651
    ## 3                0.3496138955                  -0.2819634
    ## 4               -0.0002621867                  -0.9897975
    ## 5               -0.0286057725                  -0.9948154
    ## 6               -0.1397750127                  -0.9423669
    ##   fBodyBodyGyroJerkMag.std.. fBodyBodyGyroJerkMag.meanFreq..
    ## 1                 -0.3816019                       0.1906634
    ## 2                 -0.6939305                       0.1142773
    ## 3                 -0.3919199                       0.1900007
    ## 4                 -0.9870496                       0.1847759
    ## 5                 -0.9946711                       0.3344987
    ## 6                 -0.9326607                       0.1764859

Below, a summary of the min, max, median and quartiles of the sensor
information. Note; the variables contain means of the mean and standard
deviation by Activity and SUbject, so the summary KPIs themselves are a
summary of those mean/standard deviation KPIs.

    summary(tidyT[,3:81])

    ##  tBodyAcc.mean...X tBodyAcc.mean...Y   tBodyAcc.mean...Z 
    ##  Min.   :0.2216    Min.   :-0.040514   Min.   :-0.15251  
    ##  1st Qu.:0.2712    1st Qu.:-0.020022   1st Qu.:-0.11207  
    ##  Median :0.2770    Median :-0.017262   Median :-0.10819  
    ##  Mean   :0.2743    Mean   :-0.017876   Mean   :-0.10916  
    ##  3rd Qu.:0.2800    3rd Qu.:-0.014936   3rd Qu.:-0.10443  
    ##  Max.   :0.3015    Max.   :-0.001308   Max.   :-0.07538  
    ##  tBodyAcc.std...X  tBodyAcc.std...Y   tBodyAcc.std...Z 
    ##  Min.   :-0.9961   Min.   :-0.99024   Min.   :-0.9877  
    ##  1st Qu.:-0.9799   1st Qu.:-0.94205   1st Qu.:-0.9498  
    ##  Median :-0.7526   Median :-0.50897   Median :-0.6518  
    ##  Mean   :-0.5577   Mean   :-0.46046   Mean   :-0.5756  
    ##  3rd Qu.:-0.1984   3rd Qu.:-0.03077   3rd Qu.:-0.2306  
    ##  Max.   : 0.6269   Max.   : 0.61694   Max.   : 0.6090  
    ##  tGravityAcc.mean...X tGravityAcc.mean...Y tGravityAcc.mean...Z
    ##  Min.   :-0.6800      Min.   :-0.47989     Min.   :-0.49509    
    ##  1st Qu.: 0.8376      1st Qu.:-0.23319     1st Qu.:-0.11726    
    ##  Median : 0.9208      Median :-0.12782     Median : 0.02384    
    ##  Mean   : 0.6975      Mean   :-0.01621     Mean   : 0.07413    
    ##  3rd Qu.: 0.9425      3rd Qu.: 0.08773     3rd Qu.: 0.14946    
    ##  Max.   : 0.9745      Max.   : 0.95659     Max.   : 0.95787    
    ##  tGravityAcc.std...X tGravityAcc.std...Y tGravityAcc.std...Z
    ##  Min.   :-0.9968     Min.   :-0.9942     Min.   :-0.9910    
    ##  1st Qu.:-0.9825     1st Qu.:-0.9711     1st Qu.:-0.9605    
    ##  Median :-0.9695     Median :-0.9590     Median :-0.9450    
    ##  Mean   :-0.9638     Mean   :-0.9524     Mean   :-0.9364    
    ##  3rd Qu.:-0.9509     3rd Qu.:-0.9370     3rd Qu.:-0.9180    
    ##  Max.   :-0.8296     Max.   :-0.6436     Max.   :-0.6102    
    ##  tBodyAccJerk.mean...X tBodyAccJerk.mean...Y tBodyAccJerk.mean...Z
    ##  Min.   :0.04269       Min.   :-0.0386872    Min.   :-0.067458    
    ##  1st Qu.:0.07396       1st Qu.: 0.0004664    1st Qu.:-0.010601    
    ##  Median :0.07640       Median : 0.0094698    Median :-0.003861    
    ##  Mean   :0.07947       Mean   : 0.0075652    Mean   :-0.004953    
    ##  3rd Qu.:0.08330       3rd Qu.: 0.0134008    3rd Qu.: 0.001958    
    ##  Max.   :0.13019       Max.   : 0.0568186    Max.   : 0.038053    
    ##  tBodyAccJerk.std...X tBodyAccJerk.std...Y tBodyAccJerk.std...Z
    ##  Min.   :-0.9946      Min.   :-0.9895      Min.   :-0.99329    
    ##  1st Qu.:-0.9832      1st Qu.:-0.9724      1st Qu.:-0.98266    
    ##  Median :-0.8104      Median :-0.7756      Median :-0.88366    
    ##  Mean   :-0.5949      Mean   :-0.5654      Mean   :-0.73596    
    ##  3rd Qu.:-0.2233      3rd Qu.:-0.1483      3rd Qu.:-0.51212    
    ##  Max.   : 0.5443      Max.   : 0.3553      Max.   : 0.03102    
    ##  tBodyGyro.mean...X tBodyGyro.mean...Y tBodyGyro.mean...Z
    ##  Min.   :-0.20578   Min.   :-0.20421   Min.   :-0.07245  
    ##  1st Qu.:-0.04712   1st Qu.:-0.08955   1st Qu.: 0.07475  
    ##  Median :-0.02871   Median :-0.07318   Median : 0.08512  
    ##  Mean   :-0.03244   Mean   :-0.07426   Mean   : 0.08744  
    ##  3rd Qu.:-0.01676   3rd Qu.:-0.06113   3rd Qu.: 0.10177  
    ##  Max.   : 0.19270   Max.   : 0.02747   Max.   : 0.17910  
    ##  tBodyGyro.std...X tBodyGyro.std...Y tBodyGyro.std...Z
    ##  Min.   :-0.9943   Min.   :-0.9942   Min.   :-0.9855  
    ##  1st Qu.:-0.9735   1st Qu.:-0.9629   1st Qu.:-0.9609  
    ##  Median :-0.7890   Median :-0.8017   Median :-0.8010  
    ##  Mean   :-0.6916   Mean   :-0.6533   Mean   :-0.6164  
    ##  3rd Qu.:-0.4414   3rd Qu.:-0.4196   3rd Qu.:-0.3106  
    ##  Max.   : 0.2677   Max.   : 0.4765   Max.   : 0.5649  
    ##  tBodyGyroJerk.mean...X tBodyGyroJerk.mean...Y tBodyGyroJerk.mean...Z
    ##  Min.   :-0.15721       Min.   :-0.07681       Min.   :-0.092500     
    ##  1st Qu.:-0.10322       1st Qu.:-0.04552       1st Qu.:-0.061725     
    ##  Median :-0.09868       Median :-0.04112       Median :-0.053430     
    ##  Mean   :-0.09606       Mean   :-0.04269       Mean   :-0.054802     
    ##  3rd Qu.:-0.09110       3rd Qu.:-0.03842       3rd Qu.:-0.048985     
    ##  Max.   :-0.02209       Max.   :-0.01320       Max.   :-0.006941     
    ##  tBodyGyroJerk.std...X tBodyGyroJerk.std...Y tBodyGyroJerk.std...Z
    ##  Min.   :-0.9965       Min.   :-0.9971       Min.   :-0.9954      
    ##  1st Qu.:-0.9800       1st Qu.:-0.9832       1st Qu.:-0.9848      
    ##  Median :-0.8396       Median :-0.8942       Median :-0.8610      
    ##  Mean   :-0.7036       Mean   :-0.7636       Mean   :-0.7096      
    ##  3rd Qu.:-0.4629       3rd Qu.:-0.5861       3rd Qu.:-0.4741      
    ##  Max.   : 0.1791       Max.   : 0.2959       Max.   : 0.1932      
    ##  tBodyAccMag.mean.. tBodyAccMag.std.. tGravityAccMag.mean..
    ##  Min.   :-0.9865    Min.   :-0.9865   Min.   :-0.9865      
    ##  1st Qu.:-0.9573    1st Qu.:-0.9430   1st Qu.:-0.9573      
    ##  Median :-0.4829    Median :-0.6074   Median :-0.4829      
    ##  Mean   :-0.4973    Mean   :-0.5439   Mean   :-0.4973      
    ##  3rd Qu.:-0.0919    3rd Qu.:-0.2090   3rd Qu.:-0.0919      
    ##  Max.   : 0.6446    Max.   : 0.4284   Max.   : 0.6446      
    ##  tGravityAccMag.std.. tBodyAccJerkMag.mean.. tBodyAccJerkMag.std..
    ##  Min.   :-0.9865      Min.   :-0.9928        Min.   :-0.9946      
    ##  1st Qu.:-0.9430      1st Qu.:-0.9807        1st Qu.:-0.9765      
    ##  Median :-0.6074      Median :-0.8168        Median :-0.8014      
    ##  Mean   :-0.5439      Mean   :-0.6079        Mean   :-0.5842      
    ##  3rd Qu.:-0.2090      3rd Qu.:-0.2456        3rd Qu.:-0.2173      
    ##  Max.   : 0.4284      Max.   : 0.4345        Max.   : 0.4506      
    ##  tBodyGyroMag.mean.. tBodyGyroMag.std.. tBodyGyroJerkMag.mean..
    ##  Min.   :-0.9807     Min.   :-0.9814    Min.   :-0.99732       
    ##  1st Qu.:-0.9461     1st Qu.:-0.9476    1st Qu.:-0.98515       
    ##  Median :-0.6551     Median :-0.7420    Median :-0.86479       
    ##  Mean   :-0.5652     Mean   :-0.6304    Mean   :-0.73637       
    ##  3rd Qu.:-0.2159     3rd Qu.:-0.3602    3rd Qu.:-0.51186       
    ##  Max.   : 0.4180     Max.   : 0.3000    Max.   : 0.08758       
    ##  tBodyGyroJerkMag.std.. fBodyAcc.mean...X fBodyAcc.mean...Y 
    ##  Min.   :-0.9977        Min.   :-0.9952   Min.   :-0.98903  
    ##  1st Qu.:-0.9805        1st Qu.:-0.9787   1st Qu.:-0.95361  
    ##  Median :-0.8809        Median :-0.7691   Median :-0.59498  
    ##  Mean   :-0.7550        Mean   :-0.5758   Mean   :-0.48873  
    ##  3rd Qu.:-0.5767        3rd Qu.:-0.2174   3rd Qu.:-0.06341  
    ##  Max.   : 0.2502        Max.   : 0.5370   Max.   : 0.52419  
    ##  fBodyAcc.mean...Z fBodyAcc.std...X  fBodyAcc.std...Y   fBodyAcc.std...Z 
    ##  Min.   :-0.9895   Min.   :-0.9966   Min.   :-0.99068   Min.   :-0.9872  
    ##  1st Qu.:-0.9619   1st Qu.:-0.9820   1st Qu.:-0.94042   1st Qu.:-0.9459  
    ##  Median :-0.7236   Median :-0.7470   Median :-0.51338   Median :-0.6441  
    ##  Mean   :-0.6297   Mean   :-0.5522   Mean   :-0.48148   Mean   :-0.5824  
    ##  3rd Qu.:-0.3183   3rd Qu.:-0.1966   3rd Qu.:-0.07913   3rd Qu.:-0.2655  
    ##  Max.   : 0.2807   Max.   : 0.6585   Max.   : 0.56019   Max.   : 0.6871  
    ##  fBodyAcc.meanFreq...X fBodyAcc.meanFreq...Y fBodyAcc.meanFreq...Z
    ##  Min.   :-0.63591      Min.   :-0.379518     Min.   :-0.52011     
    ##  1st Qu.:-0.39165      1st Qu.:-0.081314     1st Qu.:-0.03629     
    ##  Median :-0.25731      Median : 0.007855     Median : 0.06582     
    ##  Mean   :-0.23227      Mean   : 0.011529     Mean   : 0.04372     
    ##  3rd Qu.:-0.06105      3rd Qu.: 0.086281     3rd Qu.: 0.17542     
    ##  Max.   : 0.15912      Max.   : 0.466528     Max.   : 0.40253     
    ##  fBodyAccJerk.mean...X fBodyAccJerk.mean...Y fBodyAccJerk.mean...Z
    ##  Min.   :-0.9946       Min.   :-0.9894       Min.   :-0.9920      
    ##  1st Qu.:-0.9828       1st Qu.:-0.9725       1st Qu.:-0.9796      
    ##  Median :-0.8126       Median :-0.7817       Median :-0.8707      
    ##  Mean   :-0.6139       Mean   :-0.5882       Mean   :-0.7144      
    ##  3rd Qu.:-0.2820       3rd Qu.:-0.1963       3rd Qu.:-0.4697      
    ##  Max.   : 0.4743       Max.   : 0.2767       Max.   : 0.1578      
    ##  fBodyAccJerk.std...X fBodyAccJerk.std...Y fBodyAccJerk.std...Z
    ##  Min.   :-0.9951      Min.   :-0.9905      Min.   :-0.993108   
    ##  1st Qu.:-0.9847      1st Qu.:-0.9737      1st Qu.:-0.983747   
    ##  Median :-0.8254      Median :-0.7852      Median :-0.895121   
    ##  Mean   :-0.6121      Mean   :-0.5707      Mean   :-0.756489   
    ##  3rd Qu.:-0.2475      3rd Qu.:-0.1685      3rd Qu.:-0.543787   
    ##  Max.   : 0.4768      Max.   : 0.3498      Max.   :-0.006236   
    ##  fBodyAccJerk.meanFreq...X fBodyAccJerk.meanFreq...Y
    ##  Min.   :-0.57604          Min.   :-0.60197         
    ##  1st Qu.:-0.28966          1st Qu.:-0.39751         
    ##  Median :-0.06091          Median :-0.23209         
    ##  Mean   :-0.06910          Mean   :-0.22810         
    ##  3rd Qu.: 0.17660          3rd Qu.:-0.04721         
    ##  Max.   : 0.33145          Max.   : 0.19568         
    ##  fBodyAccJerk.meanFreq...Z fBodyGyro.mean...X fBodyGyro.mean...Y
    ##  Min.   :-0.62756          Min.   :-0.9931    Min.   :-0.9940   
    ##  1st Qu.:-0.30867          1st Qu.:-0.9697    1st Qu.:-0.9700   
    ##  Median :-0.09187          Median :-0.7300    Median :-0.8141   
    ##  Mean   :-0.13760          Mean   :-0.6367    Mean   :-0.6767   
    ##  3rd Qu.: 0.03858          3rd Qu.:-0.3387    3rd Qu.:-0.4458   
    ##  Max.   : 0.23011          Max.   : 0.4750    Max.   : 0.3288   
    ##  fBodyGyro.mean...Z fBodyGyro.std...X fBodyGyro.std...Y fBodyGyro.std...Z
    ##  Min.   :-0.9860    Min.   :-0.9947   Min.   :-0.9944   Min.   :-0.9867  
    ##  1st Qu.:-0.9624    1st Qu.:-0.9750   1st Qu.:-0.9602   1st Qu.:-0.9643  
    ##  Median :-0.7909    Median :-0.8086   Median :-0.7964   Median :-0.8224  
    ##  Mean   :-0.6044    Mean   :-0.7110   Mean   :-0.6454   Mean   :-0.6577  
    ##  3rd Qu.:-0.2635    3rd Qu.:-0.4813   3rd Qu.:-0.4154   3rd Qu.:-0.3916  
    ##  Max.   : 0.4924    Max.   : 0.1966   Max.   : 0.6462   Max.   : 0.5225  
    ##  fBodyGyro.meanFreq...X fBodyGyro.meanFreq...Y fBodyGyro.meanFreq...Z
    ##  Min.   :-0.395770      Min.   :-0.66681       Min.   :-0.50749      
    ##  1st Qu.:-0.213363      1st Qu.:-0.29433       1st Qu.:-0.15481      
    ##  Median :-0.115527      Median :-0.15794       Median :-0.05081      
    ##  Mean   :-0.104551      Mean   :-0.16741       Mean   :-0.05718      
    ##  3rd Qu.: 0.002655      3rd Qu.:-0.04269       3rd Qu.: 0.04152      
    ##  Max.   : 0.249209      Max.   : 0.27314       Max.   : 0.37707      
    ##  fBodyAccMag.mean.. fBodyAccMag.std.. fBodyAccMag.meanFreq..
    ##  Min.   :-0.9868    Min.   :-0.9876   Min.   :-0.31234      
    ##  1st Qu.:-0.9560    1st Qu.:-0.9452   1st Qu.:-0.01475      
    ##  Median :-0.6703    Median :-0.6513   Median : 0.08132      
    ##  Mean   :-0.5365    Mean   :-0.6210   Mean   : 0.07613      
    ##  3rd Qu.:-0.1622    3rd Qu.:-0.3654   3rd Qu.: 0.17436      
    ##  Max.   : 0.5866    Max.   : 0.1787   Max.   : 0.43585      
    ##  fBodyBodyAccJerkMag.mean.. fBodyBodyAccJerkMag.std..
    ##  Min.   :-0.9940            Min.   :-0.9944          
    ##  1st Qu.:-0.9770            1st Qu.:-0.9752          
    ##  Median :-0.7940            Median :-0.8126          
    ##  Mean   :-0.5756            Mean   :-0.5992          
    ##  3rd Qu.:-0.1872            3rd Qu.:-0.2668          
    ##  Max.   : 0.5384            Max.   : 0.3163          
    ##  fBodyBodyAccJerkMag.meanFreq.. fBodyBodyGyroMag.mean..
    ##  Min.   :-0.12521               Min.   :-0.9865        
    ##  1st Qu.: 0.04527               1st Qu.:-0.9616        
    ##  Median : 0.17198               Median :-0.7657        
    ##  Mean   : 0.16255               Mean   :-0.6671        
    ##  3rd Qu.: 0.27593               3rd Qu.:-0.4087        
    ##  Max.   : 0.48809               Max.   : 0.2040        
    ##  fBodyBodyGyroMag.std.. fBodyBodyGyroMag.meanFreq..
    ##  Min.   :-0.9815        Min.   :-0.45664           
    ##  1st Qu.:-0.9488        1st Qu.:-0.16951           
    ##  Median :-0.7727        Median :-0.05352           
    ##  Mean   :-0.6723        Mean   :-0.03603           
    ##  3rd Qu.:-0.4277        3rd Qu.: 0.08228           
    ##  Max.   : 0.2367        Max.   : 0.40952           
    ##  fBodyBodyGyroJerkMag.mean.. fBodyBodyGyroJerkMag.std..
    ##  Min.   :-0.9976             Min.   :-0.9976           
    ##  1st Qu.:-0.9813             1st Qu.:-0.9802           
    ##  Median :-0.8779             Median :-0.8941           
    ##  Mean   :-0.7564             Mean   :-0.7715           
    ##  3rd Qu.:-0.5831             3rd Qu.:-0.6081           
    ##  Max.   : 0.1466             Max.   : 0.2878           
    ##  fBodyBodyGyroJerkMag.meanFreq..
    ##  Min.   :-0.18292               
    ##  1st Qu.: 0.05423               
    ##  Median : 0.11156               
    ##  Mean   : 0.12592               
    ##  3rd Qu.: 0.20805               
    ##  Max.   : 0.42630

Annex
-----

Code used to import the *tidydata.csv* into the *tidyT* dataframe which
was used for computing the attributes in the description of the
data/variables above

    tidyT<-read.csv(file = "./UCI HAR Dataset/tidydata.csv",sep=" ")
