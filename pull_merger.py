import sys
import re


def main():
    args = sys.argv
    #print("sending output to next command")
    #args = "".join(args)

    print("Starting python.")

    remote_string = "remotes/origin/dependabot"
    newArgs = ["Empty"]
    for pullRequest in args:
        if re.search(remote_string, pullRequest) != None:
            print( str(len(newArgs)) + ". " + "".join(pullRequest[15:]))
            newArgs.append(pullRequest[15:])
            
    #sys.stdout.write("echo 'Hello World'")


    if len(newArgs) > 1:
        sys.stdout.write(",".join(newArgs[1:]))
        sys.exit(0)
#        print("Please enter the number of the branch you wish to merge, or 0 if you wish to cancel the operation.")
#        choice = input()
#        choice = int(choice)
#        
#        if choice > 0:
#            sys.stdout.write("".join(newArgs[choice]))
#            sys.exit(0)
#        else:
#            print( "Operation cancelled, goodbye.")
#            sys.exit(0)
    else:
        sys.stdout.write("Empty");
        sys.exit(0)


main()


# python pull_merger.py $(git branch -a)
# do it like this
# echo $(python pull_merger.py $(git branch -a))
