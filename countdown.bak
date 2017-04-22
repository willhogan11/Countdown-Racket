#lang racket

; Author: Will Hogan
; Module: Theory of Algorithms
; Date 09-02-17


; STEPS TO BE COMPLETED


#| STEP : Generate a Random 3 digit Target number between 101-999 inclusive
   The function 'targetNumber' defined below, generates a random integer between 101-999
   random is a reserved racket word and can take a single param, or two which is what i'm using here. |#
(define targetNumber (random 101 999))


; Display the value from the function defined above, the Target Number
(display "Target number : ")
targetNumber


; Create a list (define a function) consisting of the numbers from the below list
;[1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 25, 50, 75, 100]
(define availableNums(list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

(display "Your Available numbers are : ")
availableNums


; Choose 6 random numbers from the above list. Duplicates are allowed in the list, e.g. [1,4,10,10,25,2]

; First Define a function that takes a list as an argument and returns a random number from that list. 
(define (random-element list)
  (list-ref list (random (length list))))



#| Next we define a function that appends each randomly selected number from the available list
   of numbers, to a new list. This happens 6 six times, once for each of the numbers.NOTE: This works,
   however it's inefficient. My plan (time permitting) will be to try and work in a recursive algorithm that will optimise the code
   to allow each one of the numbers to be added to the list, which will a be more programatically efficient and cut down on the repeating code. |#
(define randomSixNumbers
(append (list (random-element availableNums)
              (random-element availableNums)
              (random-element availableNums)
              (random-element availableNums)
              (random-element availableNums)
              (random-element availableNums))))


(display "You have Randomly selected your 6 numbers, they are : ")
randomSixNumbers





#| Now that we have our Target number, List of Available numbers and 6 random numbers picked from that list..
   we can start to look at the actual Algorithm to be used and various permutations etc.|#

; To start, define two arbitrary numbers and a target number 
(define a 5)
(define b 25)
(define target 125)


; Define a list of operators
(define ops '(+ - * /))


; Next Define a list of all the possibilities for those 2 numbers using each of the operators [+ - * /]
(define listOfPossibles
  (list 
   (+ a b)
   (+ b a)
   (- a b)
   (- b a)
   (* a b)
   (* b a)
   (/ a b)
   (/ b a) ))


; Display the list of all possible permutations for variables 'a' and 'b'
listOfPossibles


#| Display if the number is in the above list using the inbuilt racket function 'member',
   that returns false if not present in the list, and displays list if it is.
   Need to find a better way to to this, as we don;t want a list with all permutations displayed on screen should
   the target number be in the list.....
   We also don't want fractions or Decimals in the output...|#
(member target listOfPossibles)


; Display the length of the list that contains all arrangements of the random list, excluding operators,
; 720 possible arrangements
; (permutations randomSixNumbers)
(display "The Length of the list with all random arrangements is: ")
(length (permutations randomSixNumbers))