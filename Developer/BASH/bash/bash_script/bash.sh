### ===========================================================================
#!/bin/bash

declare -r NUM1=5

num2=4

num3=$((NUM1+num2))
num4=$((NUM1-num2))
num5=$((NUM1*num2))
num6=$((NUM1/num2))

echo "5 + 4 = $num3"
echo "5 - 4 = $num4"
echo "5 * 4 = $num5"
echo "5 / 4 = $num6"

echo $((5**2))
echo $(( 5%4 ))

rand=5
let rand+=4
echo "$rand"

echo "rand++ = $(( rand++ ))" 
echo "++rand = $(( ++rand ))" 
echo "rand-- = $(( rand-- ))" 
echo "--rand = $(( --rand ))" 


num7=1.2
num8=3.4
num9=$(python3 -c "print($num7+$num8)")
echo $num9


cat<< EOF
This text
prints on
many lines
EOF






### ===========================================================================

#!/bin/bash

getDate(){
    date
    
    return
}

getDate

name="Derek"

demLocal(){
    local name="Paul"
    return
}

demLocal

echo "$name"


getSum(){
    local num3=$1
    local num4=$2
    
    local sum=$((num3+num4))
    echo $sum
}

num1=5
num2=6

sum=$(getSum num1 num2)
echo "The sum is $sum"




### ===========================================================================

#!/bin/bash

read -p "How old are you? " age

if [ $age -ge 16 ]
then
    echo "You can drive"
elif [ $age -eq 15 ]
then
    echo "You can drive next year"
else
    echo "You can't drive"
fi






### ===========================================================================

#!/bin/bash

read -p "Enter a number: " num

if ((num == 10)); then
    echo "You number equals 10"
fi

if ((num > 10)); then
    echo "It is greater then 10"
else
    echo "It is less then 10"
fi


if (( ((num % 2)) == 0));then
    echo "It is even"
fi


if (( ((num > 0)) && ((num < 11)) )); then
    echo "$num is between 1 and 10"
fi


touch samp_file && vim samp_file

[ -d samp_dir ] || mkdir samp_dir





### ===========================================================================

#!/bin/bash

str1=""
str2="Sad"
str3="Happy"

if [ "$str1" ]; then
	echo "str1 is not null"
fi


if [ -z "$str1" ]; then
	echo "str1 has no value"
fi


if [ "$str2" == "$str3" ]; then
	echo "$str2 equals $str3"
elif [ "$str2" != "$str3" ]; then
	echo "$str2 is not equal to $str3"
fi


if [ "$str2" > "$str3" ]; then
	echo "$str2 is greater then $str3"
elif [ "$str2" < "$str3" ]; then
	echo "$str2 is less then $str3"
fi






### ===========================================================================

#!/bin/bash

file1="./test_file1"
file2="./test_file2"

if [ -e "$file1" ]; then
	echo "$file1 exists"

	if [ -f "$file1" ]; then
		echo "$file1 is a normal file"
	fi

	if [ -r "$file1" ]; then
		echo "$file1 is readable"
	fi

	if [ -w "$file1" ]; then
		echo "$file1 is writable"
	fi

	if [ -x "$file1" ]; then
		echo "$file1 is executable"
	fi

	if [ -d "$file1" ]; then
		echo "$file1 is a directory"
	fi

	if [ -L "$file1" ]; then
		echo "$file1 is symbolic link"
	fi

	if [ -p "$file1" ]; then
		echo "$file1 is a named pipe"
	fi

	if [ -S "$file1" ]; then
		echo "$file1 is a network socket"
	fi

	if [ -G "$file1" ]; then
		echo "$file1 is owned by the group"
	fi

	if [ -O "$file1" ]; then
		echo "$file1 is owned by the userid"
	fi
fi










