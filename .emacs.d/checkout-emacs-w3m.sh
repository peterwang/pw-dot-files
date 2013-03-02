#! /bin/sh

destdir=~/repos/cvs/emacs-w3m

if [ ! -d $destdir ]; then
    echo "mkdir $destdir ..."
    mkdir -p $destdir
fi

cd $destdir/..

cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot login

cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot co emacs-w3m

