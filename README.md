# BashHistoryByTTy
Function for ever-lasting bash history for concurrent users

# Presentation
If, like me, you sometimes have to work with other people at the same time on the same server with the same user (typically doing root stuff), you probably already lost some command history.

By adding this to your /etc/bashrc (or local ~/.bashrc), you will have :
- Instant logging in history file
- History timestamping
- Everlasting history logging (no limits on number of lines)
- History logging and visualization by tty so you can follow the stream of commands issued on a single session
- Full history visualization for all ttys at the same time (for quick and efficient history searching) 

# Examples 
```
user@server:~/$  history pts1
(pts1) 141  [2019-11-19 10:20:02] tty
(pts1) 142  [2019-11-19 10:20:05] echo pts 1
(pts1) 143  [2019-11-19 10:20:13] echo pts1-1
```
```
user@server:~/$  history pts2
(pts2) 49  [2019-11-19 10:19:57] tty
(pts2) 50  [2019-11-19 10:19:59] echo pts2
(pts2) 51  [2019-11-19 10:20:10] echo pts2-2
```
```
user@server:~/$  history all
(pts2) 49  [2019-11-19 10:19:57] tty
(pts2) 50  [2019-11-19 10:19:59] echo pts2
(pts1) 141  [2019-11-19 10:20:02] tty
(pts1) 142  [2019-11-19 10:20:05] echo pts 1
(pts2) 51  [2019-11-19 10:20:10] echo pts2-2
(pts1) 143  [2019-11-19 10:20:13] echo pts1-1
```

# Licence
CC BY-NC-SA 4.0.
