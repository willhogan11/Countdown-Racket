# Countdown Numbers Game Application

- **Student Name:** Will Hogan
- **Student Number:** G00318460
- **College Name:** GMIT
- **Course:** Software Development
- **Module:** Theory of Algorithms
- **Lecturer:** Dr. Ian McLoughlin
- **Current College Year:** 4rd Year 
- **Project Title:** Countdown Numbers Game

---

# Summary

Countdown is a popular TV program, where a contestant is given a list of numbers and a target number. The object of the game is for the contestant to reach the target number using basic operators and any combination of the original list. I'm using the functional programming language _Racket_ to emulate the game. 

---

# Game Information and Rules

A target number is randomly chosen between ```101-999``` and displayed on screen. 

Then the following list is displayed on screen. These are the list of available numbers that are being worked with. 

```
(1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 25, 50, 75, 100)
``` 
Next, 6 random numbers are selected from the above list. 

For example, lets say that the below is a sample random arrangement of the 6 numbers:

```
(100, 3, 50, 10, 5, 9)
```

The user can use any combination of numbers in the list and use the following operators _+ - * /_ to try and compute number and reach the target. The user doesn't have to use all the 6 numbers to reach the target, but they can only use each of the 6 numbers once. If it happens that for example a 1 appears twice in the list, then both 1's can be used. The other caveat is that negative numbers and fractions are not allowed. 

Lets take an example. If we say our target number is 365, then one of the options using only 5 of the 6 in the above list of random numbers might be:

```
100 x 3 = 300

300 + 50 = 350

350 + 10 + 5 = 365
```

Altogether:
```
(100 x 3) + (50 + 10 + 5) = 365 
```

---

# Reverse Polish Notation 

---

# Documented Efforts
## Permutations
http://onlinestatbook.com/2/probability/permutations.html
## Combinations
## Cartesian Product
