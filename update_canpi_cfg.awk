# Update canpi.cfg with values from buildroot defconfig file
#
#   21 June, 2020 - E M Thornber
#   Created
#
# canpi attribute   buildroot env
#   ap_ssid	    BR2_PACKAGE_CANPI_APSSID
#   ap_password	    BR2_PACKAGE_CANPI_APPASSWD
#   router_ssid	    BR2_PACKAGE_CANPI_RSSID
#   router_password BR2_PACKAGE_CANPI_RPASSWD
#   service_name    BR2_PACKAGE_CANPI_BSERVN
#
BEGIN {
    FS = "="
    AP_NO_PASSWD = "True"
    if ( length(APPASSWD) != 0 ) AP_NO_PASSWD = "False"
}
/ap_ssid=/ { print $1 FS "\""APSSID"\"" ; next }
# Force canpi mode to be WAP
/ap_mode=/ {print  $1 FS "\"True\"" ; next }
/ap_no_password=/ { print $1 FS "\""AP_NO_PASSWD"\"" ; next }
/ap_password=/ { print $1 FS "\""APPASSWD"\"" ; next }
/router_ssid=/ { print $1 FS "\""RSSID"\"" ; next }
/router_password=/ { print $1 FS "\""RPASSWD"\"" ; next }
/service_name=/ { print $1 FS "\""BSERVN"\"" ; next }

{ print $0 }
