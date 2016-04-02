------------------------------------------
--- Author: Pradeep Singh
--- Date: 2nd April 2016
--- Version: 1.0
--- NodeMCU Firmware: nodemcu_float_0.9.6-dev_20150704.bin
--- Description: This is sample code to list all available WiFi Networks
------------------------------------------

-----------------------------------------------
--- Set Variables ---
-----------------------------------------------
--- AP Search Params ---
ap_list_cfg={}
--- Enter SSID, use nil to list all SSIDs ---
ap_list_cfg.ssid=nil
--- Enter BSSID, use nil to list all SSIDs ---
ap_list_cfg.bssid=nil
--- Enter Channel ID, use 0 to list all channels ---
ap_list_cfg.channel=0
--- Use 0 to skip hidden networks, use 1 to list them ---
ap_list_cfg.show_hidden=1

--- AP Table Format ---
--- 1 for Output table format - (BSSID : SSID, RSSI, AUTHMODE, CHANNEL)
--- 0 for Output table format - (SSID : AUTHMODE, RSSI, BSSID, CHANNEL)
ap_list_table_format = 1

-----------------------------------------------

--- Print Output ---
function print_AP_List(ap_table)
      for p,q in pairs(ap_table) do
        print(p.." : "..q)
      end
end

--- Call Get AP Method ---
wifi.sta.getap(ap_list_cfg,ap_list_table_format, print_AP_List)
-----------------------------------------------
