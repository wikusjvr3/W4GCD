# Week 4: Codebook: Getting and Cleaning Data Project

Loading the Datasets into R, both X_test.txt and Y_test.txt files have 561 vairables. Upon visual inspection of the features.txt file, the variable names appear to be short by 169 variables (561-392), however when loading file into R, or using a better text viewer than TextEdit for Mac, it is clear that all the variable names are present.

Also, it appears that 84 variables or 3x27 variables are duplicated as below:

Column    |                            Label
--------- | --------------------------------------------------------------------
317 - 344 | [fBodyAcc-bandsEnergy()-1,8]:[fBodyAcc-bandsEnergy()-25,48]
396 - 423 | [fBodyAccJerk-bandsEnergy()-1,8]:[fBodyAccJerk-bandsEnergy()-25,48]
475 - 502 | [fBodyGyro-bandsEnergy()-1,8]:[fBodyGyro-bandsEnergy()-25,48]

The explanations for this is found in the features_info.txt file where highlighted that
essentially these variables as missing their designated X,Y,Z dimensions:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Updated Codebook for Combined Raw Data

Column|FieldName
---|------------------------------------
1|tBodyAcc-mean()-X
2|tBodyAcc-mean()-Y
3|tBodyAcc-mean()-Z
4|tBodyAcc-std()-X
5|tBodyAcc-std()-Y
6|tBodyAcc-std()-Z
7|tBodyAcc-mad()-X
8|tBodyAcc-mad()-Y
9|tBodyAcc-mad()-Z
10|tBodyAcc-max()-X
11|tBodyAcc-max()-Y
12|tBodyAcc-max()-Z
13|tBodyAcc-min()-X
14|tBodyAcc-min()-Y
15|tBodyAcc-min()-Z
16|tBodyAcc-sma()
17|tBodyAcc-energy()-X
18|tBodyAcc-energy()-Y
19|tBodyAcc-energy()-Z
20|tBodyAcc-iqr()-X
21|tBodyAcc-iqr()-Y
22|tBodyAcc-iqr()-Z
23|tBodyAcc-entropy()-X
24|tBodyAcc-entropy()-Y
25|tBodyAcc-entropy()-Z
26|tBodyAcc-arCoeff()-X,1
27|tBodyAcc-arCoeff()-X,2
28|tBodyAcc-arCoeff()-X,3
29|tBodyAcc-arCoeff()-X,4
30|tBodyAcc-arCoeff()-Y,1
31|tBodyAcc-arCoeff()-Y,2
32|tBodyAcc-arCoeff()-Y,3
33|tBodyAcc-arCoeff()-Y,4
34|tBodyAcc-arCoeff()-Z,1
35|tBodyAcc-arCoeff()-Z,2
36|tBodyAcc-arCoeff()-Z,3
37|tBodyAcc-arCoeff()-Z,4
38|tBodyAcc-correlation()-X,Y
39|tBodyAcc-correlation()-X,Z
40|tBodyAcc-correlation()-Y,Z
41|tGravityAcc-mean()-X
42|tGravityAcc-mean()-Y
43|tGravityAcc-mean()-Z
44|tGravityAcc-std()-X
45|tGravityAcc-std()-Y
46|tGravityAcc-std()-Z
47|tGravityAcc-mad()-X
48|tGravityAcc-mad()-Y
49|tGravityAcc-mad()-Z
50|tGravityAcc-max()-X
51|tGravityAcc-max()-Y
52|tGravityAcc-max()-Z
53|tGravityAcc-min()-X
54|tGravityAcc-min()-Y
55|tGravityAcc-min()-Z
56|tGravityAcc-sma()
57|tGravityAcc-energy()-X
58|tGravityAcc-energy()-Y
59|tGravityAcc-energy()-Z
60|tGravityAcc-iqr()-X
61|tGravityAcc-iqr()-Y
62|tGravityAcc-iqr()-Z
63|tGravityAcc-entropy()-X
64|tGravityAcc-entropy()-Y
65|tGravityAcc-entropy()-Z
66|tGravityAcc-arCoeff()-X,1
67|tGravityAcc-arCoeff()-X,2
68|tGravityAcc-arCoeff()-X,3
69|tGravityAcc-arCoeff()-X,4
70|tGravityAcc-arCoeff()-Y,1
71|tGravityAcc-arCoeff()-Y,2
72|tGravityAcc-arCoeff()-Y,3
73|tGravityAcc-arCoeff()-Y,4
74|tGravityAcc-arCoeff()-Z,1
75|tGravityAcc-arCoeff()-Z,2
76|tGravityAcc-arCoeff()-Z,3
77|tGravityAcc-arCoeff()-Z,4
78|tGravityAcc-correlation()-X,Y
79|tGravityAcc-correlation()-X,Z
80|tGravityAcc-correlation()-Y,Z
81|tBodyAccJerk-mean()-X
82|tBodyAccJerk-mean()-Y
83|tBodyAccJerk-mean()-Z
84|tBodyAccJerk-std()-X
85|tBodyAccJerk-std()-Y
86|tBodyAccJerk-std()-Z
87|tBodyAccJerk-mad()-X
88|tBodyAccJerk-mad()-Y
89|tBodyAccJerk-mad()-Z
90|tBodyAccJerk-max()-X
91|tBodyAccJerk-max()-Y
92|tBodyAccJerk-max()-Z
93|tBodyAccJerk-min()-X
94|tBodyAccJerk-min()-Y
95|tBodyAccJerk-min()-Z
96|tBodyAccJerk-sma()
97|tBodyAccJerk-energy()-X
98|tBodyAccJerk-energy()-Y
99|tBodyAccJerk-energy()-Z
100|tBodyAccJerk-iqr()-X
101|tBodyAccJerk-iqr()-Y
102|tBodyAccJerk-iqr()-Z
103|tBodyAccJerk-entropy()-X
104|tBodyAccJerk-entropy()-Y
105|tBodyAccJerk-entropy()-Z
106|tBodyAccJerk-arCoeff()-X,1
107|tBodyAccJerk-arCoeff()-X,2
108|tBodyAccJerk-arCoeff()-X,3
109|tBodyAccJerk-arCoeff()-X,4
110|tBodyAccJerk-arCoeff()-Y,1
111|tBodyAccJerk-arCoeff()-Y,2
112|tBodyAccJerk-arCoeff()-Y,3
113|tBodyAccJerk-arCoeff()-Y,4
114|tBodyAccJerk-arCoeff()-Z,1
115|tBodyAccJerk-arCoeff()-Z,2
116|tBodyAccJerk-arCoeff()-Z,3
117|tBodyAccJerk-arCoeff()-Z,4
118|tBodyAccJerk-correlation()-X,Y
119|tBodyAccJerk-correlation()-X,Z
120|tBodyAccJerk-correlation()-Y,Z
121|tBodyGyro-mean()-X
122|tBodyGyro-mean()-Y
123|tBodyGyro-mean()-Z
124|tBodyGyro-std()-X
125|tBodyGyro-std()-Y
126|tBodyGyro-std()-Z
127|tBodyGyro-mad()-X
128|tBodyGyro-mad()-Y
129|tBodyGyro-mad()-Z
130|tBodyGyro-max()-X
131|tBodyGyro-max()-Y
132|tBodyGyro-max()-Z
133|tBodyGyro-min()-X
134|tBodyGyro-min()-Y
135|tBodyGyro-min()-Z
136|tBodyGyro-sma()
137|tBodyGyro-energy()-X
138|tBodyGyro-energy()-Y
139|tBodyGyro-energy()-Z
140|tBodyGyro-iqr()-X
141|tBodyGyro-iqr()-Y
142|tBodyGyro-iqr()-Z
143|tBodyGyro-entropy()-X
144|tBodyGyro-entropy()-Y
145|tBodyGyro-entropy()-Z
146|tBodyGyro-arCoeff()-X,1
147|tBodyGyro-arCoeff()-X,2
148|tBodyGyro-arCoeff()-X,3
149|tBodyGyro-arCoeff()-X,4
150|tBodyGyro-arCoeff()-Y,1
151|tBodyGyro-arCoeff()-Y,2
152|tBodyGyro-arCoeff()-Y,3
153|tBodyGyro-arCoeff()-Y,4
154|tBodyGyro-arCoeff()-Z,1
155|tBodyGyro-arCoeff()-Z,2
156|tBodyGyro-arCoeff()-Z,3
157|tBodyGyro-arCoeff()-Z,4
158|tBodyGyro-correlation()-X,Y
159|tBodyGyro-correlation()-X,Z
160|tBodyGyro-correlation()-Y,Z
161|tBodyGyroJerk-mean()-X
162|tBodyGyroJerk-mean()-Y
163|tBodyGyroJerk-mean()-Z
164|tBodyGyroJerk-std()-X
165|tBodyGyroJerk-std()-Y
166|tBodyGyroJerk-std()-Z
167|tBodyGyroJerk-mad()-X
168|tBodyGyroJerk-mad()-Y
169|tBodyGyroJerk-mad()-Z
170|tBodyGyroJerk-max()-X
171|tBodyGyroJerk-max()-Y
172|tBodyGyroJerk-max()-Z
173|tBodyGyroJerk-min()-X
174|tBodyGyroJerk-min()-Y
175|tBodyGyroJerk-min()-Z
176|tBodyGyroJerk-sma()
177|tBodyGyroJerk-energy()-X
178|tBodyGyroJerk-energy()-Y
179|tBodyGyroJerk-energy()-Z
180|tBodyGyroJerk-iqr()-X
181|tBodyGyroJerk-iqr()-Y
182|tBodyGyroJerk-iqr()-Z
183|tBodyGyroJerk-entropy()-X
184|tBodyGyroJerk-entropy()-Y
185|tBodyGyroJerk-entropy()-Z
186|tBodyGyroJerk-arCoeff()-X,1
187|tBodyGyroJerk-arCoeff()-X,2
188|tBodyGyroJerk-arCoeff()-X,3
189|tBodyGyroJerk-arCoeff()-X,4
190|tBodyGyroJerk-arCoeff()-Y,1
191|tBodyGyroJerk-arCoeff()-Y,2
192|tBodyGyroJerk-arCoeff()-Y,3
193|tBodyGyroJerk-arCoeff()-Y,4
194|tBodyGyroJerk-arCoeff()-Z,1
195|tBodyGyroJerk-arCoeff()-Z,2
196|tBodyGyroJerk-arCoeff()-Z,3
197|tBodyGyroJerk-arCoeff()-Z,4
198|tBodyGyroJerk-correlation()-X,Y
199|tBodyGyroJerk-correlation()-X,Z
200|tBodyGyroJerk-correlation()-Y,Z
201|tBodyAccMag-mean()
202|tBodyAccMag-std()
203|tBodyAccMag-mad()
204|tBodyAccMag-max()
205|tBodyAccMag-min()
206|tBodyAccMag-sma()
207|tBodyAccMag-energy()
208|tBodyAccMag-iqr()
209|tBodyAccMag-entropy()
210|tBodyAccMag-arCoeff()1
211|tBodyAccMag-arCoeff()2
212|tBodyAccMag-arCoeff()3
213|tBodyAccMag-arCoeff()4
214|tGravityAccMag-mean()
215|tGravityAccMag-std()
216|tGravityAccMag-mad()
217|tGravityAccMag-max()
218|tGravityAccMag-min()
219|tGravityAccMag-sma()
220|tGravityAccMag-energy()
221|tGravityAccMag-iqr()
222|tGravityAccMag-entropy()
223|tGravityAccMag-arCoeff()1
224|tGravityAccMag-arCoeff()2
225|tGravityAccMag-arCoeff()3
226|tGravityAccMag-arCoeff()4
227|tBodyAccJerkMag-mean()
228|tBodyAccJerkMag-std()
229|tBodyAccJerkMag-mad()
230|tBodyAccJerkMag-max()
231|tBodyAccJerkMag-min()
232|tBodyAccJerkMag-sma()
233|tBodyAccJerkMag-energy()
234|tBodyAccJerkMag-iqr()
235|tBodyAccJerkMag-entropy()
236|tBodyAccJerkMag-arCoeff()1
237|tBodyAccJerkMag-arCoeff()2
238|tBodyAccJerkMag-arCoeff()3
239|tBodyAccJerkMag-arCoeff()4
240|tBodyGyroMag-mean()
241|tBodyGyroMag-std()
242|tBodyGyroMag-mad()
243|tBodyGyroMag-max()
244|tBodyGyroMag-min()
245|tBodyGyroMag-sma()
246|tBodyGyroMag-energy()
247|tBodyGyroMag-iqr()
248|tBodyGyroMag-entropy()
249|tBodyGyroMag-arCoeff()1
250|tBodyGyroMag-arCoeff()2
251|tBodyGyroMag-arCoeff()3
252|tBodyGyroMag-arCoeff()4
253|tBodyGyroJerkMag-mean()
254|tBodyGyroJerkMag-std()
255|tBodyGyroJerkMag-mad()
256|tBodyGyroJerkMag-max()
257|tBodyGyroJerkMag-min()
258|tBodyGyroJerkMag-sma()
259|tBodyGyroJerkMag-energy()
260|tBodyGyroJerkMag-iqr()
261|tBodyGyroJerkMag-entropy()
262|tBodyGyroJerkMag-arCoeff()1
263|tBodyGyroJerkMag-arCoeff()2
264|tBodyGyroJerkMag-arCoeff()3
265|tBodyGyroJerkMag-arCoeff()4
266|fBodyAcc-mean()-X
267|fBodyAcc-mean()-Y
268|fBodyAcc-mean()-Z
269|fBodyAcc-std()-X
270|fBodyAcc-std()-Y
271|fBodyAcc-std()-Z
272|fBodyAcc-mad()-X
273|fBodyAcc-mad()-Y
274|fBodyAcc-mad()-Z
275|fBodyAcc-max()-X
276|fBodyAcc-max()-Y
277|fBodyAcc-max()-Z
278|fBodyAcc-min()-X
279|fBodyAcc-min()-Y
280|fBodyAcc-min()-Z
281|fBodyAcc-sma()
282|fBodyAcc-energy()-X
283|fBodyAcc-energy()-Y
284|fBodyAcc-energy()-Z
285|fBodyAcc-iqr()-X
286|fBodyAcc-iqr()-Y
287|fBodyAcc-iqr()-Z
288|fBodyAcc-entropy()-X
289|fBodyAcc-entropy()-Y
290|fBodyAcc-entropy()-Z
291|fBodyAcc-maxInds-X
292|fBodyAcc-maxInds-Y
293|fBodyAcc-maxInds-Z
294|fBodyAcc-meanFreq()-X
295|fBodyAcc-meanFreq()-Y
296|fBodyAcc-meanFreq()-Z
297|fBodyAcc-skewness()-X
298|fBodyAcc-kurtosis()-X
299|fBodyAcc-skewness()-Y
300|fBodyAcc-kurtosis()-Y
301|fBodyAcc-skewness()-Z
302|fBodyAcc-kurtosis()-Z
303|fBodyAcc-bandsEnergy()-1,8
304|fBodyAcc-bandsEnergy()-9,16
305|fBodyAcc-bandsEnergy()-17,24
306|fBodyAcc-bandsEnergy()-25,32
307|fBodyAcc-bandsEnergy()-33,40
308|fBodyAcc-bandsEnergy()-41,48
309|fBodyAcc-bandsEnergy()-49,56
310|fBodyAcc-bandsEnergy()-57,64
311|fBodyAcc-bandsEnergy()-1,16
312|fBodyAcc-bandsEnergy()-17,32
313|fBodyAcc-bandsEnergy()-33,48
314|fBodyAcc-bandsEnergy()-49,64
315|fBodyAcc-bandsEnergy()-1,24
316|fBodyAcc-bandsEnergy()-25,48
317|fBodyAcc-bandsEnergy()-1,8
318|fBodyAcc-bandsEnergy()-9,16
319|fBodyAcc-bandsEnergy()-17,24
320|fBodyAcc-bandsEnergy()-25,32
321|fBodyAcc-bandsEnergy()-33,40
322|fBodyAcc-bandsEnergy()-41,48
323|fBodyAcc-bandsEnergy()-49,56
324|fBodyAcc-bandsEnergy()-57,64
325|fBodyAcc-bandsEnergy()-1,16
326|fBodyAcc-bandsEnergy()-17,32
327|fBodyAcc-bandsEnergy()-33,48
328|fBodyAcc-bandsEnergy()-49,64
329|fBodyAcc-bandsEnergy()-1,24
330|fBodyAcc-bandsEnergy()-25,48
331|fBodyAcc-bandsEnergy()-1,8
332|fBodyAcc-bandsEnergy()-9,16
333|fBodyAcc-bandsEnergy()-17,24
334|fBodyAcc-bandsEnergy()-25,32
335|fBodyAcc-bandsEnergy()-33,40
336|fBodyAcc-bandsEnergy()-41,48
337|fBodyAcc-bandsEnergy()-49,56
338|fBodyAcc-bandsEnergy()-57,64
339|fBodyAcc-bandsEnergy()-1,16
340|fBodyAcc-bandsEnergy()-17,32
341|fBodyAcc-bandsEnergy()-33,48
342|fBodyAcc-bandsEnergy()-49,64
343|fBodyAcc-bandsEnergy()-1,24
344|fBodyAcc-bandsEnergy()-25,48
345|fBodyAccJerk-mean()-X
346|fBodyAccJerk-mean()-Y
347|fBodyAccJerk-mean()-Z
348|fBodyAccJerk-std()-X
349|fBodyAccJerk-std()-Y
350|fBodyAccJerk-std()-Z
351|fBodyAccJerk-mad()-X
352|fBodyAccJerk-mad()-Y
353|fBodyAccJerk-mad()-Z
354|fBodyAccJerk-max()-X
355|fBodyAccJerk-max()-Y
356|fBodyAccJerk-max()-Z
357|fBodyAccJerk-min()-X
358|fBodyAccJerk-min()-Y
359|fBodyAccJerk-min()-Z
360|fBodyAccJerk-sma()
361|fBodyAccJerk-energy()-X
362|fBodyAccJerk-energy()-Y
363|fBodyAccJerk-energy()-Z
364|fBodyAccJerk-iqr()-X
365|fBodyAccJerk-iqr()-Y
366|fBodyAccJerk-iqr()-Z
367|fBodyAccJerk-entropy()-X
368|fBodyAccJerk-entropy()-Y
369|fBodyAccJerk-entropy()-Z
370|fBodyAccJerk-maxInds-X
371|fBodyAccJerk-maxInds-Y
372|fBodyAccJerk-maxInds-Z
373|fBodyAccJerk-meanFreq()-X
374|fBodyAccJerk-meanFreq()-Y
375|fBodyAccJerk-meanFreq()-Z
376|fBodyAccJerk-skewness()-X
377|fBodyAccJerk-kurtosis()-X
378|fBodyAccJerk-skewness()-Y
379|fBodyAccJerk-kurtosis()-Y
380|fBodyAccJerk-skewness()-Z
381|fBodyAccJerk-kurtosis()-Z
382|fBodyAccJerk-bandsEnergy()-1,8
383|fBodyAccJerk-bandsEnergy()-9,16
384|fBodyAccJerk-bandsEnergy()-17,24
385|fBodyAccJerk-bandsEnergy()-25,32
386|fBodyAccJerk-bandsEnergy()-33,40
387|fBodyAccJerk-bandsEnergy()-41,48
388|fBodyAccJerk-bandsEnergy()-49,56
389|fBodyAccJerk-bandsEnergy()-57,64
390|fBodyAccJerk-bandsEnergy()-1,16
391|fBodyAccJerk-bandsEnergy()-17,32
392|fBodyAccJerk-bandsEnergy()-33,48
393|fBodyAccJerk-bandsEnergy()-49,64
394|fBodyAccJerk-bandsEnergy()-1,24
395|fBodyAccJerk-bandsEnergy()-25,48
396|fBodyAccJerk-bandsEnergy()-1,8
397|fBodyAccJerk-bandsEnergy()-9,16
398|fBodyAccJerk-bandsEnergy()-17,24
399|fBodyAccJerk-bandsEnergy()-25,32
400|fBodyAccJerk-bandsEnergy()-33,40
401|fBodyAccJerk-bandsEnergy()-41,48
402|fBodyAccJerk-bandsEnergy()-49,56
403|fBodyAccJerk-bandsEnergy()-57,64
404|fBodyAccJerk-bandsEnergy()-1,16
405|fBodyAccJerk-bandsEnergy()-17,32
406|fBodyAccJerk-bandsEnergy()-33,48
407|fBodyAccJerk-bandsEnergy()-49,64
408|fBodyAccJerk-bandsEnergy()-1,24
409|fBodyAccJerk-bandsEnergy()-25,48
410|fBodyAccJerk-bandsEnergy()-1,8
411|fBodyAccJerk-bandsEnergy()-9,16
412|fBodyAccJerk-bandsEnergy()-17,24
413|fBodyAccJerk-bandsEnergy()-25,32
414|fBodyAccJerk-bandsEnergy()-33,40
415|fBodyAccJerk-bandsEnergy()-41,48
416|fBodyAccJerk-bandsEnergy()-49,56
417|fBodyAccJerk-bandsEnergy()-57,64
418|fBodyAccJerk-bandsEnergy()-1,16
419|fBodyAccJerk-bandsEnergy()-17,32
420|fBodyAccJerk-bandsEnergy()-33,48
421|fBodyAccJerk-bandsEnergy()-49,64
422|fBodyAccJerk-bandsEnergy()-1,24
423|fBodyAccJerk-bandsEnergy()-25,48
424|fBodyGyro-mean()-X
425|fBodyGyro-mean()-Y
426|fBodyGyro-mean()-Z
427|fBodyGyro-std()-X
428|fBodyGyro-std()-Y
429|fBodyGyro-std()-Z
430|fBodyGyro-mad()-X
431|fBodyGyro-mad()-Y
432|fBodyGyro-mad()-Z
433|fBodyGyro-max()-X
434|fBodyGyro-max()-Y
435|fBodyGyro-max()-Z
436|fBodyGyro-min()-X
437|fBodyGyro-min()-Y
438|fBodyGyro-min()-Z
439|fBodyGyro-sma()
440|fBodyGyro-energy()-X
441|fBodyGyro-energy()-Y
442|fBodyGyro-energy()-Z
443|fBodyGyro-iqr()-X
444|fBodyGyro-iqr()-Y
445|fBodyGyro-iqr()-Z
446|fBodyGyro-entropy()-X
447|fBodyGyro-entropy()-Y
448|fBodyGyro-entropy()-Z
449|fBodyGyro-maxInds-X
450|fBodyGyro-maxInds-Y
451|fBodyGyro-maxInds-Z
452|fBodyGyro-meanFreq()-X
453|fBodyGyro-meanFreq()-Y
454|fBodyGyro-meanFreq()-Z
455|fBodyGyro-skewness()-X
456|fBodyGyro-kurtosis()-X
457|fBodyGyro-skewness()-Y
458|fBodyGyro-kurtosis()-Y
459|fBodyGyro-skewness()-Z
460|fBodyGyro-kurtosis()-Z
461|fBodyGyro-bandsEnergy()-1,8
462|fBodyGyro-bandsEnergy()-9,16
463|fBodyGyro-bandsEnergy()-17,24
464|fBodyGyro-bandsEnergy()-25,32
465|fBodyGyro-bandsEnergy()-33,40
466|fBodyGyro-bandsEnergy()-41,48
467|fBodyGyro-bandsEnergy()-49,56
468|fBodyGyro-bandsEnergy()-57,64
469|fBodyGyro-bandsEnergy()-1,16
470|fBodyGyro-bandsEnergy()-17,32
471|fBodyGyro-bandsEnergy()-33,48
472|fBodyGyro-bandsEnergy()-49,64
473|fBodyGyro-bandsEnergy()-1,24
474|fBodyGyro-bandsEnergy()-25,48
475|fBodyGyro-bandsEnergy()-1,8
476|fBodyGyro-bandsEnergy()-9,16
477|fBodyGyro-bandsEnergy()-17,24
478|fBodyGyro-bandsEnergy()-25,32
479|fBodyGyro-bandsEnergy()-33,40
480|fBodyGyro-bandsEnergy()-41,48
481|fBodyGyro-bandsEnergy()-49,56
482|fBodyGyro-bandsEnergy()-57,64
483|fBodyGyro-bandsEnergy()-1,16
484|fBodyGyro-bandsEnergy()-17,32
485|fBodyGyro-bandsEnergy()-33,48
486|fBodyGyro-bandsEnergy()-49,64
487|fBodyGyro-bandsEnergy()-1,24
488|fBodyGyro-bandsEnergy()-25,48
489|fBodyGyro-bandsEnergy()-1,8
490|fBodyGyro-bandsEnergy()-9,16
491|fBodyGyro-bandsEnergy()-17,24
492|fBodyGyro-bandsEnergy()-25,32
493|fBodyGyro-bandsEnergy()-33,40
494|fBodyGyro-bandsEnergy()-41,48
495|fBodyGyro-bandsEnergy()-49,56
496|fBodyGyro-bandsEnergy()-57,64
497|fBodyGyro-bandsEnergy()-1,16
498|fBodyGyro-bandsEnergy()-17,32
499|fBodyGyro-bandsEnergy()-33,48
500|fBodyGyro-bandsEnergy()-49,64
501|fBodyGyro-bandsEnergy()-1,24
502|fBodyGyro-bandsEnergy()-25,48
503|fBodyAccMag-mean()
504|fBodyAccMag-std()
505|fBodyAccMag-mad()
506|fBodyAccMag-max()
507|fBodyAccMag-min()
508|fBodyAccMag-sma()
509|fBodyAccMag-energy()
510|fBodyAccMag-iqr()
511|fBodyAccMag-entropy()
512|fBodyAccMag-maxInds
513|fBodyAccMag-meanFreq()
514|fBodyAccMag-skewness()
515|fBodyAccMag-kurtosis()
516|fBodyBodyAccJerkMag-mean()
517|fBodyBodyAccJerkMag-std()
518|fBodyBodyAccJerkMag-mad()
519|fBodyBodyAccJerkMag-max()
520|fBodyBodyAccJerkMag-min()
521|fBodyBodyAccJerkMag-sma()
522|fBodyBodyAccJerkMag-energy()
523|fBodyBodyAccJerkMag-iqr()
524|fBodyBodyAccJerkMag-entropy()
525|fBodyBodyAccJerkMag-maxInds
526|fBodyBodyAccJerkMag-meanFreq()
527|fBodyBodyAccJerkMag-skewness()
528|fBodyBodyAccJerkMag-kurtosis()
529|fBodyBodyGyroMag-mean()
530|fBodyBodyGyroMag-std()
531|fBodyBodyGyroMag-mad()
532|fBodyBodyGyroMag-max()
533|fBodyBodyGyroMag-min()
534|fBodyBodyGyroMag-sma()
535|fBodyBodyGyroMag-energy()
536|fBodyBodyGyroMag-iqr()
537|fBodyBodyGyroMag-entropy()
538|fBodyBodyGyroMag-maxInds
539|fBodyBodyGyroMag-meanFreq()
540|fBodyBodyGyroMag-skewness()
541|fBodyBodyGyroMag-kurtosis()
542|fBodyBodyGyroJerkMag-mean()
543|fBodyBodyGyroJerkMag-std()
544|fBodyBodyGyroJerkMag-mad()
545|fBodyBodyGyroJerkMag-max()
546|fBodyBodyGyroJerkMag-min()
547|fBodyBodyGyroJerkMag-sma()
548|fBodyBodyGyroJerkMag-energy()
549|fBodyBodyGyroJerkMag-iqr()
550|fBodyBodyGyroJerkMag-entropy()
551|fBodyBodyGyroJerkMag-maxInds
552|fBodyBodyGyroJerkMag-meanFreq()
553|fBodyBodyGyroJerkMag-skewness()
554|fBodyBodyGyroJerkMag-kurtosis()
555|angle(tBodyAccMean,gravity)
556|angle(tBodyAccJerkMean),gravityMean)
557|angle(tBodyGyroMean,gravityMean)
558|angle(tBodyGyroJerkMean,gravityMean)
559|angle(X,gravityMean)
560|angle(Y,gravityMean)
561|angle(Z,gravityMean)
562|Activity_code
563|Subject_ID

