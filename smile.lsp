;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;; AUTOLISP CODING STARTS HERE
(prompt "\nType \"smile\" to run...")

(defun c:smile()                                                      ;; define function
    (setq center (getpoint))                                          ;; get center point from user input
    (setq center (list (first center) (nth 1 center)))                ;; get center's (x,y)
    (setq left (list (- (first center) 30) (+ (nth 1 center) 30)))    ;; get left point center (x,y)
    (setq right (list (+ (first center) 30) (+ (nth 1 center) 30)))   ;; get right point center (x,y)
    (command "circle" center 100 "e")
    (command "circle" left 10 "e")
    (command "circle" right 10 "e")
    (command "arc" center 60 180 360 "k")
    (princ)
)                                                         ;; defun c:contest
(princ)
;; AUTOLISP CODING ENDS HERE
