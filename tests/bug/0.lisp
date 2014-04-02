(in-package :mao-test)

(in-suite mao)

;; Bug 0:

;; Redefining a superclass causes subclasses to remain uninitialized, 
;; which would break DISPLAY-USING-DESCRIPTION

(deftest bug-0 ()
  
  (eval '(progn 
	  
	  (define-description bug-0-test-superclass ()
	    ((bug-0-attribute :label "bug" :value 0)))

	  (define-description bug-0-test-subclass (bug-0-test-superclass)
	    ((bug-0-attribute-2 :label "subclass" :value 2)))

	  (is (mao::display-using-description (find-description 'bug-0-test-subclass) nil nil))

	  (define-description bug-0-test-superclass ()
	    ((bug-0-attribute :label "bug" :value 0)))
	  ;;; Breaks because redefinition of superclass occurred
	  (is (mao::display-using-description (find-description 'bug-0-test-subclass) nil nil)))))