### New Codebook for Extracted Raw Data 
Column|FieldName
--|-------------------------------
1|Subject_ID
2|Activity_code
3|tBodyAcc-mean()-X
4|tBodyAcc-mean()-Y
5|tBodyAcc-mean()-Z
6|tGravityAcc-mean()-X
7|tGravityAcc-mean()-Y
8|tGravityAcc-mean()-Z
9|tBodyAccJerk-mean()-X
10|tBodyAccJerk-mean()-Y
11|tBodyAccJerk-mean()-Z
12|tBodyGyro-mean()-X
13|tBodyGyro-mean()-Y
14|tBodyGyro-mean()-Z
15|tBodyGyroJerk-mean()-X
16|tBodyGyroJerk-mean()-Y
17|tBodyGyroJerk-mean()-Z
18|tBodyAccMag-mean()
19|tGravityAccMag-mean()
20|tBodyAccJerkMag-mean()
21|tBodyGyroMag-mean()
22|tBodyGyroJerkMag-mean()
23|fBodyAcc-mean()-X
24|fBodyAcc-mean()-Y
25|fBodyAcc-mean()-Z
26|fBodyAcc-meanFreq()-X
27|fBodyAcc-meanFreq()-Y
28|fBodyAcc-meanFreq()-Z
29|fBodyAccJerk-mean()-X
30|fBodyAccJerk-mean()-Y
31|fBodyAccJerk-mean()-Z
32|fBodyAccJerk-meanFreq()-X
33|fBodyAccJerk-meanFreq()-Y
34|fBodyAccJerk-meanFreq()-Z
35|fBodyGyro-mean()-X
36|fBodyGyro-mean()-Y
37|fBodyGyro-mean()-Z
38|fBodyGyro-meanFreq()-X
39|fBodyGyro-meanFreq()-Y
40|fBodyGyro-meanFreq()-Z
41|fBodyAccMag-mean()
42|fBodyAccMag-meanFreq()
43|fBodyBodyAccJerkMag-mean()
44|fBodyBodyAccJerkMag-meanFreq()
45|fBodyBodyGyroMag-mean()
46|fBodyBodyGyroMag-meanFreq()
47|fBodyBodyGyroJerkMag-mean()
48|fBodyBodyGyroJerkMag-meanFreq()
49|tBodyAcc-std()-X
50|tBodyAcc-std()-Y
51|tBodyAcc-std()-Z
52|tGravityAcc-std()-X
53|tGravityAcc-std()-Y
54|tGravityAcc-std()-Z
55|tBodyAccJerk-std()-X
56|tBodyAccJerk-std()-Y
57|tBodyAccJerk-std()-Z
58|tBodyGyro-std()-X
59|tBodyGyro-std()-Y
60|tBodyGyro-std()-Z
61|tBodyGyroJerk-std()-X
62|tBodyGyroJerk-std()-Y
63|tBodyGyroJerk-std()-Z
64|tBodyAccMag-std()
65|tGravityAccMag-std()
66|tBodyAccJerkMag-std()
67|tBodyGyroMag-std()
68|tBodyGyroJerkMag-std()
69|fBodyAcc-std()-X
70|fBodyAcc-std()-Y
71|fBodyAcc-std()-Z
72|fBodyAccJerk-std()-X
73|fBodyAccJerk-std()-Y
74|fBodyAccJerk-std()-Z
75|fBodyGyro-std()-X
76|fBodyGyro-std()-Y
77|fBodyGyro-std()-Z
78|fBodyAccMag-std()
79|fBodyBodyAccJerkMag-std()
80|fBodyBodyGyroMag-std()
81|fBodyBodyGyroJerkMag-std()

