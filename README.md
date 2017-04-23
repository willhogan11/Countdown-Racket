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



---

# Documented Efforts
Due to the challenging times i encountered during my time working on this project, i felt it was important to share my experiences and detail my findings.

Here's are some of the ways i tried to solve the Countdown Game in Racket. 

## Brute Force
To begin with, i felt that trying to deal with 6 numbers was quite daunting and decided to try and solve the solution with 2 instead. 
The way i've completed this is in it's basic brute force form, for example;
```racket
(define listOfPossibles
  (remove-duplicates(filter exact-nonnegative-integer?
          (list 
           (+ a b)
           (+ b a)
           (- a b)
           (- b a)
           (* a b)
           (* b a)
           (/ a b)
           (/ b a)))))
```
The ```listOfPossibilites``` mentions some outside functions, but essentially _a_ and _b_ are hard coded numbers, for example 5 and 25. The math is then completed on each section and the list of result returned. I have removed all duplicates as ```+ 5 25``` is the same as ```+ 25 5```. I also used the ```filter exact-nonnegative-integer?``` to filter outany decimal or fraction results. reference
[racket-filter documentation](https://docs.racket-lang.org/reference/pairs.html?q=filter#%28def._%28%28lib._racket%2Fprivate%2Flist..rkt%29._filter%29%29)

I then used the in-built ```member``` function, which check if the target number (in this case 125), is in the list of results. Reference [Racket member](https://docs.racket-lang.org/reference/pairs.html?q=member#%28def._%28%28lib._racket%2Fprivate%2Fbase..rkt%29._member%29%29)


## Permutations
The math associated with these operations in the Cartesian Product page in this wiki is as follows;
```pseudo
let n = 6 (Length of the list of numbers)
let x = 4 (Number of Operators)
n*(n-1)*(n-2)*....*(n-5) = n!

Plug in the numbers into the above..
6*(6-1)*(6-2)*(6-3)*(6-4)*(n-5) = 6!
6! = 720
```
Now that we have the number of permutations for a 6 number list, we need to factor in the operators. 
Essentially, we need to get the cartesian product from mapping every value in _n_ to every value in _x_. 
To do this we simply say;
```
n! * x
Which is 6! * 4 = 2880
```
As this list grows, so does the cartesian product result. 
It's safe to say that this algorithm grows exponentially and won't be able to finish in polynomial time as the rate of the time required to complete the task, grows much faster than the list size increases. 

I used the below link to help me gain a better understanding about how permutations are calculated. 
[http://onlinestatbook.com/2/probability/permutations.html](http://onlinestatbook.com/2/probability/permutations.html)

## Combinations

## Cartesian Product
I used the in-built **cartesian-product** function to create an optimised version of the 2 number solution highlighted in the Brute Force section of this page.

Firstly, determine which procedure you want by comparing for symbol equality.
Since racket has first class procedures, we can just return the procedure itself
```racket
(define (get-procedure term)
  (case term
    [(+) +]
    [(-) -]
    [(*) *]
    [(/) /]))
```
Next create a function that takes a term argument, define two other functions (procedure & arguments) to get the first and second elements, then use this with the in-built apply function
```racket
(define (evaluate term)
  (define procedure (get-procedure (first term)))
  (define arguments (second term))
  (apply procedure arguments))
```

Then define another function that simply stores each calulated result in a list and filters out negative and fraction values. 
The **cartesian-product** is used with each operator in the **ops** function (contains + * - /) to each permutation of a given number list (in this case _numList_). We then use **map** to complete the calculation for each casterian permutation.

```racket
(define resultList
  (filter exact-nonnegative-integer?
          (remove-duplicates
           (map evaluate
                (cartesian-product ops (permutations numList))))))
```

I was then able to check if the _target_ number is in the _numList_ using the in-built _member_ and _cond_
```racket
(cond
  [(member target resultList)
   (display "\nTarget found in the result list!")]
  [(display "\nTarget NOT found in the list!")])
```

## Reverse Polish Notation
Although not implemented in this project, here's a run through of some of the basics that i researched.
The idea behind RPN is to remove the brackets associated with ordering in mathematics, such as BOMDAS (Brackets, Operators, Multiply, Divide, Add, Subtract). 

Lets look at an example that one might be used to;

```(3 + 5) * (7 – 2)```
Which if going by the BOMDAS convention, would lead us to do what's in the brackets first and then the multipication. 
This would be reduced down to;
```
(8) * (5)
8 * 5 = 40
```
In RPN, the numbers and operators are listed one after another, and an operator always acts on the most recent numbers in the list. The numbers can be thought of as forming a stack, like a pile of plates. The most recent number goes on the top of the stack. An operator takes the appropriate number of arguments from the top of the stack and replaces them by the result of the operation.

Using this convention, the above would look like the following;

```3 5 + 7 2 – *```
The RPN steps for the above are;
* From left to Right, 3 gets pushed onto the Stack.
* Push 5 onto the Stack (The Stack now contains 3 5, 3 is at the bottom).
* The + operator is applied to the top two numbers and they are removed from the stack. 8 is now on the stack.
* 7 is pushed onto the stack.
* 2 is pushed onto the stack. The stack currently has values [8 7 2].
* The minus operator is applied to the 7 2, they are then popped off the stack. Stack now has [8 5].
* The final * operator is applied to the 8 and 5 which are both popped off the stack and the result, 40 is pushed back on.  

