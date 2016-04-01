------------------------------------------
--- Author: Pradeep Singh
--- Date: 1st April 2016
--- Version: 1.0
--- NodeMCU Firmware: nodemcu_float_0.9.6-dev_20150704.bin
--- Description: This is sample code for configuring NodeMCU module as Access Point
------------------------------------------

---------------------------------------
--- Set Variables ---
---------------------------------------
--- Set AP Configuration Variables ---
AP_CFG={}
--- SSID: 1-32 chars
AP_CFG.ssid="pradeep"
--- Password: 8-64 chars. Minimum 8 Chars
AP_CFG.pwd="wifipassword"
--- Authentication: AUTH_OPEN, AUTH_WPA_PSK, AUTH_WPA2_PSK, AUTH_WPA_WPA2_PSK
AP_CFG.auth=AUTH_OPEN
--- Channel: Range 1-14
AP_CFG.channel = 6
--- Hidden Network? True: 1, False: 0
AP_CFG.hidden = 0
--- Max Connections: Range 1-4
AP_CFG.max=4
--- WiFi Beacon: Range 100-60000
AP_CFG.beacon=100

--- Set AP IP Configuration Variables ---
AP_IP_CFG={}
AP_IP_CFG.ip="192.168.10.1"
AP_IP_CFG.netmask="255.255.255.0"
AP_IP_CFG.gateway="192.168.10.1"

--- Set AP DHCP Configuration Variables ---
--- There is no support for defining last DHCP IP ---
AP_DHCP_CFG ={}
AP_DHCP_CFG.start = "192.168.10.2"
---------------------------------------

--- Configure ESP8266 into AP Mode ---
wifi.setmode(wifi.SOFTAP)
--- Configure 802.11n Standard ---
wifi.setphymode(wifi.PHYMODE_N)

--- Configure WiFi Network Settings ---
wifi.ap.config(AP_CFG)
--- Configure AP IP Address ---
wifi.ap.setip(AP_IP_CFG)

--- Configure DHCP Service ---
wifi.ap.dhcp.config(AP_DHCP_CFG)
--- Start DHCP Service ---
wifi.ap.dhcp.start()
---------------------------------------
