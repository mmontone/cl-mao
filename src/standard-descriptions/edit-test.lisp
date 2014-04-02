(in-package :mao-test)

(deftest test-edit-simple ()
  (eval `(defclass edit-test ()
	   (string number)
	   (:metaclass described-standard-class)))
  (eval `(define-description edit-test (description-for-edit-test)
	   ((string :input (:type string))
	    (number :input (:type number)))))

  #+nil(is (string= (display nil (make-instance 'mao-test::edit-test))
	       "String #<UNBOUND>
Number #<UNBOUND>"))

  #+nil(progn (let ((i (make-instance 'mao-test::edit-test)))
	      (with-input-from-string (*standard-input* 
"drew
1
")
		(with-active-descriptions (editable)
		(display t i))
		(is (equal (display nil i)
"String drew
Number 1"))))))
