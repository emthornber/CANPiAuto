# Update hostapd.conf with values from buildroot
# defconfig file
#
#   09 July, 2020 - E M Thornber
#   Created
#
# avahi attribute   buildroot env
#   servername		BR2_PACKAGE_CANPI_BSERVN
#   port		tcpport in canpi.cfg
#
BEGIN {
    FS = "="
}
/SERVICENAME/ { sub(/SERVICENAME/, BSERVN) }
/PORT/ { sub(/PORT/, BPORT) }

{ print $0 }
