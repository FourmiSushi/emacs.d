(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 (quote
		(gnuplot ox-latex-subfigure smartparens inf-clojure slime-company exec-path-from-shell slime org org-plus-contrib clj-refactor cider clojure-mode company-lsp elm-mode company powerline gruvbox-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load "~/.emacs.d/common.el")
(if (not (equal window-system nil))
    (load "~/.emacs.d/gui.el"))
