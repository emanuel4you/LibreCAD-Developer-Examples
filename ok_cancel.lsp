;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;; AUTOLISP CODING STARTS HERE
(prompt "\nType \"okcancel\" to run...")
    
(defun c:okcancel ()                                    ;; define function
    (setq dcl_id (load_dialog "test/ok_cancel.dcl"))     ;; load dialog
    (if (not (new_dialog "ok_cancel_dlg" dcl_id)              ;; test for dialog
        )                                                ;; not
        (exit)                                           ;; exit if no dialog
    )                                                    ;; if
    (action_tile
        "cancel"                                         ;; if cancel button pressed
        "(done_dialog) (setq userclick nil)"             ;; close dialog, set flag
    )                                                    ;; action_tile
    (action_tile
        "accept"                                         ;; if OK pressed
        "(done_dialog)(setq userclick T))"               ;; close dialog, set flag
    )                                                    ;; action tile
    (start_dialog)                                       ;; start dialog
    (unload_dialog dcl_id)                               ;; unload
    (princ)
)                                                        ;; defun c:okcancel
(princ)
;; AUTOLISP CODING ENDS HERE
