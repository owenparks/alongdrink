import subprocess
from subprocess import check_output, Popen, PIPE, STDOUT

import re

PROJECTNAME = "Untitled" #TODO: Change this to an environment variable
CRITPATH = """
north
north
down
"""
# This stuff doesn't have to be here, it can be outlined in the game itself via "test critpath with <commands>"
# when building complex paths and making fuzz tests, this may be what I eventually want to do

# TODO: upon running all the callbacks, we can consume the script to deal with duplicates?

class ExpectTest(object):
    input_text = ""

    @classmethod
    def expect(cls, transcript, **kwargs):
        # Override this with a the assert function for verifying the result
        raise NotImplementedError

class SceneTest(ExpectTest):
    input_text = "scenes\nscenes off"
    @classmethod
    def expect(cls, transcript, **kwargs):
        scenename = kwargs['scenename']
        import re
        m = re.search("Scene \'(.*)\' playing", transcript)
        assert m is not None
        assert "Entire Game" in m.group(1)
        
class WinTest(ExpectTest):
    input_text = ""

    @classmethod
    def expect(cls, script, **kwargs):
        assert "*** The End ***" in script

class Playthrough(object):
    def __init__(self, script=""):
        if script:
            self.script = script
        else:
            self.script = ""
        self.playthrough = ""
        self.callbacks = []

    def register(self, testclass, **kwargs):
        # The means by which we add test inputs and check test outputs
        # The test class' required text is added to the player input script
        # And the callback function to scan the script for it is added to the
        #   verifier function list
        self.script += testclass.input_text
        self.callbacks.append((testclass.expect, kwargs))

    def assertScene(self, scenename):
        self.register(SceneTest, scenename=scenename)

    def assertWin(self):
        self.register(WinTest)

    def go(self):
        playthrough = self.run(self.script)
        print(playthrough)
        for callback, kwargs in self.callbacks:
            callback(playthrough, **kwargs)

    def run(self, script):
        # Runs the game with script and returns the full text of the playthrough
        p = Popen(['interpreter/glulxe/glulxe', '%s.inform/Build/output.gblorb' % PROJECTNAME], stdout=PIPE, stdin=PIPE, stderr=STDOUT)
        return p.communicate(input=script)[0].rstrip()

def test_criticalpath():
    p = Playthrough(CRITPATH)
    p.assertWin()
    p.go()

def test_scene():
    p = Playthrough()
    p.assertScene('Entire Game')
    p.go()

if __name__ == "__main__":
    test_criticalpath()

# TODO:
"""
Take a trivial game example of "escape the room" where one can find a key or persuade a guard to win
- Make a game phase class that represents a single unit of game state change, e.g. taking a key
    - Game phases can contain other game phases, e.g. "unlock the door" could have "take key" and "unlock door"
    - Game phases have preconditions and postconditions representing game state:
        - Precondition: Door is locked
        - Postcondition: Door is unlocked
    - A playthrough is a list of game phases in order?
    - Support optional phases that are in parallel
    - Support required phases that can be done in multiple orders
- chomp the output text to find the expected string and assert it is what it should be.
"""
