;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;; AUTOLISP CODING STARTS HERE
(prompt "\nType \"edittest\" to run...")

(defun c:edittest(/ dcl_id)                                                               ;; define function dcl_id = privat variable
    (setq name nil)    
    (setq dcl_id (load_dialog "test/edit_test.dcl"))                                      ;; load dialog
    (if (not (new_dialog "edit_test" dcl_id))                                             ;; test for dialog
        (exit)                                                                            ;; exit if no dialog
    )                                                                                     ;; if

    (set_tile "name" "Enter Name Here")
    (mode_tile "name" 2)
    (action_tile "name" "(setq name $value)")
    (action_tile "age" "(setq age $value)")
    (action_tile "accept" "(val1)")

    (start_dialog)                                                                        ;; start dialog
    (unload_dialog dcl_id)                                                                ;; unload

    (alert (strcat "Your name is "
                name
                "\nand you are "
                age
                " years of age.")
    )
	(princ)
)                                                                                        ;; defun c:edittest
;; ---------------------------------------------------------------------------------------------------------

(defun val1()                                                                            ;; define function
    (if (= (get_tile "name") "Enter Name Here")
        (progn
            (set_tile "error" "You must enter a name!")
            (mode_tile "name" 2)
        )                                                                                ;; progn
        (val2)
    )                                                                                    ;; if
)                                                                                        ;; defun
;; ---------------------------------------------------------------------------------------------------------

(defun val2()                                                                            ;; define function
    (if (< (atoi (get_tile "age")) 1)
        (progn
            (set_tile "error" "Invalid Age - Please Try Again!")
            (mode_tile "age" 2)
        )                                                                                ;; progn
        (done_dialog)
    )                                                                                    ;; if
)                                                                                        ;; defun

(princ)
;; AUTOLISP CODING ENDS HERE
