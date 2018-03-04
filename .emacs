(setq inhibit-startup-message t)

(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
  )
)

;(global-set-key (kbd "<C-kp-divide>") 'comment-or-uncomment-line-or-region)
(global-set-key (kbd "C-/") 'comment-or-uncomment-line-or-region)

(menu-bar-mode -1)
(tool-bar-mode -1)

;;Font size
(set-face-attribute 'default nil :height 120)

;;IDO Mode
(require 'ido)
(ido-mode t)

;;CC Mode conf
(setq c-default-style "linux" c-basic-offset 4
      tab-width 4
      indent-tabs-mode t)
            
(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
                                        comment-end   "")))
;;Funcionalidad de paquetes
(require 'package)
;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.com/packages/"))

;;activacion
(package-initialize)
;(load-theme 'material t)
(require 'better-defaults)
(load-theme 'rebecca t)
(elpy-enable)

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this-word)    ;agrego word ver con symbol
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this-word);agrego word ver con symbol
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-x <up>") 'shrink-window)
(global-set-key (kbd "C-x <down>") 'enlarge-window)
(global-set-key (kbd "C-x <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-x <right>") 'enlarge-window-horizontally)
