#lang racket

; Author: Will Hogan
; Module: Theory of Algorithms
; Date 09-02-17


; STEPS TO BE COMPLETED


; STEP : Generate a Random 3 digit Target number between 101-999 inclusive
; The function 'targetNumber' defined below, generates a random integer between 101-999
; random is a reserved racket word and can take a single param, or two which is what i'm using here. 
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



; Next we define a function that appends each randomly selected number from the available list
; of numbers, to a new list. This happens 6 six times, once for each of the numbers.
; NOTE: This works, however it's inefficient. My plan (time permitting) will be to try and work in a recursive algorithm that will optimise the code
; to allow each one of the numbers to be added to the list, which will a be more programatically efficent and cut down on the repeating code. 
(define randomSixNumbers
(append (list (random-element availableNums)
              (random-element availableNums)
              (random-element availableNums)
              (random-element availableNums)
              (random-element availableNums)
              (random-element availableNums))))


(display "You have Randomly selected your 6 numbers, they are : ")
randomSixNumbers





