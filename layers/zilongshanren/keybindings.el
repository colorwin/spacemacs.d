;;; keybindings.el --- zilongshanren Layer packages File for Spacemacs
;;
;; Copyright (c) 2015-2016 zilongshanren
;;
;; Author: zilongshanren <guanghui8827@gmail.com>
;; URL: https://github.com/zilongshanren/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; A complementary binding to the apropos-command (C-h a)
(define-key 'help-command "A" 'apropos)
(define-key 'help-command (kbd "C-f") 'find-function)
(define-key 'help-command (kbd "C-k") 'find-function-on-key)
(define-key 'help-command (kbd "C-v") 'find-variable)
(define-key 'help-command (kbd "C-l") 'find-library)
(define-key 'help-command (kbd "C-i") 'info-display-manual)

(global-set-key [(shift return)] 'zilongshanren/smart-open-line)
(global-set-key (kbd "s-/") 'hippie-expand)
(global-set-key (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c y") 'youdao-dictionary-search-at-point+)
(define-key global-map (kbd "<f9>") 'org-capture)
(define-key global-map (kbd "C-c t") 'org-capture)
(define-key global-map (kbd "<f8>") 'zilongshanren/show-current-buffer-major-mode)

(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c i e") 'spacemacs/auto-yasnippet-expand)
;; http://emacs.stackexchange.com/questions/220/how-to-bind-c-i-as-different-from-tab
;; (define-key input-decode-map [?\C-i] [C-i])
;; (define-key evil-normal-state-map (kbd "C-i") 'evil-jump-forward)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
(global-set-key [remap fill-paragraph] #'endless/fill-or-unfill)

;; (global-set-key (kbd "C-.") 'company-capf)

;; some easy functions for navigate functions
;;C-M-a beginning-of-defun
;;C-M-e end-of-defun
;;C-M-h mark-defun
(global-set-key (kbd "C-s-h") 'mark-defun)

(global-set-key (kbd "s-l") 'goto-line)
;; (global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "C-`") 'toggle-input-method)
(global-set-key (kbd "s-d") 'zilongshanren/my-mc-mark-next-like-this)
(global-set-key (kbd "M-a") 'zilongshanren/my-mc-mark-next-like-this)
(bind-key* "s-r" 'mc/reverse-regions)
(global-set-key (kbd "<f5>") 'zilongshanren/run-current-file)

;; "http://endlessparentheses.com/transposing-keybinds-in-emacs.html?source=rss"
;; (global-set-key "\C-t" #'transpose-lines)
;; (define-key ctl-x-map "\C-t" #'transpose-chars)

(when (spacemacs/system-is-mac)
 (spacemacs/set-leader-keys "o!" 'zilongshanren/iterm-shell-command))

(spacemacs|add-toggle toggle-shadowsocks-proxy-mode
  :status shadowsocks-proxy-mode
  :on (global-shadowsocks-proxy-mode)
  :off (global-shadowsocks-proxy-mode -1)
  :documentation "Toggle shadowsocks proxy mode."
  :evil-leader "ots")

(global-set-key (kbd "s-s") 'save-buffer)
;; (bind-key* "s-k" 'scroll-other-window-down)
;; (bind-key* "s-j"  'scroll-other-window)
(bind-key* "C-c /" 'company-files)
;; (bind-key* "s-r" 'zilongshanren/browser-refresh--chrome-applescript)
(bind-key* "s-;" 'zilongshanren/insert-semicolon-at-the-end-of-this-line)
(bind-key* "C-s-;" 'zilongshanren/delete-semicolon-at-the-end-of-this-line)
(bind-key* "s-," 'zilongshanren/insert-comma-at-the-end-of-this-line)
;; (bind-key* "C-s-," 'zilongshanren/delete-comma-at-the-end-of-this-line)
(bind-key* "C-c l" 'zilongshanren/insert-chrome-current-tab-url)
;; (bind-key* "M-s o" 'occur-dwim)
(bind-key* "C-=" 'er/expand-region)
(bind-key* "M--" 'zilongshanren/goto-match-paren)
(bind-key* "C-c k" 'which-key-show-top-level)
(bind-key* "s-y" 'aya-expand)
;; (bind-key* "C-l" 'recenter)


;; Utility functions
(defun bb/define-key (keymap &rest bindings)
  (declare (indent 1))
  (while bindings
    (define-key keymap (pop bindings) (pop bindings))))

(define-key evil-normal-state-map (kbd "-") nil)

(bb/define-key evil-normal-state-map
  "+" 'evil-numbers/inc-at-pt
  "-" 'evil-numbers/dec-at-pt
  "\\" 'evil-repeat-find-char-reverse
  (kbd "DEL") 'evil-repeat-find-char-reverse
  "[s" (lambda (n) (interactive "p") (dotimes (c n nil) (insert " ")))
  "]s" (lambda (n) (interactive "p")
         (forward-char) (dotimes (c n nil) (insert " ")) (backward-char (1+ n))))

(with-eval-after-load 'company
  (progn
    (bb/define-key company-active-map
      (kbd "C-w") 'evil-delete-backward-word)

    (bb/define-key company-active-map
      (kbd "s-w") 'company-show-location)))

(spacemacs/declare-prefix "ot" "Toggle")


(global-set-key (kbd "<f1>") 'zilongshanren/helm-hotspots)
(spacemacs/set-leader-keys "oo" 'zilongshanren/helm-hotspots)

(spacemacs/set-leader-keys "oc" 'my-auto-update-tags-when-save)
;; (spacemacs/set-leader-keys "op" 'zilongshanren/org-save-and-export)
(spacemacs/set-leader-keys "fR" 'zilongshanren/rename-file-and-buffer)

;;Must set key to nil to prevent error: Key sequence b m s starts with non-prefix key b m
(spacemacs/set-leader-keys "bm" nil)
(spacemacs/set-leader-keys "bD" 'spacemacs/kill-other-buffers)
(spacemacs/declare-prefix "bm" "Bookmark")
(spacemacs/set-leader-keys "bms" 'bookmark-set)
(spacemacs/set-leader-keys "bmr" 'bookmark-rename)
(spacemacs/set-leader-keys "bmd" 'bookmark-delete)
(spacemacs/set-leader-keys "bmj" 'counsel-bookmark)

(spacemacs/set-leader-keys "od" 'occur-dwim)
(spacemacs/set-leader-keys "ox" 'org-open-at-point)
(spacemacs/set-leader-keys "or" 'zilongshanren/browser-refresh--chrome-applescript)

(spacemacs/set-leader-keys "rh" 'helm-resume)
(spacemacs/set-leader-keys "sj" 'counsel-imenu)

;; ivy specific keybindings
(if (configuration-layer/layer-usedp 'ivy)
    (progn
      (spacemacs/set-leader-keys "ff" 'counsel-find-file)
      (spacemacs/set-leader-keys "fL" 'counsel-locate)
      (spacemacs/set-leader-keys "hi" 'counsel-info-lookup-symbol)
      (spacemacs/set-leader-keys "pb" 'projectile-switch-to-buffer)))

(spacemacs/set-leader-keys "en" 'flycheck-next-error)
(spacemacs/set-leader-keys "ep" 'flycheck-previous-error)
(spacemacs/set-leader-keys "o(" 'ielm)

(spacemacs/set-leader-keys "gL" 'magit-log-buffer-file)
(spacemacs/set-leader-keys "og" 'my-git-timemachine)

(spacemacs/set-leader-keys "sj" 'zilongshanren/counsel-imenu)
;; deal with BOM
(spacemacs/set-leader-keys "fl" 'find-file-literally-at-point)
(spacemacs/set-leader-keys "ri" 'ivy-resume)
(spacemacs/set-leader-keys "fh" 'ffap-hexl-mode)
(spacemacs/set-leader-keys "fd" 'projectile-find-file-dwim-other-window)
(spacemacs/set-leader-keys "nl" 'spacemacs/evil-search-clear-highlight)
(spacemacs/set-leader-keys "oll" 'zilongshanren/load-my-layout)
(spacemacs/set-leader-keys "ols" 'zilongshanren/save-my-layout)
(spacemacs/set-leader-keys "ob" 'popwin:display-last-buffer)
(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)
(spacemacs/set-leader-keys "bM" 'spacemacs/switch-to-messages-buffer)

(bind-key* "s-p" 'find-file-in-project)
(spacemacs/set-leader-keys "os" 'zilongshanren/search-in-fireball)

(spacemacs/set-leader-keys "pa" 'projectile-find-other-file)
(spacemacs/set-leader-keys "pA" 'projectile-find-other-file-other-window)
(spacemacs/set-leader-keys ":" 'counsel-M-x)

(when (spacemacs/system-is-mswindows)
  (global-set-key (kbd "s-=") 'spacemacs/scale-up-font)
  (global-set-key (kbd "s--") 'spacemacs/scale-down-font)
  (global-set-key (kbd "s-0") 'spacemacs/reset-font-size)
  (global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
  (global-set-key (kbd "s-v") 'yank)
  (global-set-key (kbd "s-c") 'evil-yank)
  (global-set-key (kbd "s-a") 'mark-whole-buffer)
  (global-set-key (kbd "s-x") 'kill-region)
  (global-set-key (kbd "s-w") 'delete-window)
  (global-set-key (kbd "s-W") 'delete-frame)
  (global-set-key (kbd "s-n") 'make-frame)
  (global-set-key (kbd "s-z") 'undo-tree-undo)
  (global-set-key (kbd "s-Z") 'undo-tree-redo))



;; colorwin
;; (spacemacs/set-leader-keys "pt" 'neotree-find-project-root)

;; (spacemacs/set-leader-keys "bR" 'revert-buffer)

;; (spacemacs/set-leader-keys "wx" 'spacemacs/delete-window)
;; (spacemacs/set-leader-keys "wd" 'spacemacs/ace-delete-window)
;; (spacemacs/set-leader-keys "wD" 'delete-other-windows)


;; (define-key evil-normal-state-map (kbd "M-o") 'evil-jump-forward)



;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; (spacemacs/set-leader-keys "ps" 'find-file-in-project)

;; (global-set-key (kbd "s-f") 'find-file-in-project)

;; (spacemacs/set-leader-keys "be" 'erase-buffer)

;; (spacemacs/set-leader-keys "be" 'erase-buffer)


;; (defun colorwin/swiper ()
;;   (interactive)
;;   (swiper (thing-at-point 'word))
;;   )

;; (spacemacs/set-leader-keys "sw" 'colorwin/swiper)

;; (defun prelude-search (query-url prompt)
;;   "Open the search url constructed with the QUERY-URL.
;; PROMPT sets the `read-string prompt."
;;   (browse-url
;;    (concat query-url
;; 	   (url-hexify-string
;; 	    (if mark-active
;; 		(buffer-substring (region-beginning) (region-end))
;; 	      (read-string prompt))))))

;; (defmacro prelude-install-search-engine (search-engine-name search-engine-url search-engine-prompt)                   ; #1
;;   "Given some information regarding a search engine, install the interactive command to search through them"
;;   `(defun ,(intern (format "prelude-%s" search-engine-name)) ()                                                       ; #2
;;        ,(format "Search %s with a query or region if any." search-engine-name)                                        ; #3
;;        (interactive)
;;        (prelude-search ,search-engine-url ,search-engine-prompt)))                                                    ; #4

;; (prelude-install-search-engine "google"     "http://www.google.com/search?q="              "Google: ")                ; #5
;; (prelude-install-search-engine "youtube"    "http://www.youtube.com/results?search_query=" "Search YouTube: ")
;; (prelude-install-search-engine "github"     "https://github.com/search?q="                 "Search GitHub: ")
;; (prelude-install-search-engine "duckduckgo" "https://duckduckgo.com/?t=lm&q="              "Search DuckDuckGo: ")



;; (spacemacs/declare-prefix "E" "engine")
;; (spacemacs/set-leader-keys "Eg" 'engine/search-google)
;; (spacemacs/set-leader-keys "EG" 'engine/search-github)
;; (spacemacs/set-leader-keys "Ew" 'engine/search-wikipedia)
;; (spacemacs/set-leader-keys "Es" 'engine/search-stack-overflow)
;; (spacemacs/set-leader-keys "Ey" 'youdao-dictionary-search)

;; (evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
;; (evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)
