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

mygui.prompt("Type \"registerTest()\" to start... ")

userClick = False

def registerTest():
    dcl_id = mydcl.loadDialog("test/register_test.dcl")
    
    if mydcl.newDialog("register_test", dcl_id) == False:
        print("[registerTest] Error: can not load gui!")
        return
    
    mydcl.actionTile("accept", "(py-simple-string \"mydcl.doneDialog()\nuserClick = True\")")
    mydcl.actionTile("cancel", "(py-simple-string \"mydcl.doneDialog()\nuserClick = False\")")
    mydcl.actionTile("help", "(py-simple-string \"mygui.MessageBox('LibreCAD will help You! :-)')\")")
    mydcl.actionTile("info", "(py-simple-string \"mygui.MessageBox('LibreCAD will inform You! :-)')\")")

    mydcl.setTile("error", "Hallo I'm the errtile :-)")
    
    mydcl.startDialog()
    mydcl.unloadDialog(dcl_id)

    if userClick:
         mygui.MessageBox("Ok pressed")
    else:
         print("[registerTest] Cancel pressed")
