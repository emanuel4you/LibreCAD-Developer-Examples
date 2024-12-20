;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;; AUTOLISP CODING STARTS HERE
(prompt "\nType \"radiorowtest\" to run...")
        
(defun c:radiorowtest()                                         ;; define function
    (setq hole "Site")                                          ;; store default hole type
    (setq dcl_id (load_dialog "test/radio_row_test.dcl"))       ;; load dialog
    (if (not (new_dialog "radio_row_test" dcl_id)               ;; test for dialog
        )                                                       ;; not
        (exit)                                                  ;; exit if no dialog
    )                                                           ;; if
    (action_tile "rb1" "(setq hole \"Site\")")                  ;; store hole type
    (action_tile "rb2" "(setq hole \"Shop\")")                  ;; store hole type
    (action_tile "rb3" "(setq hole \"Hidden\")")                ;; store hole type
    (action_tile "rb4" "(setq hole \"Countersunk\")")           ;; store hole type
    (action_tile
        "accept"                                                ;; if OK pressed
        "(done_dialog) (setq userclick T)"                      ;; close dialog
    )                                                           ;; action tile
    (action_tile
        "cancel"                                                ;; if cancel button pressed
        "(done_dialog) (setq userclick nil)"                    ;; close dialog
    )                                                           ;; action_tile
    (start_dialog)                                              ;; start dialog
    (unload_dialog dcl_id)                                      ;; unload
    (if userclick                                               ;; check OK was pressed
        (alert (strcat "You Selected: " hole))                  ;; display the Hole Type
    )                                                           ;; if userclick
    (princ)
)                                                               ;; defun c:radiorowtest
;; AUTOLISP CODING ENDS HERE
