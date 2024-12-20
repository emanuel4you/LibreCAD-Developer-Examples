;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;; AUTOLISP CODING STARTS HERE
(prompt "\nType \"imagebuttontest\" to run...")

(defun C:imagebuttontest()                                      ; define function
    (setq la nil userclick nil)                                 ; init exit values, user could cancel with dialog exit button
    (setq dcl_id (load_dialog "test/imagebutton_test.dcl"))     ; load dialog
    (if (not (new_dialog "imagebutton_test" dcl_id)             ; test for dialog
        )                                                       ; not
        (exit)                                                  ; exit if no dialog
    )                                                           ; if
    (setq width (dimx_tile "img0")                              ; get the image width
            height (dimy_tile "img0")                           ; get the image height
    )                                                           ; end of setq
    (princ width)
    (princ width)
    (start_image "img0")                                        ; start the image
    (fill_image 0 0 width height 1)                             ; fill it with the relevant color
    (end_image)                                                 ; end the image
    (setq width (dimx_tile "img1")
        height (dimy_tile "img1")
    )                                                           ; end of setq
    (start_image "img1")
    (fill_image 0 0 width height 30)
    (end_image)

    (setq	width (dimx_tile "img2")
        height (dimy_tile "img2")
    )                                                           ; end of setq
    (start_image "img2")
    (fill_image 0 0 width height 2)
    (end_image)

    (setq	width (dimx_tile "img3")
        height (dimy_tile "img3")
    )                                                           ; end of setq
    (start_image "img3")
    (fill_image 0 0 width height 3)
    (end_image)

    (setq	width (dimx_tile "img4")
        height (dimy_tile "img4")
    )                                                           ; end of setq
    (start_image "img4")
    (fill_image 0 0 width height 4)
    (end_image)

    (setq	width (dimx_tile "img5")
        height (dimy_tile "img5")
    )                                                           ; end of setq
    (start_image "img5")
    (fill_image 0 0 width height 5)
    (end_image)

    (setq	width (dimx_tile "img6")
        height (dimy_tile "img6")
    )                                                           ; end of setq
    (start_image "img6")
    (fill_image 0 0 width height 6)
    (end_image)

    (setq width    (dimx_tile "img7")
        height (dimy_tile "img7")
    )                                                           ; end of setq
    (start_image "img7")
    (fill_image 0 0 width height 7)
    (end_image)

    (action_tile "img0" "(setq la \"0\")")                      ; get the name of the color selected
    (action_tile "img1" "(setq la \"1\")")
    (action_tile "img2" "(setq la \"2\")")
    (action_tile "img3" "(setq la \"3\")")
    (action_tile "img4" "(setq la \"4\")")
    (action_tile "img5" "(setq la \"5\")")
    (action_tile "img6" "(setq la \"6\")")
    (action_tile "img7" "(setq la \"7\")")

    (action_tile "accept"                                       ; if OK pressed
        "(done_dialog)(setq userclick T)"                       ; close dialog, set flag
    )                                                           ; action tile
    (action_tile "cancel"                                       ; if cancel button pressed
        "(done_dialog) (setq userclick nil)"                    ; close dialog
    )                                                           ; action_tile
    (start_dialog)                                              ; start dialog
    (unload_dialog dcl_id)                                      ; unload
        (if userclick                                           ; check OK was selected
            (alert (strcat "You Selected Color: " la))          ; display the color selected.
    )                                                           ; if userclick
    (princ)
)                                                               ; defun
(princ)
;; AUTOLISP CODING ENDS HERE

