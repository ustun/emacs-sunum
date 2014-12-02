(tool-bar-mode 0)
(scroll-bar-mode 0)
(winner-mode)

(windmove-default-keybindings)


(ido-mode 1)

(load-theme 'leuven)

(require 'package) ;; You might already have this line

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
					; (message "%s" package-archives)


(global-set-key [f2] 'save-buffer)
(global-set-key [f7] 'call-last-kbd-macro)
(global-set-key [f5] 'save-buffer)
(global-set-key [f1] 'kill-this-buffer)

(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

(require 'ido-ubiquitous)
(ido-vertical-mode 1)

(global-set-key (kbd "M-=") 'text-scale-increase)

(global-set-key (kbd "M--") 'text-scale-decrease)
(global-set-key (kbd "M-0") 'text-scale-set)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(require 'paredit)
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(add-hook 'emacs-lisp-mode-hook       #'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook       #'imenu-add-menubar-index)


(require 'elisp-slime-nav) ;; optional if installed via package.el
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'turn-on-elisp-slime-nav-mode))

;; (hello there (foo 1) 2)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-buffer-shorthand t)
 '(imenu-sort-function (quote imenu--sort-by-name))
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(ns-alternate-modifier (quote super))
 '(ns-command-modifier (quote meta))
 '(ns-right-alternate-modifier (quote control))
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :height 180 :family "PT Mono")))))



(fset 'yes-or-no-p 'y-or-n-p)


(recentf-mode 1)
(require 'saveplace)
(show-paren-mode 1)



(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; enable recent files mode.
(recentf-mode t)

					; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


(setq ido-enable-flex-matching t)

(global-set-key (kbd "C-.") 'imenu-anywhere)

(global-unset-key (kbd "s-q"))

(define-key paredit-mode-map (kbd "s-s") 'paredit-splice-sexp)
(define-key paredit-mode-map (kbd "M-s") 'save-buffer)



(delete-selection-mode 1)
(put 'scroll-left 'disabled nil)

(require 'info-look)
(defun info-lookup-symbol-elisp (symbol)
  (interactive (info-lookup-interactive-arguments 'symbol current-prefix-arg))
  (info-lookup 'symbol symbol 'emacs-lisp-mode))


					;(info-lookup-symbol-elisp 'if)


(defun switch-to-previous-buffer ()
      (interactive)
      (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key (kbd "<C-tab>") 'switch-to-previous-buffer)
(global-set-key (kbd "<C-S-tab>") 'previous-buffer)
(global-set-key (kbd "<S-tab>") 'next-buffer)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)



(global-hl-line-mode 1)
(whole-line-or-region-mode 1)


(defun org-windmove ()
  (add-hook 'org-shiftup-final-hook 'windmove-up)
  (add-hook 'org-shiftleft-final-hook 'windmove-left)
  (add-hook 'org-shiftdown-final-hook 'windmove-down)
  (add-hook 'org-shiftright-final-hook 'windmove-right))

(org-windmove)
