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

name = ""
age = -1

mygui.prompt("Type \"editTest()\" to start...")

def val2():
    if int(mydcl.getTile("age")) < 1:
        mydcl.setTile("error", "Invalid Age - Please Try Again!")
        mydcl.modeTile("age", 2)
    else:
        mydcl.doneDialog()

def val1():
    if mydcl.getTile("name") == "Enter Name Here":
        mydcl.setTile("error", "You must enter a name!")
        mydcl.modeTile("name", 2)
    else:
        val2()

def editTest():
    dcl_id = mydcl.loadDialog("test/edit_test.dcl")
    
    if mydcl.newDialog("edit_test", dcl_id) == False:
        print("[editTest] Error: can not load gui!")
        return
    
    mydcl.setTile("name", "Enter Name Here")
    mydcl.modeTile("name", 2)
    mydcl.actionTile("name", "(py-simple-string \"name = $value\")")
    mydcl.actionTile("age", "(py-simple-string \"age = $value\")")
    mydcl.actionTile("accept", "(py-simple-string \"val1()\")")
    
    mydcl.startDialog()
    mydcl.unloadDialog(dcl_id)
    mygui.MessageBox("Your name is " + name + "\nand you are " + age + " years of age.")
