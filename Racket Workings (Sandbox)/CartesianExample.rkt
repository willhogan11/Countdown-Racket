#lang racket

(define ns (make-base-namespace))


(define target 125)
(define numList (list 5 25 56 23 1 12))
(define ops '(+ * - /))

        
(define flatList
  (flatten
   (list
    (cartesian-product ops (permutations numList)))))

; (cartesian-product ops (permutations numList))


;(list (eval (flatten (cadr (cartesian-product ops (permutations numList))))ns )
 ;     (eval (flatten (caddr (cartesian-product ops (permutations numList))))ns )
 ;     (eval (flatten (cadddr (cartesian-product ops (permutations numList))))ns )
  ;    (eval (flatten (cadddr (cartesian-product ops (permutations numList))))ns )
  ;    )

;(list (eval
;       (flatten
;        (cadr
;         (cartesian-product ops (permutations numList))))ns ))


(define (evalCart l)
  (if (null? l)
      0
      (list
       (eval
        (flatten
         (cadr
          (cartesian-product ops (permutations numList))))ns ) (evalCart (cons l)))))



;*************************************************************************************


(define (get-procedure term)
  (case term
    [(+) +]
    [(-) -]
    [(*) *]
    [(/) /]))


(define (evaluate term)
  (define procedure (get-procedure (first term)))
  (define arguments (second term))
  (apply procedure arguments))


(define resultList
  (filter exact-nonnegative-integer?
          (remove-duplicates
           (map evaluate
                (cartesian-product ops (permutations numList))))))

;Displays a list containing all permutations mapped with the Cartesian Product of each operator in the list. 
(cartesian-product ops (permutations numList))

resultList

(cond
  [(member target resultList)
   (display "Target found in the result list!")]
  [(display "Target NOT found in the list!")])



;(cond
;  [(member target resultList)
;   (display "Target found in the result list!")]
;  [(display "Target NOT found in the list!")])


