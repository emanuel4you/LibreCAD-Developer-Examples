;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;; AUTOLISP CODING STARTS HERE
(prompt "\nType \"registertest\" to run...")
        
(defun c:registertest()                                             ;; define function
    (setq userclick nil)
    (setq dcl_id (load_dialog "test/register_test.dcl"))            ;; load dialog
    (if (not (new_dialog "register_test" dcl_id)                    ;; test for dialog
        )                                                           ;; not
        (exit)                                                      ;; exit if no dialog
    )                                                               ;; if
    (action_tile
        "accept"                                                    ;; if OK pressed
        "(done_dialog) (setq userclick T)"                          ;; close dialog
    )                                                               ;; action tile
    (action_tile
        "cancel"                                                    ;; if cancel button pressed
        "(done_dialog) (setq userclick nil)"                        ;; close dialog
    )                                                               ;; action_tile
    (action_tile
        "help"                                                      ;; if help button pressed
        "(alert \"LibreCAD will help You! :-)\")"                   ;; inform user
    )                                                               ;; action_tile
        (action_tile
        "info"                                                      ;; if cancel button pressed
        "(alert \"LibreCAD will inform You! :-)\")"                 ;; inform user
    )                                                               ;; action_tile
    (set_tile
        "error"                                                     ;; set errtile
        "Hallo I'm the errtile :-)"
    )
    (start_dialog)                                                  ;; start dialog
    (unload_dialog dcl_id)                                          ;; unload
    (if userclick                                                   ;; check OK was pressed
        (alert "ok pressed")                                        ;; display the Hole Type
    )                                                               ;; if userclick
    (princ)
)                                                                   ;; defun
;; AUTOLISP CODING ENDS HERE