# Requirement 3 - Updated variables list with Descriptive Activity Codes:

Column|FieldName
--|-------------------------------
1|Subject_ID
2|Activity_code
3|Actvty_fctrs
4|tBodyAcc-mean()-X
5|tBodyAcc-mean()-Y
6|tBodyAcc-mean()-Z
7|tGravityAcc-mean()-X
8|tGravityAcc-mean()-Y
9|tGravityAcc-mean()-Z
10|tBodyAccJerk-mean()-X
11|tBodyAccJerk-mean()-Y
12|tBodyAccJerk-mean()-Z
13|tBodyGyro-mean()-X
14|tBodyGyro-mean()-Y
15|tBodyGyro-mean()-Z
16|tBodyGyroJerk-mean()-X
17|tBodyGyroJerk-mean()-Y
18|tBodyGyroJerk-mean()-Z
19|tBodyAccMag-mean()
20|tGravityAccMag-mean()
21|tBodyAccJerkMag-mean()
22|tBodyGyroMag-mean()
23|tBodyGyroJerkMag-mean()
24|fBodyAcc-mean()-X
25|fBodyAcc-mean()-Y
26|fBodyAcc-mean()-Z
27|fBodyAcc-meanFreq()-X
28|fBodyAcc-meanFreq()-Y
29|fBodyAcc-meanFreq()-Z
30|fBodyAccJerk-mean()-X
31|fBodyAccJerk-mean()-Y
32|fBodyAccJerk-mean()-Z
33|fBodyAccJerk-meanFreq()-X
34|fBodyAccJerk-meanFreq()-Y
35|fBodyAccJerk-meanFreq()-Z
36|fBodyGyro-mean()-X
37|fBodyGyro-mean()-Y
38|fBodyGyro-mean()-Z
39|fBodyGyro-meanFreq()-X
40|fBodyGyro-meanFreq()-Y
41|fBodyGyro-meanFreq()-Z
42|fBodyAccMag-mean()
43|fBodyAccMag-meanFreq()
44|fBodyBodyAccJerkMag-mean()
45|fBodyBodyAccJerkMag-meanFreq()
46|fBodyBodyGyroMag-mean()
47|fBodyBodyGyroMag-meanFreq()
48|fBodyBodyGyroJerkMag-mean()
49|fBodyBodyGyroJerkMag-meanFreq()
50|tBodyAcc-std()-X
51|tBodyAcc-std()-Y
52|tBodyAcc-std()-Z
53|tGravityAcc-std()-X
54|tGravityAcc-std()-Y
55|tGravityAcc-std()-Z
56|tBodyAccJerk-std()-X
57|tBodyAccJerk-std()-Y
58|tBodyAccJerk-std()-Z
59|tBodyGyro-std()-X
60|tBodyGyro-std()-Y
61|tBodyGyro-std()-Z
62|tBodyGyroJerk-std()-X
63|tBodyGyroJerk-std()-Y
64|tBodyGyroJerk-std()-Z
65|tBodyAccMag-std()
66|tGravityAccMag-std()
67|tBodyAccJerkMag-std()
68|tBodyGyroMag-std()
69|tBodyGyroJerkMag-std()
70|fBodyAcc-std()-X
71|fBodyAcc-std()-Y
72|fBodyAcc-std()-Z
73|fBodyAccJerk-std()-X
74|fBodyAccJerk-std()-Y
75|fBodyAccJerk-std()-Z
76|fBodyGyro-std()-X
77|fBodyGyro-std()-Y
78|fBodyGyro-std()-Z
79|fBodyAccMag-std()
80|fBodyBodyAccJerkMag-std()
81|fBodyBodyGyroMag-std()
82|fBodyBodyGyroJerkMag-std()

