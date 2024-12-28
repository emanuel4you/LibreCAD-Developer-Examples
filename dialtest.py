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

mygui.prompt("Type \"dialTest()\" to start...")

userClick = False
length = 50

def dialAction(val, why):
    if why == 2 or why == 1:
        mydcl.setTile("eb1", val)

def eboxAction(val, why):
    if why == 2 or why == 1:
        mydcl.setTile("mydial", val)

def dialTest():
    dcl_id = mydcl.loadDialog("test/dial_test.dcl")
    
    if mydcl.newDialog("dial_test", dcl_id) == False:
        print("[dialTest] Error: can not load gui!")
        return

    mydcl.setTile("eb1", "50")
    mydcl.modeTile("eb1", 2)
    mydcl.actionTile("mydial", "(py-simple-string \"dialAction($value, $reason)\")")
    mydcl.actionTile("eb1", "(py-simple-string \"eboxAction($value, $reason)\")")
    
    mydcl.actionTile("accept", "(py-simple-string \"mydcl.doneDialog()\nuserClick = True\")")
    mydcl.actionTile("cancel", "(py-simple-string \"mydcl.doneDialog()\nuserClick = False\")")
    
    mydcl.startDialog()
    mydcl.unloadDialog(dcl_id)

    if userClick:
         mygui.MessageBox("You Selected: %d" %length)
    else:
         print("[dialTest] Cancel pressed")
