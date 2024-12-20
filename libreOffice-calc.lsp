;; LibreLisp Example
;;
;; LibreCAD is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
;; as published by the Free Software Foundation.
;; Please read the LICENSE file for additional information.
;;
;;; can not handle '~/path' ;-(
;;
(setq file (open "/home/emanuel/test/myfile.csv" "w"))
(setq n 0)
(setq line "vector,X,Y,Z;")
(write-line line file)
(setq line "(1),0,0,0;")
(write-line line file)
(setq line "(2),100,100,0;")
(write-line line file)
(setq line "(3),200,0,0;")
(write-line line file)
(setq line "(4),200,0,0;")
(write-line line file)
(setq line "(5),200,0,0;")
(write-line line file)
(setq line "(6),200,0,0;")
(write-line line file)
(close file)
(setq librecalc "export LD_LIBRARY_PATH=/usr/lib/libreoffice/program:$LD_LIBRARY_PATH;; libreoffice --calc")
;(setq librecalc "/home/emanuel/test/calc.sh")
(startapp librecalc "test/myfile.csv &")
