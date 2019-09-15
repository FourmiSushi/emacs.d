;; よくわからんファイルを作るな
(setq make-backup-files nil)
(setq delete-auto-save-files t)
;; 括弧の対応きつくね？
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
;; 行番号
(setq display-line-numbers t)
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
(load-theme 'gruvbox-dark-soft t)
;; powerline
(require 'powerline)
(set-face-attribute 'powerline-active1 nil
                    :foreground "LavenderBlush1"
                    :background "HotPink3"
                    :bold t
                    :box nil
                    :inherit 'mode-line)
(set-face-attribute 'powerline-active2 nil
                    :bold t
                    :box nil
                    :inherit 'mode-line)
(set-face-attribute 'powerline-inactive1 nil
                    :foreground "LavenderBlush2"
                    :background "HotPink3"
                    :bold t
                    :box nil
                    :inherit 'mode-line)
(set-face-attribute 'powerline-inactive2 nil
                    :bold t
                    :box nil
                    :inherit 'mode-line)
(powerline-default-theme)


;; 補完
(require 'company)
(global-company-mode t)
(setq company-idle-delay 0)
(setq cfompany-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
(delq 'company-files company-backends)
(add-to-list 'company-backends 'company-files)
(company-tng-configure-default)

;; lsp
(require 'eglot)
(add-hook 'python-mode-hook 'eglot-ensure)

