(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5e0b63e0373472b2e1cf1ebcc27058a683166ab544ef701a6e7f2a9f33a23726" "2a3ffb7775b2fe3643b179f2046493891b0d1153e57ec74bbe69580b951699ca" "e7666261f46e2f4f42fd1f9aa1875bdb81d17cc7a121533cad3e0d724f12faf2" "0d087b2853473609d9efd2e9fbeac088e89f36718c4a4c89c568dd1b628eae41" "1728dfd9560bff76a7dc6c3f61e9f4d3e6ef9d017a83a841c117bd9bebe18613" "f30aded97e67a487d30f38a1ac48eddb49fdb06ac01ebeaff39439997cbdd869" "3952ef318c8cbccf09954ecf43250ac0cbd1f4ae66b4abe569491b260f6e054b" default)))
 '(org-latex-classes
   (quote
    (("article" "\\documentclass[11pt,a4paper]{ltjsarticle}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt,a4paper]{ltjsreport}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))))
 '(org-latex-compiler "lualatex")
 '(org-latex-default-packages-alist
   (quote
    (("AUTO" "inputenc" t
      ("pdflatex"))
     ("T1" "fontenc" t
      ("pdflatex"))
     ("" "graphicx" t nil)
     ("" "longtable" nil nil)
     ("" "wrapfig" nil nil)
     ("" "rotating" nil nil)
     ("normalem" "ulem" t nil)
     ("" "amsmath" t nil)
     ("" "textcomp" t nil)
     ("" "amssymb" t nil)
     ("" "capt-of" nil nil)
     ("" "hyperref" nil nil))))
 '(org-latex-packages-alist
   (quote
    (("" "booktabs" nil)
     ("" "siunitx" nil)
     ("" "ascmac" nil)
     ("" "mhchem" nil)
     "\\sisetup{math-micro=\\text{µ},text-micro=µ}")))
 '(package-selected-packages
   (quote
    (go-mode yasnippet yasnipped slime-company ox-latex-subfigure org-plus-contrib lsp-ui lsp-haskell company-lsp exec-path-from-shell magit ido-vertical-mode amx ido-completing-read+ use-package smartparens slime lsp-mode doom-themes doom-modeline company-web))))

;; それぞれじゃまなのを消す
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; マウスホイールはあってもいい
(mouse-wheel-mode t)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; 2行ずつ動く
(setq mouse-wheel-progressive-speed nil) ;; 加速しない
(setq mouse-wheel-follow-mouse t) ;; いい感じにする

;; クリップボード なんかデフォルトでこうなってたけど念の為設定ファイルでも
(setq x-select-enable-clipboard t)
(setq select-enable-clipboard t)
(setq select-enable-primary nil)

(add-to-list 'default-frame-alist '(height . 32))
(add-to-list 'default-frame-alist '(width . 96))

;; フォント
(when (member "M+ 1mn" (font-family-list))
 (add-to-list 'default-frame-alist '(font . "Ubuntu Mono-12")))
(create-fontset-from-ascii-font "M+ 1mn-16" nil "mplus1mn")
(set-fontset-font "fontset-mplus1mn" 'unicode
                 (font-spec :family "M+ 1mn" :size 16)
                 nil 'prepend)
(add-to-list 'default-frame-alist '(font . "fontset-mplus1mn"))

;; カーソル
(add-to-list 'default-frame-alist '(cursor-type . bar))

;; よくわからんファイルを作るな
(setq make-backup-files nil)
(setq delete-auto-save-files t)
;; 括弧の対応きつくね？
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)

(add-hook 'prog-mode-hook #'hs-minor-mode)
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
(prog1 "setup package.el"
  (eval-when-compile (require 'package))
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (package-initialize))

(prog1 "install and load use-package"
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (eval-when-compile  (require 'use-package)))

(prog1 "themes"
  (use-package doom-themes
    :ensure t
    :config
    (progn (load-theme 'doom-sourcerer)
           (doom-themes-org-config)))
  (use-package doom-modeline
    :ensure t
    :config (doom-modeline-mode 1))
  (use-package all-the-icons
    :ensure t
    :config (message "M-X all-the-icons-install-fonts to install the fonts.")))

(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config (exec-path-from-shell-initialize))

(use-package smartparens
  :ensure t
  :config (progn (use-package smartparens-config :config (smartparens-global-mode t))))

(use-package yasnippet :ensure t)

(use-package company
  :ensure t
  :config (progn
            (setq company-idle-delay 0)
            (setq company-minimum-prefix-length 1)
            (setq company-selection-wrap-around t)
            (delq 'company-files company-backends)
            (add-to-list 'company-backends 'company-files)
            (company-tng-configure-default))
  :hook (prog-mode . company-mode))

(prog1 "lsp"
  (use-package lsp-mode
    :ensure t
    :commands lsp
    :hook ((python-mode . lsp)
           (haskell-mode . lsp)
           (lsp-mode . lsp-ui-mode)
           (go-mode . lsp)))
  (use-package company-lsp :ensure t :commands company-lsp)
  (use-package lsp-haskell :ensure t)
  (use-package lsp-ui :ensure t :commands lsp-ui)
  (use-package go-mode :ensure t))

(prog1 "org"
  (use-package ox-latex-subfigure :ensure t)
  (use-package org
    :ensure t
    :requires (org-plus-contrib ox-latex-subfigure)
    :config (progn
              (org-babel-do-load-languages
               'org-babel-load-languages '((awk . t)
                                           (shell . t)
                                           (python . t)
                                           (emacs-lisp . t)))
              (use-package ox-latex :ensure t)
              (use-package ox-bibtex :ensure t)
              (setq org-latex-compiler "lualatex")
              (setq org-latex-with-hyperref nil))))

(prog1 "slime"
  (use-package slime-company :ensure t)
  (use-package slime
    :ensure t
    :requires slime-compeny
    :config (progn
              (setq inferior-lisp-program "sbcl")
              (setq slime-contribs '(slime-fancy slime-company)))))

(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)

(use-package ido-completing-read+
  :ensure t
  :config (ido-ubiquitous-mode 1))

(use-package amx
  :ensure t
  :config (progn
            (amx-mode 1)))

(use-package ido-vertical-mode
  :ensure t
  :config (progn
            (ido-vertical-mode 1)
            (setq ido-vertical-define-keys 'C-n-and-C-p-only)
            (setq ido-vertical-show-count t)))

(use-package magit :ensure t :defer 2)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
