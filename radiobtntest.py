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

mygui.prompt("Type \"radioTest()\" to start... ")

userClick = False
result = ""

def radioTest(): 
    dcl_id = mydcl.loadDialog("test/radio_btn_test.dcl")
    
    if mydcl.newDialog("radio_btn_test", dcl_id) == False:
        print("[radioTest] Error: can not load gui!")
        return
    
    mydcl.actionTile("rb1", "(py-simple-string \"result = 'Site'\")")
    mydcl.actionTile("rb2", "(py-simple-string \"result = 'Shop'\")")
    mydcl.actionTile("rb3", "(py-simple-string \"result = 'Hidden'\")")
    mydcl.actionTile("rb4", "(py-simple-string \"result = 'Countersunk'\")")
    
    mydcl.actionTile("accept", "(py-simple-string \"mydcl.doneDialog()\nuserClick = True\")")
    mydcl.actionTile("cancel", "(py-simple-string \"mydcl.doneDialog()\nuserClick = False\")")
    
    mydcl.startDialog()
    mydcl.unloadDialog(dcl_id)

    if userClick:
         mygui.MessageBox("You Selected: " + result)
    else:
         print("[radioTest] Cancel pressed")
