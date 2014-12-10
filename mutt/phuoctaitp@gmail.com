set mbox = "~/Mail/phuoctaitp@gmail.com"
set folder = "~/Mail/phuoctaitp@gmail.com"
set spoolfile = "~/Mail/phuoctaitp@gmail.com/Inbox"
set record    = "~/Mail/phuoctaitp@gmail.com/[Gmail]/.Sent Mail"
set postponed = "~/Mail/phuoctaitp@gmail.com/[Gmail]/.Drafts"

mailboxes `echo "~/Mail/phuoctaitp@gmail.com/[Gmail]/.All Mail";echo -n "+ "; find ~/Mail/phuoctaitp@gmail.com/ -maxdepth 1 -type d -printf "+'%f' ";`

set realname = "Tai Tran"
set from = "phuoctaitp@gmail.com"
set use_from = yes
set envelope_from = yes
set sendmail = msmtp
