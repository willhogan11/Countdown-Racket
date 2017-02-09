#lang racket

; Author: Will Hogan
; Module: Theory of Algorithms
; Date 09-02-17


; STEPS TO BE COMPLETED


; STEP : Generate a Random 3 digit Target number between 101-999 inclusive
; The function 'captureRand' defined below, generates a random integer between 100-999 
(define captureRand (random 101 999))

; Test display the value from the function defined above
captureRand



; Create a list (define a function) consisting of the numbers from the below list
;[1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 25, 50, 75, 100]

(define listOfNums
  (list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))



; Choose 6 random numbers from the above list. Duplicates are allowed in the list, e.g. [1,4,10,10,25,2]
; Each number can only be used once....
; Will need to get the user to input these from the command line?