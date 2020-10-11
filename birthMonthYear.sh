#!/bin/bash/ 
count=0
declare -A birthdictionary

function birthYear(){
	echo $(( RANDOM%2+92))
}
function birthMonth(){
	echo $(( RANDOM%12+1))
}
function monthYearData(){
	month=$1
	year=$2
	value="$month-$year"
	birthdictionary[$month]="${birthdictionary[$month]} $value"
}
function printmonth(){
	for (( i=1; i<=12; i++ ))
	do
		echo ${birthdictionary[$i]}
	done
}
function monthMain(){
	while [ $count -ne 50 ]
	do
		year=$(birthYear)
		month=$(birthMonth)
		monthYearData $month $year
		((count++))
	done
	printmonth
}
monthMain
