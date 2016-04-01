------------------------------------------
--- Author: Pradeep Singh
--- Date: 1st April 2016
--- Version: 1.0
--- NodeMCU Firmware: nodemcu_float_0.9.6-dev_20150704.bin
--- Description: This is sample code for configuring NodeMCU module as WiFi Client
------------------------------------------

-----------------------------------------------
--- Set Variables ---
-----------------------------------------------
--- WIFI CONFIGURATION ---
WIFI_SSID = "joker"
WIFI_PASSWORD = "avengers"
WIFI_SIGNAL_MODE = wifi.PHYMODE_N


--- IP CONFIG (Leave blank to use DHCP) ---
ESP8266_IP=""
ESP8266_NETMASK=""
ESP8266_GATEWAY=""
-----------------------------------------------

--- Connect to the wifi network ---
wifi.setmode(wifi.STATION) 
wifi.setphymode(WIFI_SIGNAL_MODE)
wifi.sta.config(WIFI_SSID, WIFI_PASSWORD) 
wifi.sta.connect()

if ESP8266_IP ~= "" then
    wifi.sta.setip({ip=ESP8266_IP,netmask=ESP8266_NETMASK,gateway=ESP8266_GATEWAY})
end

-----------------------------------------------

--- Check the IP Address ---
print(wifi.sta.getip())
