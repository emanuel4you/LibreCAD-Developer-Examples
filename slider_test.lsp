;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;; AUTOLISP CODING STARTS HERE
(prompt "\nType \"slidertest\" to run...")

(defun c:slidertest()                                                   ;; define function
    (setq len 50.0)                                                     ;; preset slot length
    (setq dcl_id (load_dialog "test/slider_test.dcl"))                  ;; load dialog
    (if (not (new_dialog "slider_test" dcl_id)                          ;; test for dialog
        )                                                               ;; not
        (exit)                                                          ;; exit if no dialog
    )                                                                   ;; if
    (set_tile "eb1" "50")                                               ;; put data into edit box
    (mode_tile "eb1" 2)                                                 ;; switch focus to edit box
    (action_tile "myslider" "(slider_action $value $reason)")           ;; if user moves slider, pass arguments to slider_action
    (action_tile "eb1" "(ebox_action $value $reason)")                  ;; if user enters slot length, pass arguments to ebox_action

    (defun slider_action (val why)                                      ;; define function
        (if (or (= why 2) (= why 1))                                    ;; check values
            (set_tile "eb1" val)))                                      ;; update edit box

    (defun ebox_action (val why)                                        ;; define function
        (if (or (= why 2) (= why 1))                                    ;; check values
            (set_tile "myslider" val)))                                 ;; update slider

    (action_tile                                                        ;; if OK pressed ;; string 'em together ;get slot length  ;close dialog, set flag
        "accept"
        (strcat "(progn (setq len (get_tile \"eb1\"))"
                "(done_dialog)(setq userclick T))"
        )                                                               ;; strcat
    )                                                                   ;; action tile

    (action_tile                                                        ;; if cancel button pressed close dialog
        "cancel"
        "(done_dialog) (setq userclick nil)"
    )                                                                   ;; action_tile

    (start_dialog)                                                      ;; start dialog
    (unload_dialog dcl_id)                                              ;; unload

    (if userclick                                                       ;; check OK was selected
        (alert (strcat "You Selected: " len))                           ;; display the selected length.
    )                                                                   ;; if userclick
    (princ)
)                                                                       ;; defun c:slidertest
(princ)
;; AUTOLISP CODING ENDS HERE
