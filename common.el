;; よくわからんファイルを作るな
(setq make-backup-files nil)
(setq delete-auto-save-files t)
;; 括弧の対応きつくね？
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
;; 行番号
(setq display-line-numbers t)
(global-display-line-numbers-mode)
;; 言語周り(よくわからん)
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
;; スペース2でインデントする時代
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
;; 選択範囲のハイライト
(transient-mark-mode t)
;; 行削除
(setq kill-whole-line 1)
;; 最初のあれはいらん
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
;; うるせぇ！！
(setq ring-bell-function 'ignore)
;; 邪魔
(menu-bar-mode -1)


;; パッケージ
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; テーマをロードする
(require 'doom-themes)

(load-theme 'doom-sourcerer)
(doom-themes-org-config)

;; doom-modeline
(require 'doom-modeline)
(doom-modeline-mode 1)

(when (memq window-system '(mac ns x))
	(exec-path-from-shell-initialize))

(require 'smartparens-config)
(smartparens-global-mode t)

;; 補完
(require 'company)
(require 'company-web-html)
;; (global-company-mode t)
(add-hook 'prog-mode-hook 'company-mode)
(add-hook 'web-mode-hook 'company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
(delq 'company-files company-backends)
(add-to-list 'company-backends 'company-files)
(company-tng-configure-default)

;; lsp
(require 'lsp-mode)
(require 'company-lsp)
(require 'lsp-haskell)
(add-hook 'python-mode-hook #'lsp-deferred)
(add-hook 'haskell-mode-hook #'lsp-deferred)


(require 'cider)
(add-hook 'cider-mode-hook #'clj-refactor-mode)

;; org-mode
(org-babel-do-load-languages
 'org-babel-load-languages '((awk . t)
														 (shell . t)
														 (python . t)
														 (emacs-lisp . t)))

(require 'slime)
(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy slime-company))


(add-hook 'clojurescript-mode-hook #'inf-clojure-minor-mode)
(add-hook 'clojurescript-mode-hook #'eldoc-mode)


(require 'ox-latex)
(require 'ox-bibtex)
(setq org-latex-pdf-process '("latexmk"))
(setq org-latex-compiler "lualatex")
(setq org-latex-with-hyperref nil)
(add-to-list 'org-latex-classes
						 '("repoto"
							 "\\documentclass[a4paper,12pt]{ltjsarticle}
\\mathtoolsset{showonlyrefs=true}
\\sisetup{math-micro=\\text{µ},text-micro=µ}"
							 ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(ido-mode 1)
(ido-everywhere 1)

(setq ido-enable-flex-matching t)

(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)
(require 'amx)
(amx-mode 1)
(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-vertical-show-count t)
