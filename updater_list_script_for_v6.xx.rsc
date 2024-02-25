/system scheduler
add comment="Apply combined List" interval=1d name=Update_combined on-event=Updater_List policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-date=feb/24/2024 start-time=20:08:41
/system script
add dont-require-permissions=no name=Updater_List owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source="/tool fetch url=\"https://raw.githubusercontent.co\m/Serp07/updater_list_for_mikrotik/main/combined.rsc\" mode=https dst-path=combined.rsc;\
    \n\r\
    \n\r\
    \n:log info \"Downloaded autoaddresslist from github/Serp07 \";\r\
    \n\r\
    \n/ip firewall address-list remove [find where comment=\"Auto_address_List\"];\r\
    \n/ip firewall address-list remove [find where comment=\"Bruteforce_Blocker\"];\r\
    \n\
    \n\r\
    \n:log info \"Removed old autoaddresslist records and imported new list\";\r\
    \n\
    \n\r\
    \n/import file-name=combined.rsc;\r\
    \n\r\
    \n#/file/remove combined.rsc"
/ip firewall filter
add action=drop chain=input comment="Drop new connections from blacklisted IP's to this router" connection-state=new \
    in-interface=ether1 in-interface-list=WAN src-address-list=blacklist

