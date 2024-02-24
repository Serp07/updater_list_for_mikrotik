### updater_list_for_mikrotik

# MikroTik Automatically Updated Address List
A Problem
When you offer public access to a service it can be rather difficult to separate the bad connections from the good.

A Solution
MikroTik to the rescue with address lists… simply put the bad addresses in a list and block anything in the list. Sounds like fun right… or maybe not so much? Of course you can (and should) manually create rules to detect abuse and dynamically create the lists… However there is more that you can do, you can subscribe to lists that are maintained by others like Spamhaus, dshield,

### Example of a parsed list
Generated by Serp07 on 2024-02-24 01:59:30   
/ip firewall address-list   
add list=blacklist address=1.4.0.0/17 comment=SpamHaus   
add list=blacklist address=1.10.16.0/20 comment=SpamHaus   
add list=blacklist address=1.116.0.0/14 comment=SpamHaus   
...
### Implementation
The implementation is simple... paste the following code into the terminal of any MikroTik and your router will grabthe newest copy of my script file and run it regular basis.    

[Contribution guidelines for this project](updater_list_script_for_v7.xx.rsc)

The following will not block anything, it only adds IP’s to your address list. You will still have to create a firewall rule which will match src-address-list=blacklist and drop the traffic in your input and/or forward chains.
In order to use any of the following lists you will want to add a rule to your input or forward chains like the following:

add chain=input action=drop comment="Drop new connections from blacklisted IP's to this router" \
    connection-state=new src-address-list=blacklist in-interface=ether1-Internet
