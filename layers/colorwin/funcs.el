(defun colorwin/mark-previous-like-this ()
  (interactive)
  (if (region-active-p)
      (mc/mark-previous-like-this 1)
    (er/expand-region 1)))

(defun colorwin/swiper ()
  (interactive)
  (swiper (thing-at-point 'word))
  )
(defun colorwin/youdao ()
  (youdao-dictionary-search-at-point+)
  (youdao-dictionary-play-voice-at-point)
  )


(defun prelude-search (query-url prompt)
  "Open the search url constructed with the QUERY-URL.
PROMPT sets the `read-string prompt."
  (browse-url
   (concat query-url
	   (url-hexify-string
	    (if mark-active
		(buffer-substring (region-beginning) (region-end))
	      (read-string prompt))))))

(defmacro prelude-install-search-engine (search-engine-name search-engine-url search-engine-prompt)                   ; #1
  "Given some information regarding a search engine, install the interactive command to search through them"
  `(defun ,(intern (format "prelude-%s" search-engine-name)) ()                                                       ; #2
       ,(format "Search %s with a query or region if any." search-engine-name)                                        ; #3
       (interactive)
       (prelude-search ,search-engine-url ,search-engine-prompt)))                                                    ; #4

(prelude-install-search-engine "google"     "http://www.google.com/search?q="              "Google: ")                ; #5
(prelude-install-search-engine "youtube"    "http://www.youtube.com/results?search_query=" "Search YouTube: ")
(prelude-install-search-engine "github"     "https://github.com/search?q="                 "Search GitHub: ")
(prelude-install-search-engine "duckduckgo" "https://duckduckgo.com/?t=lm&q="              "Search DuckDuckGo: ")
