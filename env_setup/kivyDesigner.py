#! /usr/bin/env python
import subprocess
from os.path import exists

print("\nfetching kivy-designer...\n")

# subprocess.call("workon kivy", shell=True)
subprocess.call("""
pip install -U watchdog pygments docutils jedi gitpython six kivy-garden""",
shell=True)

subprocess.call("garden install filebrowser", shell=True)

if not exists("~/gitClones/kivy-designer"):
    subprocess.call("git clone http://github.com/kivy/kivy-designer ~/gitClones/kivy-designer", shell=True)
subprocess.call("cd ~/gitClones/kivy-designer && python main.py", shell=True)
