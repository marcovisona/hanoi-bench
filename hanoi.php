<?php 
$s1 = [];
$s2 = [];
$s3 = [];
$movesCount = 0;

// Array.prototype.top = function() {
//     return this[this.length - 1];
// };

// Array.prototype.isEmpty = function() {
//     return this.length === 0;
// };
function array_top(&$array){
    return $array[count($array) - 1];
}

function printStack(&$currStack) {
    $temp = [];
    $str = "";
    $oss = "";

    while (count($currStack) !== 0) {
        array_push($temp, array_pop($currStack));
    }

    while (count($temp) !== 0) {
        array_push($currStack, array_top($temp));

        $oss .= array_top($temp) . " ";

        array_pop($temp);
    }

    return $oss;
}

function hanoi(&$source, &$dest, &$swap, $depth) {
    global $movesCount;

    if ($depth == 1) {
        array_push($dest, array_top($source));
        array_pop($source);
        
        $movesCount++;
        
        return;
    }
    // spostare la torre depth-1 strati preesistente in swap
    hanoi($source, $swap, $dest, $depth - 1);

    // fare la seguente mossa
    array_push($dest, array_top($source));
    array_pop($source);
    $movesCount++;

    // ricreare la torre di depth-1 strati sopra la destinazione
    hanoi($swap, $dest, $source, $depth - 1);
}

function emptyStack(&$stack) {
    while (count($stack) !== 0) {
        array_pop($stack);
    }
}

function playGame($decks, $quiet) {
    global $s1, $s2, $s3;
    $s1 = [];
    $s2 = [];
    $s3 = [];
    emptyStack($s1);
    emptyStack($s2);
    emptyStack($s3);
    $movesCount = 0;
    for ($i = 0; $i < $decks; ++$i) {
        array_push($s1, $i);
    }
    if (!$quiet) {
        echo ("Inizio" . "\n");
        echo ("Stack1: " . printStack($s1) . "\n");
        echo ("Stack2: " . printStack($s2) . "\n");
        echo ("Stack3: " . printStack($s3) . "\n");
    }

    $startTime = microtime(true);

    hanoi($s1, $s3, $s2, $decks);

    $finishTime = microtime(true);

    if (!$quiet) {
        echo ("Fine" . "\n");
        echo ("Stack1: " . printStack($s1) . "\n");
        echo ("Stack2: " . printStack($s2) . "\n");
        echo ("Stack3: " . printStack($s3) . "\n");
    }

    $totalTime = ($finishTime - $startTime);
    echo("decks:\t" . $decks . "\ttime:\t" . $totalTime . "\n");

}


// MAIN

echo ("Entry point\n");
$decks = intval($argv[1]);


playGame($decks, true);
// echo ("movesCount: " . $movesCount + "\n");
