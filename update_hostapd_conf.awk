# Update hostapd.conf with values from buildroot defconfig file
#
#   23 June, 2020 - E M Thornber
#   Created
#
# hostapd attribute   buildroot env
#   ssid		BR2_PACKAGE_CANPI_APSSID
#   wpa_passphrase	BR2_PACKAGE_CANPI_APPASSWD
#   channel		6 (hard coded as per initial-setup.sh)
#
BEGIN {
    FS = "="
}
/ssid=/ { print $1 FS "\""APSSID"\"" ; next }
/wpa_passphrase=/ { print $1 FS "\""APPASSWD"\"" ; next }
/channel=/ { print $1 FS "6" ; next }

{ print $0 }
