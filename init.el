(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("88a3c267ce2132defd46f2a4761925983dcbc35b1c3cfff1dded164ce169fed4" "6231254e74298a1cf8a5fee7ca64352943de4b495e615c449e9bb27e2ccae709" default)))
 '(package-selected-packages
   (quote
    (haskell-mode magit ido-vertical-mode amx ido-completing-read+ slime-company go-mode lsp-ui lsp-haskell company-lsp lsp-mode yasnippet smartparens exec-path-from-shell doom-modeline org-plus-contrib use-package company))))

;; ツールバー、スクロールバーとかを削除
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; マウスホイールの設定
(mouse-wheel-mode t)
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; 2行ずつ動く
(setq mouse-wheel-progressive-speed nil) ;; 加速しない
(setq mouse-wheel-follow-mouse t) ;; いい感じにする

;; クリップボードの設定
(setq x-select-enable-clipboard t)
(setq select-enable-clipboard t)
(setq select-enable-primary nil)

;; フォントの設定
(if (member "M+ 1mn" (font-family-list))
    (progn (create-fontset-from-ascii-font "M+ 1mn-16" nil "mplus1mn")
           (set-fontset-font "fontset-mplus1mn" 'unicode
                             (font-spec :family "M+ 1mn" :size 16)
                             nil 'prepend)
           (add-to-list 'default-frame-alist '(font . "fontset-mplus1mn"))))

;; カーソルの見た目
(add-to-list 'default-frame-alist '(cursor-type . bar))

;; バックアップファイルの削除とか
(setq make-backup-files nil)
(setq delete-auto-save-files t)

;; 対応する括弧をハイライトする
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)

;; コードの折りたたみを有効化
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; 行番号を表示
(setq display-line-numbers t)
(global-display-line-numbers-mode)

;; ロケール周り
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; インデント設定
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; 選択範囲のハイライト
(transient-mark-mode t)

;; C-kで行削除
(setq kill-whole-line 1)

;; 起動時に表示されるものを消す
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; 音を鳴らさない
(setq ring-bell-function 'ignore)

;; パッケージの設定
(prog1 "setup package.el"
  (eval-when-compile (require 'package))
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (package-initialize))

(prog1 "use-packageをインストールして読み込む"
  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
  (eval-when-compile  (require 'use-package)))

(prog1 "カラーテーマ"
  (use-package doom-themes
    :ensure t
    :config
    (progn (load-theme 'doom-laserwave)
           (doom-themes-org-config)))
  (use-package doom-modeline
    :ensure t
    :config (doom-modeline-mode 1))
  (use-package all-the-icons
    :ensure t
    :config (message "M-X all-the-icons-install-fonts to install the fonts.")))

;; PATHをbashから読み込む
(use-package exec-path-from-shell
  :ensure t
  :if (memq window-system '(mac ns x))
  :config (exec-path-from-shell-initialize))

;; 括弧をいい感じに操作する
(use-package smartparens
         :ensure t
         :config
         (require 'smartparens-config)
         (sp-use-smartparens-bindings)
         :hook (prog-mode . company-mode))

;; スニペット
(use-package yasnippet :ensure t)

;; 補完の表示
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (delq 'company-files company-backends)
  (add-to-list 'company-backends 'company-files)
  (company-tng-configure-default)
  :hook (prog-mode . company-mode))

(prog1 "org-mode"
  (use-package org
    :ensure t
    :config
    (org-babel-do-load-languages
     'org-babel-load-languages '((awk . t)
                                 (shell . t)
                                 (python . t)
                                 (emacs-lisp . t))))
  (use-package org-plus-contrib
    :ensure t
    :no-require t
    :after (org)
    :config
    (require 'ox-latex)
    (require 'ox-bibtex)
    :custom
    ;; (org-latex-compiler "latexmk")
    (org-latex-pdf-process '("latexmk"))
    (org-latex-hyperref-template "\\hypersetup{\n pdfauthor={%a},\n pdftitle={%t}}\n")
    (org-latex-classes
     '(("article" "\\documentclass[11pt,a4paper]{ltjsarticle}"
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
        ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))
    (org-latex-default-packages-alist
     '(("AUTO" "inputenc" t
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
       ("" "hyperref" nil nil)))
    (org-latex-packages-alist
     '(("" "booktabs" nil)
       ("" "siunitx" nil)
       ("" "ascmac" nil)
       ("" "mhchem" nil)
       "\\sisetup{math-micro=\\text{µ},text-micro=µ}"))))

(use-package slime
  :ensure slime-company
  :config
  (setq inferior-lisp-program "sbcl")
  (slime-setup '(slime-fancy slime-company slime-asdf)))

(prog1 "M-xの強化"
  (ido-mode 1)
  (ido-everywhere 1)
  (setq ido-enable-flex-matching t)
  
  (use-package ido-completing-read+
  :ensure t
  :config (ido-ubiquitous-mode 1))
  
  (use-package amx
    :ensure t
    :config
    (amx-mode 1))
  (use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  (setq ido-vertical-show-count t)))


;; Git対応
(use-package magit :ensure t)

;; Haskell
(use-package haskell-mode :ensure t)
