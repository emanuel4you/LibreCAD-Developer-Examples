# LibrePython Example
#
# LibreCAD is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 (https://www.gnu.org/licenses/gpl-2.0.html) (GPLv2)
# as published by the Free Software Foundation.
# Please read the LICENSE file for additional information.
#

from librecad import RS_PythonGui as gui
from librecad import RS_Graphic as graphic
from librecad import RS_Circle as circle
from librecad import RS_CircleData as circleData
from librecad import LC_UndoSection as undoSection
from librecad import RS_Vector as vector

mygui = gui()
container = mygui.getContainer()

def Circle():
        print("got graphic")
        #myvector1  = vector(0, 0)
        #myvector2  = vector(100, 100)
        #mylineData = lineData(myvector1, myvector2)

        mycircle     = circle(container, circleData(vector(0.0, 0.0), 100.0))
        
        container.addEntity(mycircle)
        undo = undoSection(container)
        undo.addUndoable(mycircle);



# __main__ of module
#if __name__ == "__main__":
#    mygui.prompt("Type \"<return>\" to start...")
#    Circle()
