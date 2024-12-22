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

mygui.prompt("Type \"okOnly()\" to start...")

userClick = False

def okOnly():
    dcl_id = mydcl.loadDialog("test/ok_only.dcl")
    
    if mydcl.newDialog("ok_only_dlg", dcl_id) == False:
        print("[okOnly] Error: can not load gui!")
        return
    
    mydcl.actionTile("accept", "(py-simple-string \"mydcl.doneDialog()\nuserClick = True\")")
    
    mydcl.startDialog()
    mydcl.unloadDialog(dcl_id)

    if userClick:
         print("[okOnly] Ok pressed")
    else:
         print("[okOnly] Cancel pressed")
