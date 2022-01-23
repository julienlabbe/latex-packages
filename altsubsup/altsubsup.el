;;; altsubsup.el --- AUCTeX style for `altsubsup.sty'

;; Copyright (C) 2022 by Julien Labbé <Julien.Labbe@univ-grenoble-alpes.fr>

;; This file may be distributed and/or modified under the conditions of the LaTeX
;; Project Public License, either version 1.3 of this license or (at your option)
;; any later version. The latest version of this license is in:
;;      http://www.latex-project.org/lppl.txt
;; and version 1.3 or later is part of all distributions of LaTeX version
;; 2005/12/01 or later.

;;; Commentary:

;; This file adds support for `altsubsup.sty'.

;;; Code:

;; Silence the compiler:

(TeX-add-style-hook
 "altsubsup"
 (lambda ()

   ;; New symbols
   (TeX-add-symbols
    "SetAltSubscriptCommand"
    "SetAltSuperscriptCommand"
    "SetAltSubSupCommands")

   ;; Fontification
   (when (and (featurep 'font-latex)
	      (eq TeX-install-font-lock 'font-latex-setup))
     (add-hook 'TeX-update-style-hook
             (lambda ()
               (font-lock-add-keywords
                nil
                (list
                 '("\\^\\(\\[[^]]*\\]\\)" (1 'font-latex-superscript-face))
                 '("_\\(\\[[^]]*\\]\\)"   (1 'font-latex-subscript-face))))))))

LaTeX-dialect)

;;; altsubsup.el ends here
