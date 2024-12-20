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

mygui.prompt("Type \"listTest()\" to start... ")

userClick = False

def listTest():
    days = ("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")     
    dcl_id = mydcl.loadDialog("test/list_test.dcl")
    
    if mydcl.newDialog("list_test", dcl_id) == False:
        print("[listTest] Error: can not load gui!")
        return
    
    mydcl.startList("selections")
    for i in range(len(days)):
        mydcl.addList(days[i])
    mydcl.endList()
    
    mydcl.actionTile("accept", "(py-simple-string \"sel = int(mydcl.getTile(\'selections\'))\nmydcl.doneDialog()\nuserClick = True\")")
    mydcl.actionTile("cancel", "(py-simple-string \"mydcl.doneDialog()\nuserClick = False\")")
    
    mydcl.startDialog()
    mydcl.unloadDialog(dcl_id)

    if userClick:
         mygui.MessageBox("You Selected: " + days[sel])
    else:
         print("Cancel pressed")
