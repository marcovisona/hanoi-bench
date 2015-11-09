#/bin/sh

g++ hanoi.cpp -march=native -Wall -O2  -o hanoi_c
strip hanoi_c
javac Hanoi.java

i=$1;
#for i in {19..20}; do
    echo "=== testing $i decks ==="

    g++ --version
    echo "c: $(./hanoi_c $i)"
    echo

    if [[ -x $(which node) ]]
        then
        node --version
        echo "node: $(node hanoi.js $i)"
        echo 
    fi

    if [[ -x $(which php) ]]
        then
        php --version
        echo "php: $(php hanoi.php $i)"
        echo 
    fi

    if [[ -x $(which java) ]]
        then
        java -version
        echo "java : $(java Hanoi $i)"
        echo 
    fi


    if [[ -x $(which ruby) ]]
        then
        ruby --version
        echo "ruby: $(ruby hanoi.rb $i)"
        echo 
    fi


    echo ""

#done
