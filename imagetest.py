# LibrePython Example
#
# LibreCAD is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
# as published by the Free Software Foundation.
# Please read the LICENSE file for additional information.
#

from librecad import RS_PythonGui as gui
from librecad import RS_PythonDcl as dcl

mygui = gui()
mydcl = dcl()

mygui.prompt("Type \"imageTest()\" to start...")

userClick = False

def imageTest(): 
    dcl_id = mydcl.loadDialog("test/image_test.dcl")
    
    if mydcl.newDialog("image_test", dcl_id) == False:
        print("[imageTest] Error: can not load gui!")
        return
    
    x = mydcl.dimxTile("img1")
    y = mydcl.dimyTile("img1")
    
    mydcl.startImage("img1")
    mydcl.fillImage(0, 0, 20, 20, 2)
    mydcl.endImage()
    
    w = mydcl.dimxTile("img2")
    h = mydcl.dimyTile("img2")
    w1 = int(w/2)
    h1 = int(h/2)
    
    print(w, h, w1, h1)
    
    mydcl.startImage("img2")
    mydcl.fillImage(0, 0, w1, 100, 46)
    mydcl.vectorImage(0, h, w1, 0, 2)
    mydcl.vectorImage(w1, 0, w, h, 1)
    mydcl.vectorImage(0, h, w1, h1, 3)
    mydcl.vectorImage(w1, h1, w, h, 0)
    mydcl.endImage()
    
    mydcl.startImage("img3")
    mydcl.pixImage(20, 20, 50, 50, "test/librecad.png")
    mydcl.pixImage(40, 40, 30, 30, "test/pen_apply.svg")
    mydcl.pixImage(60, 60, 20, 20, "test/pen_apply.svg")
    mydcl.textImage(0, 5, 100, 100, "Hallo", 7)
    mydcl.textImage(10, 80, 100, 50, "LibreCAD", 245)
    mydcl.textImage(10, 50, 40, 50, "Python!", 3)
    mydcl.endImage()
    
    mydcl.actionTile("accept", "(py-simple-string \"mydcl.doneDialog()\nuserClick = True\")")
    mydcl.actionTile("cancel", "(py-simple-string \"mydcl.doneDialog()\nuserClick = False\")")
    
    mydcl.startDialog()
    mydcl.unloadDialog(dcl_id)

    if userClick:
         print("[imageTest] Ok pressed")
    else:
         print("[imageTest] Cancel pressed")
