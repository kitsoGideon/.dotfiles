#! /usr/bin/env python
import subprocess
import os.path


print("\nInstalling pyside build dependencies...\n")

subprocess.call("""apt install build-essential
    git cmake libqt5-dev libphonon-dev python3-dev
    libxml2-dev libxslt1-dev qtmobility-dev libqtwebkit-dev""",
    shell=True)

print("\nfinished installing dependencies!!\n")
