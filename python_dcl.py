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

mygui.prompt("Type \"pyTest()\" to start...")

def btnPython():
    mygui.MessageBox("Hello, LibreCAD!")

def pyTest():
    dcl_id = mydcl.loadDialog("test/py_dcl.dcl")
    
    if mydcl.newDialog("py_dcl", dcl_id) == False:
        print("[pyTest] Error: can not load gui!")
        return
    
    mydcl.actionTile("button_python", "(py-simple-string \"btnPython()\")")
    mydcl.actionTile("accept", "(py-simple-string \"winPos = mydcl.doneDialog(2)\")")
    
    print("[mydcl.startDialog] result: ", mydcl.startDialog())
    print("[dialog] pos: x=%i y=%i" %(winPos[0], winPos[1]))
    
    mydcl.unloadDialog(dcl_id)
