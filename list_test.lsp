;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;; AUTOLISP CODING STARTS HERE
(prompt "\nType \"listtest\" to run...")
    
(defun c:testlist()                                                                         ;; define function
    (setq DAYS '("Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday" "Sunday"))   ;; setq
    (setq dcl_id (load_dialog "test/list_test.dcl"))                                        ;; load dialog
            
    (if (not (new_dialog "list_test" dcl_id))
        (exit)
    )                                                                                       ;; if

    (start_list "selections")                                                               ;; start the list box
    (mapcar 'add_list DAYS)                                                                 ;; fill the list box
    (end_list)                                                                              ;; end list

    (action_tile
        "accept"                                                                            ;; if OK pressed
        (strcat                                                                             ;; string 'em together
            "(progn (setq SEL (atoi (get_tile \"selections\")))" 
            "(done_dialog) (setq userclick T))" 
        )                                                                                   ;; strcat
    )                                                                                       ;; action tile
    (action_tile
                                                                                            ;; if cancel button pressed
        "cancel"
        "(done_dialog) (setq userclick nil)"                                                ;; close dialog
    )                                                                                       ;; action_tile

    (start_dialog)                                                                          ;; start dialog
    (unload_dialog dcl_id)                                                                  ;; unload

    (if userclick                                                                           ;; check OK was selected
        (progn                                                                              ;; if it was do the following
            (setq SEL (nth SEL DAYS))                                                       ;; get the Day
            (alert (strcat "You Selected: " SEL))                                           ;; display the Day
        )                                                                                   ;; progn
    )                                                                                       ;; if userclick
    (princ)
)                                                                                           ;; defun
(princ)
;; AUTOLISP CODING ENDS HERE
