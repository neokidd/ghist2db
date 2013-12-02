ghist2db
========

A Bash script that extracts (Android) git history info to sqlite3 db, so that it can be examined easily.

##Usage:
repo forall -c ghist2db.sh
,or, run it separately for each repo project

##Output:
A sqlite3 data file (ginfor.db) containing Android commit info such as committer, email time, project etc. 

##Statistics:
Using that ginfo.db, some interesting statistics data can be discovered. For example, run query in every Git in the Android 4.0.4 to find out all commit info by Googlers, and insert those to databases. Then some very interesting observations are obtained:

1. There has been 155416 times of code changes (commits) by Googlers.

2. Assuming that on average, A Google engineer does 3 code changes in a week, that means Android had spent about 51805 staff*week of engineer work.

3. Assuming that on average, salary of Google engineer is 200K a year, Android has pay about 199250K to engineers. (51805/52*200K). Huge?? or Modest??

4. It's also to see those top Google engineers in terms of contributing code change for Android. Here are the them, and their working project:

Commits | Author's Google email ID |  Commiter's Google email ID |　Project

4614|jessewilson@google.com|jessewilson@google.com|system/core
4410|hackbod@google.com|hackbod@google.com|system/vold
2850|omakoto@google.com|omakoto@google.com|packages/providers/ContactsProvider
2727|mathias@google.com|mathias@google.com|system/extras
2341|dplotnikov@google.com|dplotnikov@google.com|sdk
2229|raphael@google.com|raphael@google.com|system/core
2226|andih@google.com|andih@google.com|system/media
1876|adamp@google.com|adamp@google.com|packages/wallpapers/PhaseBeam
1794|steveblock@google.com|steveblock@google.com|system/core
1673|kroot@google.com|kroot@google.com|system/vold
1647|takaoka@google.com|takaoka@google.com|packages/providers/ContactsProvider
1584|dmiyakawa@google.com|dmiyakawa@google.com|packages/providers/TelephonyProvider
1540|satok@google.com|android-gerrit@google.com|system/core
1534|romainguy@google.com|romainguy@google.com|system/core
1496|elaurent@google.com|elaurent@google.com|system/media
1478|jeffbrown@google.com|jeffbrown@google.com|system/vold
1461|jaikumar@google.com|jaikumar@google.com|system/core
1434|justinho@google.com|justinho@google.com|packages/wallpapers/PhaseBeam
1419|debunne@google.com|debunne@google.com|packages/inputmethods/LatinIME
1417|cshapiro@google.com|cshapiro@google.com|system/media
1352|wuchengli@google.com|wuchengli@google.com|system/core
1314|jdong@google.com|jdong@google.com|system/media﻿


