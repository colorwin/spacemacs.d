
(spacemacs/set-leader-keys "pt" 'neotree-find-project-root)

;; buffer
(spacemacs/set-leader-keys "bR" 'revert-buffer)
(spacemacs/set-leader-keys "be" 'erase-buffer)
(spacemacs/set-leader-keys "be" 'erase-buffer)
(spacemacs/set-leader-keys "bl" 'popwin:popup-last-buffer)
(spacemacs/set-leader-keys "sw" 'colorwin/swiper)

;; window
(spacemacs/set-leader-keys "wx" 'spacemacs/delete-window)
(spacemacs/set-leader-keys "wd" 'spacemacs/ace-delete-window)
(spacemacs/set-leader-keys "wD" 'delete-other-windows)

;; multi cursor
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'zilongshanren/my-mc-mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "s-D") 'colorwin/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(spacemacs/set-leader-keys "ps" 'find-file-in-project)

;; search engine
(spacemacs/declare-prefix "E" "engine")
(spacemacs/set-leader-keys "Eg" 'engine/search-google)
;; (spacemacs/set-leader-keys "EG" 'engine/search-github)
(spacemacs/set-leader-keys "Ew" 'engine/search-wikipedia)
(spacemacs/set-leader-keys "Es" 'engine/search-stack-overflow)
(spacemacs/set-leader-keys "Ey" 'youdao-dictionary-search)
(spacemacs/set-leader-keys "EY" 'colorwin/youdao)

;; reset default evil sourround
(evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
(evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)


;; else

(define-key evil-normal-state-map (kbd "M-o") 'evil-jump-forward)
(global-set-key (kbd "s-f") 'find-file-in-project)


(define-key evil-visual-state-map (kbd "C-R") 'zilongshanren/evil-quick-replace)

 ;; atom like key
;; (global-set-key (kbd "C-s" ) 'save-buffer)
(define-key key-translation-map (kbd "C-/") (kbd "M-m c l"))
(define-key key-translation-map (kbd "C-z") (kbd "C-/"))
;; (define-key key-translation-map (kbd "C-p") (kbd "SPC p f"))
;; (define-key key-translation-map (kbd "C-S-p") (kbd "SPC SPC"))
;; (define-key key-translation-map (kbd "C-,") (kbd "SPC SPC"))
;; (define-key key-translation-map (kbd "C-.") (kbd "SPC h d k"))



(global-set-key (kbd "s-W" ) 'web-mode)
(global-set-key (kbd "s-J" ) 'js2-mode)
(global-set-key (kbd "s-C" ) 'css-mode)
(global-set-key (kbd "s-E" ) 'emacs-lisp-mode)
(global-set-key (kbd "s-R" ) 'react-mode)

;; evil key translation
;; (evil-define-key 'normal key-translation-map (kbd ";") (kbd "l"))


(spacemacs/set-leader-keys "gc" 'magit-file-checkout)
