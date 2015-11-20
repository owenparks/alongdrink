from test import *

TESTPATH = """
north
north
"""

def drive(finalcmd):
    # Make sure all the final commands end with the scene finishing
    p = Playthrough(TESTPATH+finalcmd)
    p.register(WinTest)
    p.go()

def test_drive():
    drive("drive")
    drive("stop")
    drive("brake")
    drive("north")

