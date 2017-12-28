;; This is the start of jcs-function.el file
;;------------------------------------------------------------------------------------------------------

;; jayces-mode.el             -*- Emacs-Lisp -*-

;; Mode for editing JayCeS code

;; Created:    <Tue June 18 13:51:49 EST 2017>
;; Time-stamp: <2017-07-18 00:23:39>
;; Author:     Jen-Chieh Shen <jcs090218@gmail.com>
;; Version:    0.1
;; Keywords:   JayCeS, languages, os, operating system

;; Copyright (C) 2017 Jen-Chieh Shen

;; jcs-function is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; jcs-function is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;; JayCeS mode.
;;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

(defvar jayces-mode-map nil "Kaymap for `jayces-mode'")
(progn
  (setq jayces-mode-map (make-sparse-keymap))

  ;; keymap define here.
  (define-key jayces-mode-map (kbd "RET") 'jcs-smart-context-line-break)
  (define-key jayces-mode-map (kbd "*") 'jcs-c-comment-pair)
  )

;; define hook
(defcustom jayces-mode-hook nil
  "*Hook to be run when `jayces-mode' is entered."
  :group 'jayces
  :type  'hook)

;; main JayCeS code mode.
(define-derived-mode jayces-mode ()
  "JayCeS mode"
  (interactive)

  ;; Abbrevation expansion
  (abbrev-mode 1)

  ;; enable the stuff you want for Lua here
  (electric-pair-mode 1)

    ;; highlight URL and clickable.
  (goto-address-mode 1)

  ;; comment block.
  (setq-local comment-start "/*")
  (setq-local comment-start-skip "/\\*+[ \t]*")
  (setq-local comment-end "*/")
  (setq-local comment-end-skip "[ \t]*\\*+/")

  ;; bind keymap
  (use-local-map jayces-mode-map)

  ;; NOTE(jenchieh): this will auto run.
  ;;(run-hooks 'jayces-mode-hook)
  )

(provide 'jayces-mode)

;;------------------------------------------------------------------------------------------------------
;; This is the end of jayces-mode.el file
