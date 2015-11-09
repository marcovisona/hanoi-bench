hanoi-bench
=======

An implementation of hanoi tower resolver in different web-related languages:
* C++
* Java
* JavaScript (Nodejs)
* PHP
* Ruby

To run all scripts launch
```
  ./run.sh [number of decks of the tower]
```

Each resolver prints out the execution time


My Test
-------

I run a test on my iMac mid 2010, for a number of decks variable from 18 to 24, using these compilers and interpreters: 
* php 5.5.29
* node v0.12.0
* ruby 2.0.0p645
* javac 1.7.0_71
* g++ LLVM 7.0.0

and these are the results I've obtained expressed in seconds 

| # decks | C++ | Javascript | Java | Ruby | PHP | 
|----|--------|--------|--------|--------|--------| 
| 18 | 0.0020 | 0.0040 | 0.0480 | 0.0632 | 0.2907 | 
| 19 | 0.0050 | 0.0070 | 0.0570 | 0.1253 | 0.5959 | 
| 20 | 0.0063 | 0.0083 | 0.0740 | 0.2385 | 1.1870 | 
| 21 | 0.0190 | 0.0290 | 0.1130 | 0.5033 | 2.5338 | 
| 22 | 0.0330 | 0.0430 | 0.1690 | 0.9547 | 4.8684 | 
| 23 | 0.0760 | 0.0860 | 0.3060 | 2.0705 | 10.1063 | 
| 24 | 0.1260 | 0.1690 | 0.5710 | 3.8711 | 20.3050 | 

Javascript performance are great, not far from C++ ones. Widely used web languages like PHP and Ruby have very poor performances compared to C++ Javascript and Java.
