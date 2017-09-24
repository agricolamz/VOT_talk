# This script will calculate the durations of all labeled segments in a TextGrid object.
# The results will be save in a text file, each line containing the label text and the 
# duration of the corresponding segment..
# A TextGrid object needs to be selected in the Object list.
#
# This script is distributed under the GNU General Public License.
# Copyright 12.3.2002 Mietta Lennes

# ask the user for the tier number
form Calculate durations of labeled segments
	comment Which tier of the TextGrid object would you like to calculate the duration for?
	integer tier_Duration 1
	comment Which tier of the TextGrid object would you like to take the information from?
	integer tier_Label_1 2
	comment Which tier of the TextGrid object would you like to take the information from?
	integer tier_Label_2 3
	comment Which tier of the TextGrid object would you like to take the information from?
	integer tier_Label_3 4
	comment Which prefix do you want to use for the results from this TextGrid?
	text informant D3
	comment Where do you want to save the results?
	text textfile /home/.../result.txt
endform

# check how many intervals there are in the selected tier:
numberOfIntervals = Get number of intervals... tier_Duration

# loop through all the intervals
for interval from 1 to numberOfIntervals
	label$ = Get label of interval... tier_Duration interval
	# if the interval has some text as a label, then calculate the duration.
	if label$ <> ""
		start = Get starting point... tier_Duration interval
		end = Get end point... tier_Duration interval
		duration = (end - start)*1000
	# get the tier_Label_1 interval number at the start of the tier_Duration:
		t2 = Get interval at time... tier_Label_1 start
	# get the label of smth from tier_Label_1:
		secondLabel$ = Get label of interval... tier_Label_1 t2
	# get the tier_Label_2 interval number at the start of the tier_Duration:
		t3 = Get interval at time... tier_Label_2 start
	# get the label of smth from tier_Label_2:
		thirdLabel$ = Get label of interval... tier_Label_2 t3
	# get the tier_Label_3 interval number at the start of the tier_Duration:
		t4 = Get interval at time... tier_Label_3 start
	# get the label of smth from tier_Label_3:
		fourthLabel$ = Get label of interval... tier_Label_3 t4
	# append the label and the duration to the end of the text file, separated with a tab:		
		resultline$ = "'informant$''tab$''fourthLabel$''tab$''thirdLabel$''tab$''secondLabel$''tab$''label$''tab$''duration''tab$''start''tab$''end''newline$'"
		fileappend "'textfile$'" 'resultline$'
	endif
endfor
