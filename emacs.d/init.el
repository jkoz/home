(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   '("aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "f2c35f8562f6a1e5b3f4c543d5ff8f24100fae1da29aeb1864bbc17758f52b70" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" default))
 '(org-agenda-files '("~/Dropbox/orgfiles/gcal.org"))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/orgfiles")
 '(org-hide-leading-stars t)
 '(org-startup-folded 'overview)
 '(org-startup-indented t)
 '(package-selected-packages
   '(winum treemacs-projectile treemacs-evil cmake-mode mu4e-views mu4e-conversation mu4e-alert mu4e-maildirs-extension evil-search-highlight-persist magit evil-magit mu4e evil-mu4e powerline-evil evil-nerd-commenter resize-window powerline evil-collection evil-leader key-chord evil helm-projectile projectile dap-cpptools company-capf dap-java lsp-java lsp-treemacs helm-lsp lsp-ui hydra company-lsp better-shell org-gcal org-ac web-mode iedit helm expand-region aggressive-indent aggresive-indent hungry-delete beacon undo-tree elpy yasnippet jedi flycheck ox-reveal gruvbox-theme solarized-theme zenburn-theme color-theme auto-complete counsel swiper ace-window org-bullets which-key use-package try))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0)))))



(org-babel-load-file (expand-file-name "~/.emacs.d/_init.org"))
