(in-package :mao)

(define-description inline ())

(define-description t ()
  ((identity :label nil)
   (active-attributes :value '(identity))
   (attribute-delimiter :value ", ")
   (label-formatter :value (curry #'format nil "~A: "))
   (value-formatter :value (curry #'format nil "~A")))
  (:in-description inline))

(define-layered-class standard-attribute
  :in-layer #.(defining-description 'inline)
  ()
  ())

(defun display-inline (object &rest args)
  (with-active-descriptions (inline)
    (apply #'display *display* object args)))

(defun display-inline-attribute (attribute value)
  (if (ignore-errors (mao::attribute-active-attributes attribute))
      (handler-case (display-inline value :attributes (mao::attribute-active-attributes attribute))
	(error ()
	  (display-inline value)))
      (display-inline value)))



