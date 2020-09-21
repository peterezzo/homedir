# home dir setup

probably requires something like this
    git init .
    git remote add github -f https://github.com/peterezzo/homedir.git
    git reset [--hard] github/main
    git checkout -t github/main
