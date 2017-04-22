#lang racket

; Author: Will Hogan
; Module: Theory of Algorithms
; Date 01-03-17


; *******************************************************************
; Project Workings (Main racket for final code)


(define ns (make-base-namespace))



; Define a function ops that holds all operators 
(define ops (list + * - /))
(define ops1 '(+ - * /))

; Define 2 Variables
(define a 5) 
(define b 25)

; Another way of getting all permutations from the 2 values and completing the math
((car ops) a b)
((cadr ops) a b)
((caddr ops) a b)
((cadddr ops) a b)
((car ops) b a)
((cadr ops) b a)
((caddr ops) b a)
((cadddr ops) b a)


; List of all availble permutations given values from a list
; (permutations (list 5 25))


(define perms (permutations
   (cons + (list 5 25))))

perms


(define (lst a b)
  (cons + (list a b)) lst)

(lst 5 25)


;(define (cube num)
; (* num num))



(define (numList2 a b)
  (+ a b))

(numList2 5 25)


(cons (* 5 25) (numList2 5 25))



; Trying various combinations.......
(define (addRandNum num1 num2)
  (if (null? num1)
      0
      (+ num1 num2 (random 1 100))))


; (addRandNum 10 2)





; WIP
; ********************************************************************

; (permutations '(+ - * /))


(define perms1
  (cons 'a (permutations(cons '+ (cons '- (cons '/ (cons '*(list 5 25))))))))

; perms1

; ********************************************************************


; ***********************************************************8
; Next Steps 17th April 2017

; Steps:
; * Get each operator (car)
; * Get the cdr, cddr, cdddr, cddddr and the cdr cddddr (above), does the sum on each part of the list
; * Check if any of the elements in the new summed list are the targte number
; * Get this working with manual labour first
; * Then work on a recursive function to cut down code

(display "\n\n******************************")

; Define Random Operator function
(define (randomOps list)
  (list-ref list (random(length list))))

; List of nums
(display "\n\nList of available Numbers: \n")
(define numList (list 7 9 100 9 4 25))
numList


; Define target number
(define targetNumber (random 101 999))

(display "\nTarget Number is: \n")
targetNumber



(define addElementList
  (filter exact-nonnegative-integer? (list (apply (randomOps ops)(cdr numList)))))




; Display the list of numbers from each list
(display "\nThe Random function result\n")
addElementList


;*****************************************************************

#| Create a Function that uses a racket function called Cartesian Product 
   that takes in a two lists and performs Cartesian Join on them.
   In the below case, were taking each operator and adding it to another list of all possible permutations |#

(define ops2 '(+ - * /))

(define randomList
  (apply + (list 1 2 3)))

;randomList


(define (randList lst)
  (if (null? lst)
      null
      (apply + (lst))))

; (randList (list 5 25))


(define (sum l)
  (if (null? l)
      0
      (+ (car l) (sum (cdr l)))))


;(sum (list 1 2 3 4 5))





