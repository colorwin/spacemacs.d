
(spacemacs/set-leader-keys "pt" 'neotree-find-project-root)

;; buffer
(spacemacs/set-leader-keys "bR" 'revert-buffer)
(spacemacs/set-leader-keys "be" 'erase-buffer)
(spacemacs/set-leader-keys "be" 'erase-buffer)

;; window
(spacemacs/set-leader-keys "wx" 'spacemacs/delete-window)
(spacemacs/set-leader-keys "wd" 'spacemacs/ace-delete-window)
(spacemacs/set-leader-keys "wD" 'delete-other-windows)

;; multi cursor
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(spacemacs/set-leader-keys "ps" 'find-file-in-project)

;; search engine
(spacemacs/declare-prefix "E" "engine")
(spacemacs/set-leader-keys "Eg" 'engine/search-google)
(spacemacs/set-leader-keys "EG" 'engine/search-github)
(spacemacs/set-leader-keys "Ew" 'engine/search-wikipedia)
(spacemacs/set-leader-keys "Es" 'engine/search-stack-overflow)
(spacemacs/set-leader-keys "Ey" 'youdao-dictionary-search)

;; reset default evil sourround
(evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
(evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)


;; else

(define-key evil-normal-state-map (kbd "M-o") 'evil-jump-forward)
(global-set-key (kbd "s-f") 'find-file-in-project)


(spacemacs/set-leader-keys "sw" 'colorwin/swiper)
(spacemacs/set-leader-keys "oy" 'colorwin/youdao)
