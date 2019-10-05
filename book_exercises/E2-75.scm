(define (make-from-mag-ang r a)
	(define (dispatch op)
		(cond ((eq? op ’magnitude) r)
			  ((eq? op ’angle) a)
			  ((eq? op ’real-part)
			    (* (magnitude z) (cos (angle z))))
			  ((eq? op ’imag-part) 
			    (* (magnitude z) (sin (angle z))))
			  (else
				(error "Unknown op -- MAKE-FROM-MAG-ANG" op))))
dispatch)