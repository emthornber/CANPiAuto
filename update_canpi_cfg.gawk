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
    if ( length(ENVIRON["BR2_PACKAGE_CANPI_APPASSWD"]) != 0 ) AP_NO_PASSWD = "False"
}
/ap_ssid/ { $2 = "\""ENVIRON["BR2_PACKAGE_CANPI_APSSID"]"\"" }
# Force canpi mode to be WAP
/ap_mode/ { $2 = "\"True\"" }
/ap_no_password/ { $2 = "\""AP_NO_PASSWD"\"" }
/ap_password/ { $2 = "\""ENVIRON["BR2_PACKAGE_CANPI_APPASSWD"]"\"" }
/router_ssid/ { $2 = "\""ENVIRON["BR2_PACKAGE_CANPI_RSSID"]"\"" }
/router_password/ { $2 = "\""ENVIRON["BR2_PACKAGE_CANPI_RPASSWD"]"\"" }
/service_name/ { $2 = "\""ENVIRON["BR2_PACKAGE_CANPI_BSERVN"]"\"" }

{ print $1 "=" $2 }
