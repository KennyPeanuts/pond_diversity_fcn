;; CUA mode activation
(cua-mode t)

;; set ps-print-buffer font size
(setq ps-font-size 12)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("/media/working/my_agenda.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Open org-agenda-list
;;(add hook 'after-init-hook 'org-agenda-list)

;; put backup and autosave files in .emacs.d/backups (or /autosave)
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

(autoload 'markdown-mode "markdown-mode.el"
        "Major mode for editing Markdown files" t)
     (setq auto-mode-alist
        (cons '("\\.text" . markdown-mode) auto-mode-alist))