# nov/01/2022 15:10:57 by RouterOS 6.49.5
# software id = 
#
# model = RBLHGR
# serial number = 
/tool netwatch
add comment="NetWatch LTE ifupdown conditional" down-script=":log warning \"Disabling the LTE interface for 60s\";\r\
    \n/interface lte set lte1 disabled=yes\r\
    \n:log info \"connection_lost\"\r\
    \n/delay 60s\r\
    \n:log warning \"Enabling the LTE interface\"\r\
    \n/interface lte set lte1 disabled=no\r\
    \n:log info \"Connection restored\"" host=8.8.8.8 interval=5m up-script="/interface lte set lte1 disabled=no\r\
    \n:log info \"Connection is Up - No need to do anything\""