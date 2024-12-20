;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;; AUTOLISP CODING STARTS HERE
(prompt "\nType \"imagetest\" to run...")
    
(defun c:imagetest()                                        ;; define function
    (setq dcl_id (load_dialog "test/image_test.dcl"))       ;; load dialog
    (if (not (new_dialog "image_test" dcl_id)               ;; test for dialog
        )                                                   ;; not
        (exit)                                              ;; exit if no dialog
    )                                                       ;; if
    
    (setq w (dimx_tile "img1")                              ;; get image tile width
          h (dimy_tile "img1")                              ;; get image tile height
    )                                                       ;; setq
    (start_image "img1")                                    ;; start the image
    (fill_image 0 0 20 20 1)                                ;; fill it with red
    (end_image)                                             ;; end image
    
    (setq w (dimx_tile "img2")                              ;; get image tile width
          h (dimy_tile "img2")                              ;; get image tile height
    )                                                       ;; setq

    (start_image "img2")                                    ;; start the image
    (fill_image 0 0 (/ w 2) h 0)                            ;; fill the image with black
    (setq w1 (/ w 2))                                       ;; calculate vector
    (setq h1 (/ h 2))                                       ;; calculate vector
    (vector_image 0 h w1 0 2)                               ;; draw vector
    (vector_image w1 0 w h 1)                               ;; draw vector
    (vector_image 0 h w1 h1 3)                              ;; draw vector
    (vector_image w1 h1 w h 0)                              ;; draw vector
    (end_image)                                             ;; end image
    
    (setq w (dimx_tile "img3")                              ;; get image tile width
          h (dimy_tile "img3")                              ;; get image tile height
    )                                                       ;; setq
    (start_image "img3")                                    ;; start the image
    (fill_image 0 5 w h 7)                                  ;; fill the image with blue
    (text_image 0 5 w (/ h 4) "Hallo, " 5)                  ;; display a text   (text_image is LibreLisp/LibreDcl+ only)
    (text_image (+ 1 (/ w 3)) 5 w (/ h 4) "LibreCAD!" 3)    ;; display a text
    (pix_image 20 20 50 50 "test/librecad.png")             ;; display a picture (pix_image is LibreLisp/LibreDcl+ only)
    (pix_image 40 40 30 30 "test/pen_apply.svg")            ;; display a picture
    (pix_image 60 60 20 20 "test/pen_apply.svg")            ;; display a picture
    (end_image)                                             ;; end image
    
    (action_tile
        "accept"                                            ;; if OK pressed
        "(done_dialog) (setq userclick T)"                  ;; close dialog, set flag
    )                                                       ;; action tile

    (action_tile
        "cancel"                                            ;; if cancel button pressed
        "(done_dialog) (setq userclick nil)"                ;; close dialog, lower flag
    )                                                       ;; action_tile
    (start_dialog)                                          ;; start dialog
    (unload_dialog dcl_id)                                  ;; unload
    (if userclick                                           ;; if OK selected
        (princ)
;;        (alert "You selected OK")                           ;; inform the user
;;        (alert "You selected Cancel")                       ;; inform the user
    )                                                       ;; if
    (princ)
)                                                           ;; defun
(princ)
;; AUTOLISP CODING ENDS HERE

