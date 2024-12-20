;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;; LISP CODING STARTS HERE
(prompt "\nType \"testpoplist\" to run...")
    
(defun c:testpoplist()                                                                      ;; define function
    (setq ANIMALS '("dog" "cat" "bird" "smake" "horse" "donkey" "bug"))                     ;; setq
    (setq dcl_id (load_dialog "test/poplist_test.dcl"))                                     ;; load dialog
            
    (if (not (new_dialog "poplist_test" dcl_id))
        (exit)
    )                                                                                       ;; if

    (start_list "selections")                                                               ;; start the list box
    (mapcar 'add_list ANIMALS)                                                                 ;; fill the list box
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
            (setq SEL (nth SEL ANIMALS))                                                    ;; get the Day
            (alert (strcat "You Selected: " SEL))                                           ;; display the Day
        )                                                                                   ;; progn
    )                                                                                       ;; if userclick
    (princ)
)                                                                                           ;defun
(princ)
;; LISP CODING ENDS HERE
