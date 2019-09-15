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


;; フォント
;;(when (member "M+ 1mn" (font-family-list))
;;  (add-to-list 'default-frame-alist '(font . "Ubuntu Mono-12")))
;;(create-fontset-from-ascii-font "M+ 1mn:pixelsize=16:weight=normal:slant=normal:width=normal:spacing=m" nil "mplus1mn")
;;(set-fontset-font "fontset-mplus1mn" 'unicode
;;                  (font-spec :family "M+ 1mn" :spacing 'm :size 16)
;;                  nil 'prepend)
;;(add-to-list 'default-frame-alist '(font . "fontset-mplus1mn"))

(create-fontset-from-ascii-font "CamingoCode-12" nil "camingocode")
(set-fontset-font "fontset-camingocode"
                  'unicode
                  "Source Han Sans JP-12"
                  nil
                  'append)
(add-to-list 'default-frame-alist '(font . "fontset-camingocode"))


;; カーソル
(add-to-list 'default-frame-alist '(cursor-type . bar))
