
#!/bin/bash

NUM1=100
NUM2=200

SUM=$(($NUM1+$NUM2))

echo "Sum is: $SUM"

#Array
FRUITS=("Apple" "Banana" "Mango" "Grapes")

echo "Fruits are: ${FRUITS[@]}"
echo "First Fruit is: ${FRUITS[0]}"
echo "Second Fruit is: ${FRUITS[1]}"
echo "Third Fruit is: ${FRUITS[2]}"
echo "Fourth Fruit is: ${FRUITS[3]}"    