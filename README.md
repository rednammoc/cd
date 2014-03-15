# cd

Extends builtin cd-command with traverseable history.

## Install

Clone this repository into your prefered bin-directory (e.g. /home/YOUR_USERNAME/bin).

    git clone https://github.com/rednammoc/cd
    git pull
    git submodule update --init --recursive

Within your .bashrc append following code to use the extended cd-command.

    function cd () { /home/YOUR_USERNAME/bin/cd $@; }

Make sure your bin-directory is correctlry added to your PATH-variable within ~/.profiles.

	PATH=$PATH:~/bin

## Usage


    Usage: cd [OPTION...]
    
    Options:
    
      +     go to next directory in history.
      -     go to previous directory in history.


## Utils


This extension is also shipped with two additional utils.

### cdh


cdh (cd_history) allows browsing and manipulating the cd-history.  

    Usage: cdh [options]
             
    Options:
	  -                go to previous #position.
	  +                go to next #position.
	  -a [path]        add path to history after current position.
						when no path is specified the current working directory will be added.
	  -c               clear history.
	  -d <position>    remove path at #position from history.
	  -i               show profile-info.
	  -l               list history and highlight current position.
	  -r <position>    go to directory at #position.
	  -h, --help       show this help message and exit.

### cd_stats

cd_stats allows you to explore your cd-history and may be used by other tools (e.g. creating dynamic bookmarks). 

    Usage: cd_stats <file> [options]
             
    Options:
      -t               show list sorted by number of occurences.
      -c               prefix lines with number of occurences.
      -h, --help       show this help message and exit. 

