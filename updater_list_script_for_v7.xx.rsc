/system scheduler
add comment="Apply combined List" interval=1d name=Update_combined on-event=\
    Updater_List policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-date=2024-02-24 start-time=15:50:16
/system script
add dont-require-permissions=no name=Updater_List owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/tool/fetch url=\"https://raw.githubuserc\
    ontent.com/Serp07/updater_list_for_mikrotik/main/combined.rsc\" mode=https dst-path=combined.rsc;\
    \n\r\
    \n:log info \"Downloaded autoaddresslist from github/Serp07 \";\r\
    \n/ip/firewall/address-list/remove [find where comment=\"Auto_address_List\"&\"Bruteforce_Blocker\"]\
    \n/import file-name=combined.rsc;\r\
    \n\
    \n:log info \"Removed old autoaddresslist records and imported new list\";\r\
    \n\
    \n#/file/remove combined.rsc"
