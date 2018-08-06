(setq inhibit-startup-message t)

(defun comment-or-uncomment-line-or-region ()
  "Comments or uncomments the current line or region."
  (interactive)
  (if (region-active-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))
  )
)

(global-set-key (kbd "C-/") 'comment-or-uncomment-line-or-region)

;;mover al principio de lineo o indentation
(defun beginning-of-line-or-indentation ()
  "move to beginning of line, or indentation"
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

(eval-after-load "cc-mode" 
     '(define-key c-mode-base-map (kbd "C-a") 'beginning-of-line-or-indentation))

(menu-bar-mode -1)
(tool-bar-mode -1)
;(scroll-bar-mode -1)

;;Font size en Linux este
;;(add-to-list 'default-frame-alist
;;             '(font . "Nimbus Mono L"))

;;Font en linux i3wm
(cond
 ((string-equal system-name "laptop")
  (set-face-attribute 'default nil :height 135)
  (add-to-list 'default-frame-alist
               '(font . "Nimbus Mono L"))
  (require 'xref)
  (set-frame-parameter (selected-frame) 'alpha '(85 . 65)))
 ((string-equal system-name "MARIANO-PC")
  (set-face-attribute 'default nil :height 120)
  (set-frame-parameter (selected-frame) 'alpha '(95 . 65))))


;;Font en linux xfce
;;(set-face-attribute 'default nil :height 130)
;;Fint size en Windows este
;;(set-face-attribute 'default nil :height 120)

;;que aparezca en numero de columna
(column-number-mode)
;;que ilumine la linea de edicion
;; (global-hl-line-mode 1)
;;que coloque el numero de linea en el lateral
;; (linum-mode 1)

;;para que lea la lista de aliases cuando ejecuto comandos desde minibuffer M-!
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

;;que pueda recuperar el formato de los buffers anteriores C-c <left> C-c <right>
(winner-mode t)

;;TRAMP Mode, acceso remoto a archivos
;;   C-x C-f /pi@192.168.1.34: RET
(setq tramp-default-method "ssh")


;;IDO Mode
(require 'ido)
(ido-mode t)

;;CC Mode conf
(setq c-default-style "linux" c-basic-offset 4
      tab-width 4
      indent-tabs-mode t)

(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
                                        comment-end   "")))
;;end CC Mode Conf

;;imenu conf
;; (defun my-merge-imenu ()
;;   (interactive)
;;   (let ((mode-imenu (imenu-default-create-index-function))
;;         (custom-imenu (imenu--generic-function imenu-generic-expression)))
;;     (append mode-imenu custom-imenu)))

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (add-to-list
;;              'imenu-generic-expression
;;              '("Sections" "^#### \\[ \\(.*\\) \\]$" 1))
;;             (imenu-add-to-menubar "Position")
;;             (setq imenu-create-index-function 'my-merge-imenu)))
;;end imenu conf


;;Funcionalidad de paquetes
(require 'package)
;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.com/packages/"))

;;mover tamanio de ventanas de buffer
(global-set-key (kbd "C-x <up>") 'shrink-window)
(global-set-key (kbd "C-x <down>") 'enlarge-window)
(global-set-key (kbd "C-x <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-x <right>") 'enlarge-window-horizontally)

;;dired configuration
(setq dired-listing-switches "-aBhl  --group-directories-first")

;;para org mode close TODOs with timestamp
(setq org-log-done 'time)
;;(setq org-log-done 'note)

;;activacion de paquetes
(package-initialize)
(require 'better-defaults)
(load-theme 'rebecca t)
;;(load-theme 'material t)
;;(load-theme 'deeper-blue)
;;(load-theme 'tango-dark)
;;(elpy-enable)

(require 'multiple-cursors)
(global-set-key (kbd "C-}") 'mc/mark-next-like-this)    ;agrego word ver con symbolpintar letra o palabra antes de activar
;(global-set-key (kbd "C-<") 'mc/mark-previous-like-this-word);agrego word ver con symbol
;(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;ace-jump-mode keys
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;;auto-complete
(ac-config-default)
(setq ac-auto-start 3)    ;espero 3 caracteres antes de autocompletar
(define-key ac-completing-map "\t" 'ac-complete)    ;completo con TAB
(define-key ac-completing-map "\r" nil)    ;RET no autocompleta
(setq ac-use-menu-map t)    ;lo que viene son configuraciones del menu de autocompletar
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)


;;switch windows
(global-set-key (kbd "C-x o") 'switch-window)

;;alpha view
;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;;(set-frame-parameter (selected-frame) 'alpha <both>)
;; (set-frame-parameter (selected-frame) 'alpha '(85 . 65))
;;(add-to-list 'default-frame-alist '(alpha . (95 . 50)))

(require 'sublimity)  ;;M-x sublimity-mode
;;(require 'sublimity-scroll)
(require 'sublimity-map) ;; experimental
(setq sublimity-map-size 20)
(setq sublimity-map-fraction 0.3)
(setq sublimity-map-text-scale -7)
(sublimity-map-set-delay 5)
;;(require 'sublimity-attractive)

;;para emacs 25 o mas
;; (require 'xref)
;;(add-to-list 'xref-backend-function 'gxref-xref-backend)
