= CD

Extending the builtin linux cd command with a history.

 # going to previous directory in history 
 cd -

 # going to next directory in history
 cd +

 # going to <pos> in history 
 cd -r <pos>

 # print enumerated history 
 cd -h
 
== Features

* Overwrites the internal cd-command
* Adds history for each terminal
* Configureable history-size
