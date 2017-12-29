(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
	(if (null? rests) rests
		(cons (append(cons first nil) (car rests)) 
		(cons-all first (cdr rests)))
	)
 )

(define (zip pairs)
	(if (null? (car pairs)) nil
    (cons (map (lambda (x) (car x)) pairs)
	(zip (map (lambda (y) (cdr y)) pairs)))
	)
)

;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
  (define n 0)
  (define (two-element-list s n)
		(if (null? s) s
		(cons(cons n (cons (car s) nil))
		(two-element-list (cdr s) (+ n 1)))
		)
  )
  (two-element-list s n)
)
  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 18
  (cond
	((null? denoms) nil)
	((= total 0) (cons (cons (car denoms) nil) nil))
	((< total (car denoms)) (list-change total (cdr denoms)))
	((= total (car denoms)) (append (list-change (- total (car denoms)) denoms)
	                                (list-change total (cdr denoms))))
	(else (append (cons-all (car denoms) 
	              (list-change (- total (car denoms)) denoms)) 
				  (list-change total (cdr denoms))))
  )
)
  ; END PROBLEM 18

;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (cons form (cons params (let-to-lambda body)))
           ; END PROBLEM 19
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
		   (define zip_list (zip values))
		   ;(cadr zip_list)
		   (cons (cons 'lambda (cons (car zip_list) (map let-to-lambda body)))
		                       (map let-to-lambda (cadr zip_list)))
           ; END PROBLEM 19
           ))
        (else
         ; BEGIN PROBLEM 19
		 (map let-to-lambda expr)
         ; END PROBLEM 19
         )))
