(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define (add-interval x y)
	(make-interval (+ (lower-bound x) (lower-bound y))
				   (+ (upper-bound x) (upper-bound y))))
				   
(define (sub-interval x y ) 
	(make-interval (abs (- (lower-bound x) (lower-bound y)))
				   (abs (- (upper-bound x) (upper-bound y)))))
				   
(define (mul-interval x y)
	(let ((p1 (* (lower-bound x) (lower-bound y)))
		 (p2 (* (lower-bound x) (upper-bound y)))
		 (p3 (* (upper-bound x) (lower-bound y)))
		 (p4 (* (upper-bound x) (upper-bound y))))
	(make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))
	
(define (div-interval x y)
	(mul-interval x 
			(if (or (equal? (car y) 0) (equal? (cdr y) 0)) 
				(error "Cannot divide by an interval with a span of 0...")
				(make-interval (/ 1.0 (upper-bound y)) (/ 1.0 (lower-bound y))))))
				

(define (make-center-percent c p)
	(make-interval (- c (* c (/ p 100))) (+ c (* c (/ p 100)))))
	
(define (percent interval) (let* ((a (/ (- (upper-bound interval) (lower-bound interval)) 2)) (c (- (upper-bound interval) a)))
						   (* (/ a c) 100)))
(define int1 (make-interval 1 4))
(define int2 (make-interval 3 5))
(define int3 (make-interval 3 0))
