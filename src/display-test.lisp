(in-package :mao-test)

(in-suite mao)

(deftest (test-define-display :compile-before-run t) ()
 
  (define-description test-display ())

  (define-display ((description test-display))
   t "BRILLANT!")
  
  #+nil(is (equalp "BRILLANT!" (display-using-description 
			   (find-description 'test-display) 
			   nil :foo))))

(deftest test-symbol-display ()
  (is (stringp (display nil nil))))


		  
