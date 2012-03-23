
(load "../mono.lisp")
(use-package :trio-utils)

(defvar *delay*)
(defvar trio-spec)
(defvar init-de)


(defvar constr
  (alwf (somf (-P- in-d))))


(loop for bound in '(20) do

      (loop for d from 10 to 10 do ;;by 10 

	    (setq *delay* d)
	    (clean-up)
	    (setq trio-spec
		  (alw 
		    (<-> (-P- in-d) (futr (-P- out-d) *delay*))
		    )) 


	    (setq init-de
		  (&& (!! (-P- in-d))
		      (!! (-P- out-d))
		      (-A- x (loop for x from 1 to (1- *delay*) collect x)
			   (!!(futr (-P- out-d) x)))))

	    (format t "$ de : History generation : delay:~s bound=~s~%" *delay* bound)
	    (assert (funcall the-zot 
			     bound
			     (&& trio-spec
				 init-de
				 constr
				 )
			     ))
	    ))
