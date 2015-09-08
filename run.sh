#/bin/sh

g++ hanoi.cpp -march=native -Wall -O2  -o hanoi_c
strip hanoi_c
javac Hanoi.java

i=$1;
#for i in {20..20}; do
    echo "=== testing $i ==="

    echo "c: $(./hanoi_c $i)"

    if [[ -x $(which node) ]]
        then
        echo "node: $(node hanoi.js $i)"
    fi

    if [[ -x $(which php) ]]
        then
        echo "php: $(php hanoi.php $i)"
    fi

    if [[ -x $(which java) ]]
        then
        echo "java : $(java Hanoi $i)"
    fi


    if [[ -x $(which ruby) ]]
        then
        echo "ruby: $(ruby hanoi.rb $i)"
    fi


    echo "\n\n"

#done
