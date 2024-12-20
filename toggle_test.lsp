;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;; AUTOLISP CODING STARTS HERE
(prompt "\nType \"toggletest\" to run...")
    
(defun c:toggletest()                                    ;; define function
    (setq dcl_id (load_dialog "test/toggle_test.dcl"))   ;; load dialog
    (if (not (new_dialog "toggle_test" dcl_id)           ;; test for dialog
        )                                                ;; not
        (exit)                                           ;; exit if no dialog
    )                                                    ;; if

    (set_tile "select" "0")                              ;; turn togge on
    (action_tile "select" "(setq job $value)")           ;; add action to toggle: save its value to 'job'
    (action_tile
        "cancel"                                         ;; if cancel button pressed
        "(done_dialog) (setq userclick nil)"             ;; close dialog, set flag
        )                                                ;; action_tile
    (action_tile
        "accept"                                         ;; if Ok pressed
        "(done_dialog)(setq userclick T))"               ;; close dialog, set flag
    )                                                    ;; action tile
    
    (start_dialog)                                       ;; start dialog
    (unload_dialog dcl_id)                               ;; unload
    
    (if userclick
        (progn                                           ;; if Ok and disabled selected
            (setq job (atoi job))
            (if (= job 1)                                ;; if tuned off
                (alert "thake you!\n:-)")                ;; inform the user
            )                                            ;; if
        )                                                ;; progn
    )                                                    ;; if
    (princ)
)                                                        ;; defun c:toggletest
(princ)
;; AUTOLISP CODING ENDS HERE
