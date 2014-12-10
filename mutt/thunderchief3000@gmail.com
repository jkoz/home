## Receive options.
set spoolfile="~/Mail/thunderchief3000@yahoo.com"
set folder="~/Mail/thunderchief3000@yahoo.com"
set mbox = "~/Mail/thunderchief3000@yahoo.com"
set record="+Sent"
set postponed="+Drafts"
mailboxes `echo -n "+ "; find ~/Mail/phuoctaitp@gmail.com -maxdepth 2 -type d -name ".*" -printf "+'%f' "`

## Send options.
set realname = "Tai Tran"
set from = "thunderchief3000@yahoo.com"
set use_from = yes
set envelope_from = yes
set sendmail = msmtp
