import subprocess
from subprocess import check_output, Popen, PIPE, STDOUT

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
    def expect(cls, script):
        # Override this with a the assert function for verifying the result
        raise NotImplementedError

class WinTest(ExpectTest):
    input_text = ""

    @classmethod
    def expect(cls, script):
        assert "*** The End ***" in script

class Playthrough(object):
    def __init__(self, script):
        self.script = script
        self.playthrough = ""
        self.callbacks = []

    def register(self, testclass):
        self.script += testclass.input_text
        self.callbacks.append(testclass.expect)

    def go(self):
        playthrough = self.run(self.script)
        print(playthrough)
        for callback in self.callbacks:
            callback(playthrough)

    def run(self, script):
        # Runs the game with script and returns the full text of the playthrough
        p = Popen(['interpreter/glulxe/glulxe', '%s.inform/Build/output.gblorb' % PROJECTNAME], stdout=PIPE, stdin=PIPE, stderr=STDOUT)
        return p.communicate(input=script)[0].rstrip()

def test_criticalpath():
    p = Playthrough(CRITPATH)
    p.register(WinTest)
    p.go()
    #assert False
    #pass

if __name__ == "__main__":
    test_criticalpath()

# TODO:
"""
-Create some sort of Task class that represents a discrete unit of game progress
e.g. picking up an item
-Make a game phase class that represents a unit of game state where some Tasks
are no longer available, and other tasks are not yet available.
e.g. a "wait" task makes it night time and progresses the game
-Every task has some sort of confirmation text that it parses the output for
-The assert functions of these tasks are put onto a global queue, and run in order
to chomp the output text to find the expected string and assert it is what it should be.
"""
