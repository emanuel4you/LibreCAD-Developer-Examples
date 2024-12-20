;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;; AUTOLISP CODING STARTS HERE
(prompt "\nType \"testdlg1\" to run...")

(defun c:testdlg1 ()
    (setq dcl_id (load_dialog "test/test1.dcl"))
    (if (not(new_dialog "test_dcl1" dcl_id)) (exit))
    (action_tile "accept" "(done_dialog) (princ)" )         ;; action_tile
    (start_dialog)
    (unload_dialog dcl_id)
    (princ)
)                                                           ;; defun

(princ)
;; AUTOLISP CODING ENDS HERE
