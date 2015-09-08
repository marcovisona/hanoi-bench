/*
 * main.cpp
 *
 *  Created on: 02/giu/2010
 *      Author: marco
 */

#include <stack>
#include <iostream>
#include <sstream>
#include <sys/time.h>

using namespace std;
stack<int>* s1;
stack<int>* s2;
stack<int>* s3;
int movesCount = 0;

string printStack(stack<int>* printStack) {
	stack<int>* temp = new stack<int> ();
	string str = "";
	ostringstream oss;

	while (!printStack->empty()) {
		temp->push(printStack->top());
		printStack->pop();
	}

	while (!temp->empty()) {
		printStack->push(temp->top());
		oss << temp->top() << " ";
		temp->pop();
	}
	oss.flush();
	str = oss.str();
	delete temp;
	return str;
}

void hanoi(stack<int>* source, stack<int>* dest, stack<int>* swap, int depth) {
	if (depth == 1) {
		dest->push(source->top());
		source->pop();
		movesCount++;
		//		cout << "----- After " << movesCount << " moves" << endl;
		//		cout << "s1: " << printStack(s1) << endl;
		//		cout << "s2: " << printStack(s2) << endl;
		//		cout << "s3: " << printStack(s3) << endl;

		return;
	}
	// spostare la torre depth-1 strati preesistente in swap
	hanoi(source, swap, dest, depth - 1);

	// fare la seguente mossa
	dest->push(source->top());
	source->pop();
	movesCount++;

	//	cout << "----- After " << movesCount << " moves" << endl;
	//	cout << "s1: " << printStack(s1) << endl;
	//	cout << "s2: " << printStack(s2) << endl;
	//	cout << "s3: " << printStack(s3) << endl;

	// ricreare la torre di depth-1 strati sopra la destinazione
	hanoi(swap, dest, source, depth - 1);
}

void emptyStack(stack<int>* emptyStack) {
	while (!emptyStack->empty()) {
		emptyStack->pop();
	}
}

void playGame(int decks, bool quiet) {
	s1 = new stack<int> ();
	s2 = new stack<int> ();
	s3 = new stack<int> ();
	emptyStack(s1);
	emptyStack(s2);
	emptyStack(s3);
	movesCount = 0;
	for (int i = 0; i < decks; ++i) {
		s1->push(i);
	}

	if (!quiet) {
		cout << "Inizio" << endl;
		cout << "Stack1: " << printStack(s1) << endl;
		cout << "Stack2: " << printStack(s2) << endl;
		cout << "Stack3: " << printStack(s3) << endl;
	}

	timeval startTime;
	gettimeofday(&startTime, NULL);
	long startTimemillis = (startTime.tv_sec * 1000) + (startTime.tv_usec / 1000);

	hanoi(s1, s3, s2, decks);
	
	timeval finishTime;
	gettimeofday(&finishTime, NULL);
	long finishTimeMillis = (finishTime.tv_sec * 1000) + (finishTime.tv_usec / 1000);

	if (!quiet) {
		cout << "Fine" << endl;
		cout << "Stack1: " << printStack(s1) << endl;
		cout << "Stack2: " << printStack(s2) << endl;
		cout << "Stack3: " << printStack(s3) << endl;
	}

	float totalTime = (float)(finishTimeMillis - startTimemillis)/1000;
	cout << "decks:\t" << decks << "\ttime:\t" << totalTime << endl;
	
	delete s1;
	delete s2;
	delete s3;
}

int main(int argc, char **argv) {
	cout << "Entry point" << endl;
	char *p;
	
	long decks = strtol(argv[1], &p, 10);
	
	playGame(decks, true);
	
	// cout << "movesCount: " << movesCount << endl;

	// for (int i = 0; i < decks; ++i) {
	// 	playGame(i + 1, true);
	// }
}
