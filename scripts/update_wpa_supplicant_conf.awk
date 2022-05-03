# Update wpa_supplicant.conf with values from buildroot defconfig file
#
#   23 June, 2020 - E M Thornber
#   Created
#
# wpa attribute   buildroot env
#   ssid	    BR2_PACKAGE_CANPI_RSSID
#   psk		    BR2_PACKAGE_CANPI_RPASSWD
#
BEGIN {
    FS = "="
}
/ssid=/ { print $1 FS "\""RSSID"\"" ; next }
/psk=/ { print $1 FS "\""RPASSWD"\"" ; next }

{ print $0 }
