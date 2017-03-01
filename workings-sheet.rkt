#lang racket

; Author: Will Hogan
; Module: Theory of Algorithms
; Date 01-03-17


; *******************************************************************
; Project Workings (Main racket for final code)



; Define a function ops that holds all operators 
(define ops (list + * - /))

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



(define (numList a b)
  (+ a b))

(numList 5 25)


(cons (* 5 25) (numList 5 25))






