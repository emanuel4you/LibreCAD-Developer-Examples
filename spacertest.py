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

mygui.prompt("Type \"spacerTest()\" to start...")

userClick = False

def spacerTest():
    dcl_id = mydcl.loadDialog("test/spacer_test.dcl")
    
    if mydcl.newDialog("spacer_test", dcl_id) == False:
        print("[spacerTest] Error: can not load gui!")
        return
    
    mydcl.actionTile("accept", "(py-simple-string \"mydcl.doneDialog()\nuserClick = True\")")
    mydcl.actionTile("cancel", "(py-simple-string \"mydcl.doneDialog()\nuserClick = False\")")
    
    mydcl.startDialog()
    mydcl.unloadDialog(dcl_id)

    if userClick:
         print("[spacerTest] Ok pressed")
    else:
         print("[spacerTest] Cancel pressed")