### Requirement 4: Tidy Data 

#### Code used for functions: 

''' R Script: Rename.R

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

'''

''' R Script: AddDescription.R

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

'''

#### Tidy Data CookBook

Under the scope of this project, it was assumed that a tidy data set has
descriptive action labels, cleaned sensible descriptive column names, and have 
the required extracted data i.e all columns where the column containts either  "mean()" or "std()". The codebook below was updated to provide a better meaning
of what each variable name represent.

Column|FieldName|Description
--|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
1|Subject_ID|The Unique ID number given to volunteer.
2|Activity_code|Each activity type was given a number. See Actvty_fctrs
3|Actvty_fctrs|1:Walking 2:Walking_Upstairs 3:Walking_Downstairs 4:Sitting 5:Standing 6:Laying
4|TimeBodyAccMeanX|Time domain signal for the Mean value of the Body's acceleration measure  for the 3-axial raw signal X.
5|TimeBodyAccMeanY|Time domain signal for the Mean value of the Body's acceleration measure  for the 3-axial raw signal Y.
6|TimeBodyAccMeanZ|Time domain signal for the Mean value of the Body's acceleration measure  for the 3-axial raw signal Z.
7|TimeGravityAccMeanX|Time domain signal for the Mean value of the Gravity acceleration measure  for the 3-axial raw signal X.
8|TimeGravityAccMeanY|Time domain signal for the Mean value of the Gravity acceleration measure  for the 3-axial raw signal Y.
9|TimeGravityAccMeanZ|Time domain signal for the Mean value of the Gravity acceleration measure  for the 3-axial raw signal Z.
10|TimeBodyAccJerkMeanX|Time domain signal for the Mean value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal X.
11|TimeBodyAccJerkMeanY|Time domain signal for the Mean value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Y.
12|TimeBodyAccJerkMeanZ|Time domain signal for the Mean value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Z.
13|TimeBodyGyroMeanX|Time domain signal for the Mean value of the Body's Gyroscope measure  for the 3-axial raw signal X.
14|TimeBodyGyroMeanY|Time domain signal for the Mean value of the Body's Gyroscope measure  for the 3-axial raw signal Y.
15|TimeBodyGyroMeanZ|Time domain signal for the Mean value of the Body's Gyroscope measure  for the 3-axial raw signal Z.
16|TimeBodyGyroJerkMeanX|Time domain signal for the Mean value of the Body's Gyroscope measure for a Jerk movement  for the 3-axial raw signal X.
17|TimeBodyGyroJerkMeanY|Time domain signal for the Mean value of the Body's Gyroscope measure for a Jerk movement  for the 3-axial raw signal Y.
18|TimeBodyGyroJerkMeanZ|Time domain signal for the Mean value of the Body's Gyroscope measure for a Jerk movement  for the 3-axial raw signal Z.
19|TimeBodyAccMagMean|Time domain signal for the Mean value of the Body's acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
20|TimeGravityAccMagMean|Time domain signal for the Mean value of the Gravity acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
21|TimeBodyAccJerkMagMean|Time domain signal for the Mean value of the Body's acceleration measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
22|TimeBodyGyroMagMean|Time domain signal for the Mean value of the Body's Gyroscope measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
23|TimeBodyGyroJerkMagMean|Time domain signal for the Mean value of the Body's Gyroscope measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
24|FreqBodyAccMeanX|Frequency domain signal for the Mean value of the Body's acceleration measure  for the 3-axial raw signal X.
25|FreqBodyAccMeanY|Frequency domain signal for the Mean value of the Body's acceleration measure  for the 3-axial raw signal Y.
26|FreqBodyAccMeanZ|Frequency domain signal for the Mean value of the Body's acceleration measure  for the 3-axial raw signal Z.
27|FreqBodyAccFreqavgX|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure  for the 3-axial raw signal X.
28|FreqBodyAccFreqavgY|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure  for the 3-axial raw signal Y.
29|FreqBodyAccFreqavgZ|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure  for the 3-axial raw signal Z.
30|FreqBodyAccJerkMeanX|Frequency domain signal for the Mean value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal X.
31|FreqBodyAccJerkMeanY|Frequency domain signal for the Mean value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Y.
32|FreqBodyAccJerkMeanZ|Frequency domain signal for the Mean value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Z.
33|FreqBodyAccJerkFreqavgX|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal X.
34|FreqBodyAccJerkFreqavgY|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Y.
35|FreqBodyAccJerkFreqavgZ|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Z.
36|FreqBodyGyroMeanX|Frequency domain signal for the Mean value of the Body's Gyroscope measure  for the 3-axial raw signal X.
37|FreqBodyGyroMeanY|Frequency domain signal for the Mean value of the Body's Gyroscope measure  for the 3-axial raw signal Y.
38|FreqBodyGyroMeanZ|Frequency domain signal for the Mean value of the Body's Gyroscope measure  for the 3-axial raw signal Z.
39|FreqBodyGyroFreqavgX|Frequency domain signal for the Weighted average of the frequency components of the Body's Gyroscope measure  for the 3-axial raw signal X.
40|FreqBodyGyroFreqavgY|Frequency domain signal for the Weighted average of the frequency components of the Body's Gyroscope measure  for the 3-axial raw signal Y.
41|FreqBodyGyroFreqavgZ|Frequency domain signal for the Weighted average of the frequency components of the Body's Gyroscope measure  for the 3-axial raw signal Z.
42|FreqBodyAccMagMean|Frequency domain signal for the Mean value of the Body's acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
43|FreqBodyAccMagFreqavg|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
44|FreqBodyAccJerkMagMean|Frequency domain signal for the Mean value of the Body's acceleration measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
45|FreqBodyAccJerkMagFreqavg|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
46|FreqBodyGyroMagMean|Frequency domain signal for the Mean value of the Body's Gyroscope measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
47|FreqBodyGyroMagFreqavg|Frequency domain signal for the Weighted average of the frequency components of the Body's Gyroscope measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
48|FreqBodyGyroJerkMagMean|Frequency domain signal for the Mean value of the Body's Gyroscope measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
49|FreqBodyGyroJerkMagFreqavg|Frequency domain signal for the Weighted average of the frequency components of the Body's Gyroscope measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
50|TimeBodyAccStdevX|Time domain signal for the Standard Deviation value of the Body's acceleration measure  for the 3-axial raw signal X.
51|TimeBodyAccStdevY|Time domain signal for the Standard Deviation value of the Body's acceleration measure  for the 3-axial raw signal Y.
52|TimeBodyAccStdevZ|Time domain signal for the Standard Deviation value of the Body's acceleration measure  for the 3-axial raw signal Z.
53|TimeGravityAccStdevX|Time domain signal for the Standard Deviation value of the Gravity acceleration measure  for the 3-axial raw signal X.
54|TimeGravityAccStdevY|Time domain signal for the Standard Deviation value of the Gravity acceleration measure  for the 3-axial raw signal Y.
55|TimeGravityAccStdevZ|Time domain signal for the Standard Deviation value of the Gravity acceleration measure  for the 3-axial raw signal Z.
56|TimeBodyAccJerkStdevX|Time domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal X.
57|TimeBodyAccJerkStdevY|Time domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Y.
58|TimeBodyAccJerkStdevZ|Time domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Z.
59|TimeBodyGyroStdevX|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure  for the 3-axial raw signal X.
60|TimeBodyGyroStdevY|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure  for the 3-axial raw signal Y.
61|TimeBodyGyroStdevZ|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure  for the 3-axial raw signal Z.
62|TimeBodyGyroJerkStdevX|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure for a Jerk movement  for the 3-axial raw signal X.
63|TimeBodyGyroJerkStdevY|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure for a Jerk movement  for the 3-axial raw signal Y.
64|TimeBodyGyroJerkStdevZ|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure for a Jerk movement  for the 3-axial raw signal Z.
65|TimeBodyAccMagStdev|Time domain signal for the Standard Deviation value of the Body's acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
66|TimeGravityAccMagStdev|Time domain signal for the Standard Deviation value of the Gravity acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
67|TimeBodyAccJerkMagStdev|Time domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
68|TimeBodyGyroMagStdev|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
69|TimeBodyGyroJerkMagStdev|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
70|FreqBodyAccStdevX|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure  for the 3-axial raw signal X.
71|FreqBodyAccStdevY|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure  for the 3-axial raw signal Y.
72|FreqBodyAccStdevZ|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure  for the 3-axial raw signal Z.
73|FreqBodyAccJerkStdevX|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal X.
74|FreqBodyAccJerkStdevY|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Y.
75|FreqBodyAccJerkStdevZ|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Z.
76|FreqBodyGyroStdevX|Frequency domain signal for the Standard Deviation value of the Body's Gyroscope measure  for the 3-axial raw signal X.
77|FreqBodyGyroStdevY|Frequency domain signal for the Standard Deviation value of the Body's Gyroscope measure  for the 3-axial raw signal Y.
78|FreqBodyGyroStdevZ|Frequency domain signal for the Standard Deviation value of the Body's Gyroscope measure  for the 3-axial raw signal Z.
79|FreqBodyAccMagStdev|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
80|FreqBodyAccJerkMagStdev|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
81|FreqBodyGyroMagStdev|Frequency domain signal for the Standard Deviation value of the Body's Gyroscope measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.
82|FreqBodyGyroJerkMagStdev|Frequency domain signal for the Standard Deviation value of the Body's Gyroscope measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.

