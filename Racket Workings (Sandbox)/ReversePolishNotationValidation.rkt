#lang racket


;Convert
(define [char->number c] (- (char->integer c) 48))
(define [number->char n] (integer->char (+ n 48)))

(define [chars->number chars]
  (let* ([len (length chars)]
         [dec-weights (reverse (map (curry expt 10) (range 0 len)))])
    (apply + (map * (map char->number chars) dec-weights))))

(define [get-width int]
  (define [iter e] (if [= 0 (floor (/ int (expt 10 e)))] e (iter (add1 e))))
  (iter 1))

(define [number->chars int]
  (let* ([width (get-width int)]
         [dec-weights (reverse (map (curry expt 10) (range 0 width)))])
    (map (λ [w] (number->char (remainder (floor (/ int w)) 10))) dec-weights)))

(provide (all-defined-out))



;************************************************************************************


(define operator-table
  (list (cons #\+ +) (cons #\- -) (cons #\* *) (cons #\/ /)))

(define [eval-rpn tokens]
  (define [walk remaining accum]
    (define [not-operator? elt] [not (assoc (car elt) operator-table)])
    (define [calc op op-a op-b]
      (let ([int-a (chars->number op-a)] [int-b (chars->number op-b)]
            [operator (cdr (assoc (car op) operator-table))])
        (number->chars (operator int-a int-b))))

    (if [null? remaining] (list->string (car accum))
      (let ([first-elt (car remaining)] [rest-elts (cdr remaining)])
        (if [not-operator? first-elt]
          (walk rest-elts (cons first-elt accum))
          (let ([op-a (car accum)] [op-b (cadr accum)])
            (walk rest-elts (cons (calc first-elt op-a op-b) (cddr accum))))))))

  (walk (map string->list tokens) '()))

(define test-tokens-a '("2" "1" "+" "3" "*"))
(define test-tokens-b '("4" "13" "5" "/" "+"))

(eval-rpn test-tokens-a)
(eval-rpn test-tokens-b)