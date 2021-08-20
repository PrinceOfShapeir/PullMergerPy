import sys
import re
import subprocess


def main():
    args = sys.argv
    #print("sending output to next command")
    #args = "".join(args)

    remote_string = "dependabot"
    newArgs = ["Empty"]
    for pullRequest in args:
        if re.search(remote_string, pullRequest) != None:
            newArgs.append(pullRequest[15:])
    #sys.stdout.write("echo 'Hello World'")
    sys.stdout.write("".join(newArgs[-1]))
    sys.exit(0)


main()


# python pull_merger.py $(git branch -a)
# do it like this
# echo $(python pull_merger.py $(git branch -a))