### CookBook for Requirement 5: 

The codebook below was updated with new column names which includes the grouped and average indicator. The variable descriptions remained the same, however a "Type" column was added to show which variables was a result of the summarise calculations. 

#### Grouped Average Data from Tidy Dataset.

Column|FieldName|Description|Type
--|---------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------
1|Actvty_fctrs|1:Walking 2:Walking_Upstairs 3:Walking_Downstairs 4:Sitting 5:Standing 6:Laying|Group_by 1
2|Subject_ID|The Unique ID number given to volunteer.|Group_by 2
3|GrpdAvgTimeBodyAccMeanX|Time domain signal for the Mean value of the Body's acceleration measure  for the 3-axial raw signal X.|Calculation: Grouped Average
4|GrpdAvgTimeBodyAccMeanY|Time domain signal for the Mean value of the Body's acceleration measure  for the 3-axial raw signal Y.|Calculation: Grouped Average
5|GrpdAvgTimeBodyAccMeanZ|Time domain signal for the Mean value of the Body's acceleration measure  for the 3-axial raw signal Z.|Calculation: Grouped Average
6|GrpdAvgTimeGravityAccMeanX|Time domain signal for the Mean value of the Gravity acceleration measure  for the 3-axial raw signal X.|Calculation: Grouped Average
7|GrpdAvgTimeGravityAccMeanY|Time domain signal for the Mean value of the Gravity acceleration measure  for the 3-axial raw signal Y.|Calculation: Grouped Average
8|GrpdAvgTimeGravityAccMeanZ|Time domain signal for the Mean value of the Gravity acceleration measure  for the 3-axial raw signal Z.|Calculation: Grouped Average
9|GrpdAvgTimeBodyAccJerkMeanX|Time domain signal for the Mean value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal X.|Calculation: Grouped Average
10|GrpdAvgTimeBodyAccJerkMeanY|Time domain signal for the Mean value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Y.|Calculation: Grouped Average
11|GrpdAvgTimeBodyAccJerkMeanZ|Time domain signal for the Mean value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Z.|Calculation: Grouped Average
12|GrpdAvgTimeBodyGyroMeanX|Time domain signal for the Mean value of the Body's Gyroscope measure  for the 3-axial raw signal X.|Calculation: Grouped Average
13|GrpdAvgTimeBodyGyroMeanY|Time domain signal for the Mean value of the Body's Gyroscope measure  for the 3-axial raw signal Y.|Calculation: Grouped Average
14|GrpdAvgTimeBodyGyroMeanZ|Time domain signal for the Mean value of the Body's Gyroscope measure  for the 3-axial raw signal Z.|Calculation: Grouped Average
15|GrpdAvgTimeBodyGyroJerkMeanX|Time domain signal for the Mean value of the Body's Gyroscope measure for a Jerk movement  for the 3-axial raw signal X.|Calculation: Grouped Average
16|GrpdAvgTimeBodyGyroJerkMeanY|Time domain signal for the Mean value of the Body's Gyroscope measure for a Jerk movement  for the 3-axial raw signal Y.|Calculation: Grouped Average
17|GrpdAvgTimeBodyGyroJerkMeanZ|Time domain signal for the Mean value of the Body's Gyroscope measure for a Jerk movement  for the 3-axial raw signal Z.|Calculation: Grouped Average
18|GrpdAvgTimeBodyAccMagMean|Time domain signal for the Mean value of the Body's acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
19|GrpdAvgTimeGravityAccMagMean|Time domain signal for the Mean value of the Gravity acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
20|GrpdAvgTimeBodyAccJerkMagMean|Time domain signal for the Mean value of the Body's acceleration measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
21|GrpdAvgTimeBodyGyroMagMean|Time domain signal for the Mean value of the Body's Gyroscope measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
22|GrpdAvgTimeBodyGyroJerkMagMean|Time domain signal for the Mean value of the Body's Gyroscope measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
23|GrpdAvgFreqBodyAccMeanX|Frequency domain signal for the Mean value of the Body's acceleration measure  for the 3-axial raw signal X.|Calculation: Grouped Average
24|GrpdAvgFreqBodyAccMeanY|Frequency domain signal for the Mean value of the Body's acceleration measure  for the 3-axial raw signal Y.|Calculation: Grouped Average
25|GrpdAvgFreqBodyAccMeanZ|Frequency domain signal for the Mean value of the Body's acceleration measure  for the 3-axial raw signal Z.|Calculation: Grouped Average
26|GrpdAvgFreqBodyAccFreqavgX|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure  for the 3-axial raw signal X.|Calculation: Grouped Average
27|GrpdAvgFreqBodyAccFreqavgY|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure  for the 3-axial raw signal Y.|Calculation: Grouped Average
28|GrpdAvgFreqBodyAccFreqavgZ|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure  for the 3-axial raw signal Z.|Calculation: Grouped Average
29|GrpdAvgFreqBodyAccJerkMeanX|Frequency domain signal for the Mean value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal X.|Calculation: Grouped Average
30|GrpdAvgFreqBodyAccJerkMeanY|Frequency domain signal for the Mean value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Y.|Calculation: Grouped Average
31|GrpdAvgFreqBodyAccJerkMeanZ|Frequency domain signal for the Mean value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Z.|Calculation: Grouped Average
32|GrpdAvgFreqBodyAccJerkFreqavgX|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal X.|Calculation: Grouped Average
33|GrpdAvgFreqBodyAccJerkFreqavgY|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Y.|Calculation: Grouped Average
34|GrpdAvgFreqBodyAccJerkFreqavgZ|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Z.|Calculation: Grouped Average
35|GrpdAvgFreqBodyGyroMeanX|Frequency domain signal for the Mean value of the Body's Gyroscope measure  for the 3-axial raw signal X.|Calculation: Grouped Average
36|GrpdAvgFreqBodyGyroMeanY|Frequency domain signal for the Mean value of the Body's Gyroscope measure  for the 3-axial raw signal Y.|Calculation: Grouped Average
37|GrpdAvgFreqBodyGyroMeanZ|Frequency domain signal for the Mean value of the Body's Gyroscope measure  for the 3-axial raw signal Z.|Calculation: Grouped Average
38|GrpdAvgFreqBodyGyroFreqavgX|Frequency domain signal for the Weighted average of the frequency components of the Body's Gyroscope measure  for the 3-axial raw signal X.|Calculation: Grouped Average
39|GrpdAvgFreqBodyGyroFreqavgY|Frequency domain signal for the Weighted average of the frequency components of the Body's Gyroscope measure  for the 3-axial raw signal Y.|Calculation: Grouped Average
40|GrpdAvgFreqBodyGyroFreqavgZ|Frequency domain signal for the Weighted average of the frequency components of the Body's Gyroscope measure  for the 3-axial raw signal Z.|Calculation: Grouped Average
41|GrpdAvgFreqBodyAccMagMean|Frequency domain signal for the Mean value of the Body's acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
42|GrpdAvgFreqBodyAccMagFreqavg|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
43|GrpdAvgFreqBodyAccJerkMagMean|Frequency domain signal for the Mean value of the Body's acceleration measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
44|GrpdAvgFreqBodyAccJerkMagFreqavg|Frequency domain signal for the Weighted average of the frequency components of the Body's acceleration measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
45|GrpdAvgFreqBodyGyroMagMean|Frequency domain signal for the Mean value of the Body's Gyroscope measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
46|GrpdAvgFreqBodyGyroMagFreqavg|Frequency domain signal for the Weighted average of the frequency components of the Body's Gyroscope measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
47|GrpdAvgFreqBodyGyroJerkMagMean|Frequency domain signal for the Mean value of the Body's Gyroscope measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
48|GrpdAvgFreqBodyGyroJerkMagFreqavg|Frequency domain signal for the Weighted average of the frequency components of the Body's Gyroscope measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
49|GrpdAvgTimeBodyAccStdevX|Time domain signal for the Standard Deviation value of the Body's acceleration measure  for the 3-axial raw signal X.|Calculation: Grouped Average
50|GrpdAvgTimeBodyAccStdevY|Time domain signal for the Standard Deviation value of the Body's acceleration measure  for the 3-axial raw signal Y.|Calculation: Grouped Average
51|GrpdAvgTimeBodyAccStdevZ|Time domain signal for the Standard Deviation value of the Body's acceleration measure  for the 3-axial raw signal Z.|Calculation: Grouped Average
52|GrpdAvgTimeGravityAccStdevX|Time domain signal for the Standard Deviation value of the Gravity acceleration measure  for the 3-axial raw signal X.|Calculation: Grouped Average
53|GrpdAvgTimeGravityAccStdevY|Time domain signal for the Standard Deviation value of the Gravity acceleration measure  for the 3-axial raw signal Y.|Calculation: Grouped Average
54|GrpdAvgTimeGravityAccStdevZ|Time domain signal for the Standard Deviation value of the Gravity acceleration measure  for the 3-axial raw signal Z.|Calculation: Grouped Average
55|GrpdAvgTimeBodyAccJerkStdevX|Time domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal X.|Calculation: Grouped Average
56|GrpdAvgTimeBodyAccJerkStdevY|Time domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Y.|Calculation: Grouped Average
57|GrpdAvgTimeBodyAccJerkStdevZ|Time domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Z.|Calculation: Grouped Average
58|GrpdAvgTimeBodyGyroStdevX|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure  for the 3-axial raw signal X.|Calculation: Grouped Average
59|GrpdAvgTimeBodyGyroStdevY|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure  for the 3-axial raw signal Y.|Calculation: Grouped Average
60|GrpdAvgTimeBodyGyroStdevZ|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure  for the 3-axial raw signal Z.|Calculation: Grouped Average
61|GrpdAvgTimeBodyGyroJerkStdevX|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure for a Jerk movement  for the 3-axial raw signal X.|Calculation: Grouped Average
62|GrpdAvgTimeBodyGyroJerkStdevY|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure for a Jerk movement  for the 3-axial raw signal Y.|Calculation: Grouped Average
63|GrpdAvgTimeBodyGyroJerkStdevZ|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure for a Jerk movement  for the 3-axial raw signal Z.|Calculation: Grouped Average
64|GrpdAvgTimeBodyAccMagStdev|Time domain signal for the Standard Deviation value of the Body's acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
65|GrpdAvgTimeGravityAccMagStdev|Time domain signal for the Standard Deviation value of the Gravity acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
66|GrpdAvgTimeBodyAccJerkMagStdev|Time domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
67|GrpdAvgTimeBodyGyroMagStdev|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
68|GrpdAvgTimeBodyGyroJerkMagStdev|Time domain signal for the Standard Deviation value of the Body's Gyroscope measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
69|GrpdAvgFreqBodyAccStdevX|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure  for the 3-axial raw signal X.|Calculation: Grouped Average
70|GrpdAvgFreqBodyAccStdevY|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure  for the 3-axial raw signal Y.|Calculation: Grouped Average
71|GrpdAvgFreqBodyAccStdevZ|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure  for the 3-axial raw signal Z.|Calculation: Grouped Average
72|GrpdAvgFreqBodyAccJerkStdevX|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal X.|Calculation: Grouped Average
73|GrpdAvgFreqBodyAccJerkStdevY|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Y.|Calculation: Grouped Average
74|GrpdAvgFreqBodyAccJerkStdevZ|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement  for the 3-axial raw signal Z.|Calculation: Grouped Average
75|GrpdAvgFreqBodyGyroStdevX|Frequency domain signal for the Standard Deviation value of the Body's Gyroscope measure  for the 3-axial raw signal X.|Calculation: Grouped Average
76|GrpdAvgFreqBodyGyroStdevY|Frequency domain signal for the Standard Deviation value of the Body's Gyroscope measure  for the 3-axial raw signal Y.|Calculation: Grouped Average
77|GrpdAvgFreqBodyGyroStdevZ|Frequency domain signal for the Standard Deviation value of the Body's Gyroscope measure  for the 3-axial raw signal Z.|Calculation: Grouped Average
78|GrpdAvgFreqBodyAccMagStdev|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
79|GrpdAvgFreqBodyAccJerkMagStdev|Frequency domain signal for the Standard Deviation value of the Body's acceleration measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
80|GrpdAvgFreqBodyGyroMagStdev|Frequency domain signal for the Standard Deviation value of the Body's Gyroscope measure on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
81|GrpdAvgFreqBodyGyroJerkMagStdev|Frequency domain signal for the Standard Deviation value of the Body's Gyroscope measure for a Jerk movement on a magnitude measure of the three-dimensional signals calculated using the Euclidean norm.|Calculation: Grouped Average
