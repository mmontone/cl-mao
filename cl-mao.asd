;;; -*- lisp -*-

(defsystem :cl-mao
  :license 
  "Copyright (c) 2004-2007 Drew Crampsie

Contains portions of ContextL: 
Copyright (c) 2005 - 2007 Pascal Costanza

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the \"Software\"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE."
  :components ((:module :src
			:components ((:file "packages")
				     (:file "utilities")
				     (:module :mao
					      :components ((:file "simple-plist-attribute") 
							   (:file "attribute")				    
							   (:file "description-class")
							   (:file "description")
							   (:module :display
							    :components ((:file "display-attribute") 
									 (:file "display-description")
									 (:file "define-description-compat"))
							    :serial t))
					      :serial t)
				     (:file "display")
				    (:module :standard-descriptions
					      :components ((:file "t")
							   (:file "inline")
							   (:file "edit")
							   (:file "symbol")
							   (:file "list")
							   (:file "null")
							   (:file "clos")
							   (:file "validate"))
					      :serial t))
			:serial t))
  :serial t
  :depends-on (:contextl :arnesi :alexandria :parse-number :trivial-garbage))

(defsystem :cl-mao.test
  :components ((:module :src
			:components ((:file "packages-test")
				     (:file "description-test")
				     (:file "attribute-test")
				     (:file "display-test")
				     (:module :standard-descriptions
				      :components ((:file "edit-test"))
				      :serial t))
			:serial t)
	       (:module :tests
			:components ((:module :bug
					      :components ((:file "0"))))))
  :serial t
  :depends-on (:cl-mao :stefil))
