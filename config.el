(setq user-full-name "Kemal Yucetin"
      user-mail-address "")

(setq doom-theme 'doom-one)

(setq org-directory "~/org/")

(setq display-line-numbers-type t)
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)

(setq doom-font (font-spec :family "Hack Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "Hack Nerd Font" :size 16)
      doom-big-font (font-spec :family "Hack Nerd Font" :size 22))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(after! org
  (setq org-hide-emphasis-markers t))

(add-hook 'window-setup-hook #'toggle-frame-maximized)
(setq evil-vsplit-window-right t
      evil-split-window-below t)
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))
(global-visual-line-mode)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

(setq frame-title-format
      '(""
        (:eval
         (if (s-contains-p org-roam-directory (or buffer-file-name ""))
             (replace-regexp-in-string
              ".*/[0-9]*-?" "☰ "
              (subst-char-in-string ?_ ?  buffer-file-name))
           "%b"))
        (:eval
         (let ((project-name (projectile-project-name)))
           (unless (string= "-" project-name)
             (format (if (buffer-modified-p)  " ◉ %s" "  ●  %s") project-name))))))

(map! :leader
      :desc "Copy to register"
      "r c" #'copy-to-register
      :desc "List register"
      "r l" #'list-registers)

(after! elfeed
  (setq elfeed-search-filter "@3-years-ago +unread"))

(defun load-light-theme ()
  (interactive)
  (load-theme 'doom-one-light t)
  (doom/reload-theme))

(defun load-dark-theme ()
  (interactive)
  (load-theme 'doom-one t)
  (doom/reload-theme))

(setq projectile-project-search-path '("~/whitehat/" "~/code")  )

;; (use-package wakatime-mode :ensure t)
;; (global-wakatime-mode)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
