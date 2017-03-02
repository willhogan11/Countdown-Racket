#lang racket


;(define perms
;  (permutations(cons + (cons - (cons / (cons * '(5 25)))))))

(define perms
  (permutations(cons '+ '(5 25))))

perms

(define ops1 '(+ - * /))

(define ops2 (list + * - /))


;(permutations
; (cons (car ops)(list 5 25)))


;(list ((car ops2) 5 25) ((cadr ops2) 5 25) )



(list ((car ops2) 5 25)
      ((cadr ops2) 5 25) )


(list (+ '5 25) (+ '25 5) (* '5 25) (* '25 5) (/ '5 25) (/ '25 5) (- '5 25) (- '25 5))


(permutations '(5 25))


;(define (lst a b)
;  (cons (car ops2) (permutations(list a b)))
;  (cons (cadr ops2) (permutations(list a b))))

;(lst 5 25)


(cons (car ops2) (permutations (list (+ '5 '25))))

; (permutations '(+ (5 25)))



(list (+ '5 25))

(cons (list (+ 5 25)(+ 25 5))(list))



