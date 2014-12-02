;; Comments start with ;
1   ;; a number
"My name" ;; a string
a-symbol ;; symbol
(a b c) ;; list

;; To evaluate a form, go to end and C-x C-e
;; You will see the output in the echo area and also in the special *messages* buffer
1
(+ 1 1)
(* (* 3 4) 5)

(message "Hello world")
;; message also supports string formatting
(message "Hello. The year is %d and we are in %s" 2014 "Turkey")


(describe-function 'message) ;; Note the ' short for (quote ...)

(describe-function (quote message))

;; Functions are defined with (defun ...)

(defun my-adder (a b) (+ a b))

(my-adder 3 4) ;; You can also use C-M-x while inside the parens, no need to go to the end

;; Let's redefine the adder function

(defun my-adder (a b c) (+ a b c))

(my-adder 3 4 5)

;; This function is not a command. It cannot be called from M-x.
;; To create a function as a command, add (interactive) as the first form.

(defun my-command ()
  (interactive)
  (message "Hello World"))

;; Now type M-x then my-command should be there.

;; (interactive ) can take additional parameters. "s" for prompting for string. "n" for a number.
;; The answer from the user will be passes as a parameter to the command

(defun my-greeting (name)
  (interactive "s")
  (message "Hello %s" name))


;; Now type M-x my-greeting type your name and hit enter.

;; additional information can be provided next to the "s"
(defun my-greeting (name)
  (interactive "sWhat is your name? ")
  (message "Hello %s" name))

;; For other usages of interactive, see documentation C-h f interactive
;; or simply M-x describe-function Hit enter, then type interactive and type enter again.
;; or evaluate (describe-function 'interactive)


;; Logic

if

M-x describe-function if

(if (= 1 2) "1 is equal to 2" "1 is not equal to 2")

If there are multiple expressions in one of them, wrap those in a (progn...)

Usually used for side effects.

(if (= 1 2) "1 is equal to 2" (progn (message "Trying to beat the laws of maths?") "1 is not equal to 2"))

;; The special buffer *messages* will contain both "Trying to beat the
;; laws of maths?" and "1 is not equal to 2".


;; when, unless,  ...

;; M-x find-library RET subr RET

;; Again, describe-function will work for any of these even if some
;; are not functions they could be macros, special forms or subr's .

;; (dotimes binding body)
;; q is bound to 0 to 4 here.

(dotimes (q 5) (message "foo %d" q))

;; mapcar is similar to map in other functional langs, return values are collected.
(mapcar (lambda (x) (format "x is %d" x)) '(0 1 2 3 4 5))

;; mapc is similar to each in other langs, return values are not collected.
(mapc (lambda (x) (message "x is %d" x)) '(0 1 2 3 4 5))

;; dolist

(dolist (x '(0 1 2 3)) (lambda (x) (format "x is %d" x)))

;; use dash library to get better constructs, very similar to clojure ones
(package-install "dash")
(find-library "dash")

;; M-x idomenu or M-x imenu-add-menubar-index

;; Most functions here start with - or --
(require 'dash)

(-map (lambda (x) (format "x is %x" x)) '(0 1 2 3))

;; -- versions have an automatic `it' variable so we can avoid the lambda wrapper

(--map (format "y is %d" it) '(0 1 2 3))

(-reduce '+ '(0 1 2 3))

;; M-x ielm to get an Emacs Lisp repl

(-interpose "," (-map (lambda (x) (format "x is %d" x)) '(4 5 6)))

;; For string manipulation use s.el

(package-install 's)
(require 's)

;; M-x find-function require

;; M-x describe-variable features
;; or in ielm, simply type features

;; Variable scope in emacs

;; By default dynamic scope

;; lexical scope was introduced in emacs 24 and can be enabled per file.

;; global variables and buffer local variables

;; to see the value of buffer local variables, type M-: and enter the variable name
;; M-: executes eval-expression
