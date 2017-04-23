#lang racket

(define ns (make-base-namespace))

(define numList (list 2 7 9 25 50 15))
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


(filter exact-nonnegative-integer?(remove-duplicates(map evaluate (cartesian-product ops (permutations numList)))))