import re
from os import path as os_path
import requests
import tempfile

from bs4 import BeautifulSoup

from librecad import RS_PythonGui as gui
from librecad import RS_PythonDcl as dcl
from librecad import RS_Vector as vec

mydcl = dcl()
mygui = gui()

baseUrl = "https://m-selig.ae.illinois.edu/ads/"
dataBaseUrl = baseUrl + "coord_database.html"

selectedAirfoil = -1
userClick = False

def is_float(element: any) -> bool:
    p = re.compile(r'[-]*[01]\.\d+')
    return bool(p.match(element))

def getFileName() -> str:
    fileName = mygui.OpenFileDialog("Select a Airfoil", "", "*.dat *.DAT").encode('utf-8', 'replace').decode()
    print("[getFileName] open:", fileName)
    return fileName

def readAirfoil(filename: str) -> list:
    print("[readAirfoil] filename:", filename)
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

def getUrls() -> list:
    airfoilUrls = []
    reqs = requests.get(dataBaseUrl)
    page = BeautifulSoup(reqs.text, 'html.parser')

    for link in page.find_all('a'):
        if link.string is not None and ".dat" in link.string:
            airfoilUrls.append(dict(url=link.get("href"), name=link.text))

    return airfoilUrls

def getAirfoil(airfoil: dict):
    print(airfoil)
    reqs = requests.get(baseUrl + airfoil["url"], allow_redirects=True)
    filename = os_path.join("./", airfoil["name"])
    open(filename, 'wb').write(reqs.content)
    return readAirfoil(filename)


def Airfoils():
    dcl_id = mydcl.loadDialog("test/airfoils_dlg.dcl")
    if mydcl.newDialog("airfols_dlg", dcl_id) == False:
        print("[Airfoils] Error: can not load gui!")
        return

    airfoils = getUrls()
    airfoilUrls = [ airfoil["name"] for airfoil in airfoils ]

    mydcl.startList("lb_airfoils")
    for i in range(len(airfoilUrls)):
        mydcl.addList(airfoilUrls[i])
    mydcl.endList()

    mydcl.actionTile("accept", "(py-simple-string \"selectedAirfoil = int(mydcl.getTile(\'lb_airfoils\'))\nmydcl.doneDialog()\nuserClick = True\")")
    mydcl.actionTile("cancel", "(py-simple-string \"mydcl.doneDialog()\nuserClick = False\")")

    mydcl.startDialog()
    mydcl.unloadDialog(dcl_id)

    if userClick:
         for i in airfoils:
              if airfoilUrls[selectedAirfoil] == i["name"]:
                  drawAirfoil(getAirfoil(i), 100)
                  #print(baseUrl + i["url"])
    else:
         print("[Airfoils] Cancel pressed")


airfoils = Airfoils()
