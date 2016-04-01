------------------------------------------
--- Author: Pradeep Singh
--- Date: 1st April 2016
--- Version: 1.0
--- NodeMCU Firmware: nodemcu_float_0.9.6-dev_20150704.bin
--- Description: This is sample code for configuring NodeMCU module in Hybrid Mode (AP and Client)
------------------------------------------

-----------------------------------------------
--- Set Variables ---
-----------------------------------------------
--- Set Client Configuration Variables ---

WIFI_SSID = "yourssid"
WIFI_PASSWORD = "yourpassword"

--- IP CONFIG (Leave blank to use DHCP) ---
ESP8266_IP=""
ESP8266_NETMASK=""
ESP8266_GATEWAY=""
-----------------------------------------------
--- Set Access Point Configuration Variables ---

AP_CFG={}
--- SSID: 1-32 chars
AP_CFG.ssid="pradeep"
--- Password: 8-64 chars. Minimum 8 Chars
AP_CFG.pwd="wifipassword"
--- Authentication: AUTH_OPEN, AUTH_WPA_PSK, AUTH_WPA2_PSK, AUTH_WPA_WPA2_PSK
AP_CFG.auth=AUTH_OPEN
--- Channel: 1-14
AP_CFG.channel = 6
--- Hidden Network? True: 1, False: 0
AP_CFG.hidden = 0
--- Max Connections 1-4
AP_CFG.max=4
--- WiFi Beacon 100-60000
AP_CFG.beacon=100

--- Set AP IP Configuration Variables ---
AP_IP_CFG={}
AP_IP_CFG.ip="192.168.10.1"
AP_IP_CFG.netmask="255.255.255.0"
AP_IP_CFG.gateway="192.168.10.1"

--- Set AP DHCP Configuration Variables ---
--- There is no support for defining last DHCP IP
AP_DHCP_CFG ={}
AP_DHCP_CFG.start = "192.168.10.2"
---------------------------------------

--- Configure ESP8266 into Hybrid Mode (AP and Client Mode) ---
wifi.setmode(wifi.STATIONAP)
--- Configure 802.11n Standard ---
wifi.setphymode(wifi.PHYMODE_N)

-----------------------------------------------
--- WiFi Client Setup ---

--- Configure Client with Router SSID and Password ---
wifi.sta.config(WIFI_SSID, WIFI_PASSWORD) 
wifi.sta.connect()

--- Configure Static IP (If Available) ---
if ESP8266_IP ~= "" then
    wifi.sta.setip({ip=ESP8266_IP,netmask=ESP8266_NETMASK,gateway=ESP8266_GATEWAY})
end

-----------------------------------------------
--- WiFi Access Point Setup ---

--- Configure WiFi Network Settings ---
wifi.ap.config(AP_CFG)
--- Configure AP IP Address ---
wifi.ap.setip(AP_IP_CFG)

--- Configure DHCP Service ---
wifi.ap.dhcp.config(AP_DHCP_CFG)
--- Start DHCP Service ---
wifi.ap.dhcp.start()
---------------------------------------
