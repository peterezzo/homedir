# home dir setup

probably requires something like this

    umask 0022
    touch .noagent
    git init .
    git remote add github -f https://github.com/peterezzo/homedir.git
    git reset [--hard] github/main
    git checkout -t github/main

If you need to modify a file and keep local changes (ex: .gitconfig)

    vim .gitconfig
    git update-index --assume-unchanged .gitconfig

