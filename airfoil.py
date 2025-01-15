import re
from librecad import RS_PythonGui as gui
from librecad import RS_Vector as vec

mygui = gui()

#mygui.prompt("Type \"main()\" to start...")

def is_float(element: any) -> bool:
    p = re.compile(r'[-]*[01]\.\d+')
    return bool(p.match(element))

def getFileName() -> str:
    fileName = mygui.OpenFileDialog("Select a Airfoil", "", "*.dat *.DAT").encode('utf-8', 'replace').decode()
    print("[airfoil] open:", fileName)
    return fileName

def readAirfoil(filename: str) -> list:
    print("[readAirfoil] filename:", filename)
    return []
    if filename == "":
        print("[readAirfoil] error no file select")
        return []

    airfoil = []
    with open(filename, "r") as f:
        for line in f:
            print("line", line)
            if len(line.strip()) == 0:
                continue
            
            if len(line.strip().split()) == 2:
                x = line.strip().split()[0]
                y = line.strip().split()[1]
            else:
                continue
            
            if is_float(x) and is_float(y):
                airfoil.append(dict(x = float(x), y = float(y)))
    
    return airfoil
    
def drawAirfoil(airfoil: list, scale: float):
    if len(airfoil):
        mygui.command("polyline")
        for point in airfoil:
            #print(point["x"], point["y"])
            mygui.command("%s,%s" %(point["x"] * scale, point["y"] * scale))
        mygui.command("k")

def main():
      drawAirfoil(readAirfoil(getFileName()), 100.0)

if __name__ == "__main__":
    main()
