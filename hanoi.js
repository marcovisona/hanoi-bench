var s1 = [];
var s2 = [];
var s3 = [];
var movesCount = 0;

Array.prototype.top = function() {
    return this[this.length - 1];
};

Array.prototype.isEmpty = function() {
    return this.length === 0;
};

function printStack(currStack) {
    var temp = [];
    var str = "";
    var oss = "";

    while (!currStack.isEmpty()) {
        temp.push(currStack.pop());
    }

    while (!temp.isEmpty()) {
        currStack.push(temp.top());

        oss += temp.top() + " ";

        temp.pop();
    }

    return oss;
}

function hanoi(source, dest, swap, depth) {
    if (depth == 1) {
        dest.push(source.top());
        source.pop();
        movesCount++;

        return;
    }
    // spostare la torre depth-1 strati preesistente in swap
    hanoi(source, swap, dest, depth - 1);

    // fare la seguente mossa
    dest.push(source.top());
    source.pop();
    movesCount++;

    // ricreare la torre di depth-1 strati sopra la destinazione
    hanoi(swap, dest, source, depth - 1);
}

function emptyStack(stack) {
    while (!stack.isEmpty()) {
        stack.pop();
    }
}

function playGame(decks, quiet) {
    s1 = [];
    s2 = [];
    s3 = [];
    emptyStack(s1);
    emptyStack(s2);
    emptyStack(s3);
    movesCount = 0;
    for (i = 0; i < decks; ++i) {
        s1.push(i);
    }
    if (!quiet) {
        console.log("Inizio");
        console.log("Stack1: " + printStack(s1));
        console.log("Stack2: " + printStack(s2));
        console.log("Stack3: " + printStack(s3));
    }

    var startTime = +new Date();

    hanoi(s1, s3, s2, decks);

    var finishTime = +new Date();

    if (!quiet) {
        console.log("Fine");
        console.log("Stack1: " + printStack(s1));
        console.log("Stack2: " + printStack(s2));
        console.log("Stack3: " + printStack(s3));
    }

    var totalTime = (finishTime - startTime) / 1000;
    console.log("decks:\t" + decks + "\ttime:\t" + totalTime + "\n");

}


// MAIN

console.log("Entry point");
var decks = parseInt(process.argv[2]);

playGame(decks, true);
// console.log("movesCount: " + movesCount);
