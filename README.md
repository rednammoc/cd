cd
======

Extends builtin cd-command with traverseable history.

Install
=====

 git clone https://github.com/rednammoc/cd
 git pull
 git submodule update --init --recursive

Usage
=====

 Usage: cd [OPTION...]
 
 Options:
 
   +     go to next directory in history.
   -     go to previous directory in history.


Utils
=====

This extension is also shipped with two additional utils.

cd_history
====

cd_history allows you navigate within cd-history. It is also capable of highlighting the current position in cd-history.  

 Usage: cd_history [options]
             
 Options:
   -                go to previous #position.
   +                go to next #position.
   -c               clear history.
   -l               list history and highlight current position.
   -r [position]    go to directory at #position.
   -h, --help       show this help message and exit.

cd_stats
====

cd_stats allows you to explore your cd-history and may be used by other tools (e.g. creating dynamic bookmarks). 

 Usage: cd_stats <file> [options]
             
 Options:
   -t               show list sorted by number of occurences.
   -c               prefix lines with number of occurences.
   -h, --help       show this help message and exit. 

