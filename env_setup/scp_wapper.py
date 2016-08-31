#! /usr/bin/env python
#
# ssh connetion manager that takes the the name and user from stdin
# scp file transfer manager that takes filename from stdin

import subprocess
from sys import argv


script, user, ip_addr, filename = argv


subprocess.call("scp %s %s@%s:~/bin/%s" % (filename,
    user, ip_addr, filename), shell=True)
