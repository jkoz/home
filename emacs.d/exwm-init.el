  (use-package exwm
    :config
    (setq exwm-workspace-number 5)
    ;; These keys should always pass through to Emacs
    (setq exwm-input-prefix-keys
          '(?\C-x
            ?\C-u
            ?\C-h
            ?\M-x
            ?\M-`
            ?\M-&
            ?\M-:
            ?\C-\M-j  ;; Buffer list
            ?\C-\ ))  ;; Ctrl+Space

  ;; Ctrl+Q will enable the next key to be sent directly
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

  ;; Set up global key bindings.  These always work, no matter the input state!
  ;; Keep in mind that changing this list after EXWM initializes has no effect.

    (setq exwm-input-global-keys
          `(
            ;; Reset to line-mode (C-c C-k switches to char-mode via exwm-input-release-keyboard)
            ([?\s-r] . exwm-reset)

            ;; Move between windows
            ([?\s-h] . windmove-left)
            ([?\s-l] . windmove-right)
            ([?\s-k] . windmove-up)
            ([?\s-j] . windmove-down)

            ;; Launch applications via shell command
            ([?\s-&] . (lambda (command)
                         (interactive (list (read-shell-command "$ ")))
                         (start-process-shell-command command nil command)))

            ;; Switch workspace
            ([?\s-w] . exwm-workspace-switch)

            ;; 's-N': Switch to certain workspace with Super (Win) plus a number key (0 - 9)
            ,@(mapcar (lambda (i)
                        `(,(kbd (format "s-%d" i)) .
                          (lambda ()
                            (interactive)
                            (exwm-workspace-switch-create ,i))))
                      (number-sequence 0 9))))

    (exwm-enable))
  (require 'exwm-systemtray)
  (exwm-systemtray-enable)

  ;;;; EXWM line mode bindings.
  ;; C-x C-x to send C-x, C-c C-c to send C-c.
  (define-key exwm-mode-map (kbd "C-x C-x")
    (lambda () (interactive) (exwm-input--fake-key ?\C-x)))
  (define-key exwm-mode-map (kbd "C-v C-v")
    (lambda () (interactive) (exwm-input--fake-key ?\C-v)))
  (define-key exwm-mode-map (kbd "C-c C-c")
    (lambda () (interactive) (exwm-input--fake-key ?\C-c)))
