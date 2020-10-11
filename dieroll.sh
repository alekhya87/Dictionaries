#!/bin/bash/ 
declare -A dictionary;
dictionary[1]=0;
dictionary[2]=0;
dictionary[3]=0;
dictionary[4]=0;
dictionary[5]=0;
dictionary[6]=0;

flag=0;
minimum=11;
maximum=-1;
secondMinimum=0;

getDiceNumber () {
        randomValue=$((RANDOM%6+1));
        echo "random value is : "$randomValue;
        storeInDictionary $randomValue;
}

storeInDictionary () {
        key=$1;
   dictionary[$key]=$(( ${dictionary[$key]} + 1 ));
}

getMinimumMaximum () {
        for (( i=1; i<=${#dictionary[@]}; i++ ))
   do
        if [ ${dictionary[$i]} -lt $minimum ]
      then
                        secondMinimum=$minimum
                        minimum=${dictionary[$i]}

                elif [[ ${dictionary[$i]} -lt $secondMinimum && ${dictionary[$i]} -ne $minimum ]]
      then
        secondMinimum=${dictionary[$i]};
      fi;

      if [ ${dictionary[$i]} -gt $maximum ]
      then
                maximum=${dictionary[$i]};
      fi;

                if [ ${dictionary[$i]} -lt $minimum ]
      then
            minimum=${dictionary[$i]};
      fi;

        done;
}

rollDieMain () {
        while [ ${dictionary[1]} -lt 10 -a ${dictionary[2]} -lt 10 -a ${dictionary[3]} -lt 10 -a ${dictionary[4]} -lt 10 -a ${dictionary[5]} -lt 10 -a ${dictionary[6]} -lt 10 ]
        do
                getDiceNumber;
        done
        getMinimumMaximum;
}
rollDieMain;

echo "allkeys in dictionary : " ${!dictionary[@]};
echo "all elements "${dictionary[@]};
echo "maximum Value :"$maximum;
echo "minimum value : "$minimum;
echo "second minimum value :"$secondMinimum;
