# Raspberry Pi OS Setup Scripts

This contains bash scripts that can be used to setup a new headless 64-bit raspberry pi

<!-- links -->
[raspberry pi os lite 64-bit]: https://downloads.raspberrypi.org/raspios_lite_arm64/images/
[etcher]: https://www.balena.io/etcher/
[github ssh-keygen]: https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
[angry ip scanner]: https://angryip.org/download/#windows


# Steps
## Install Rasperberry Pi OS lite 64bit
Steps for installing the raspberry pi os lite 64-bit OS on the microSD card for the pi device.

1. Get the `img` from [Here][raspberry pi os lite 64-bit].
2. Use [etcher][etcher] to flash the micro SD card for the pi device.

Removed the SD card and plug back into computer to see the boot drive in windows explorer.

## Headless Setup (SSH Accress)
### Setup wifi 
You can pre-configure wifi for the device so that you don't need to attach a monitor and keyboard to set it up.

1. Create a file called `wpa_supplicant.conf`.
2. add the following
```conf
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=«your_ISO-3166-1_two-letter_country_code»
network={
     ssid="«your_SSID»"
     psk="«your_PSK»"
     key_mgmt=WPA-PSK
}
```
Replace SSID and password.
3. Save this file into the root of the boot drive on SD card.


### Turn on SSH
Creat an empty file called `SSH` and leave it in the root of the boot dir for the new SD card. This will get noticed on boot and turn on SSH. THe file will then be deleted.

### Get IP of device
I used the [Angry IP Scanner Tool][angry ip scanner] to get the local IP for the raspberry pi device.

You can also use the `ping` command in bash or powershell
```shell
ping raspberrypi.local 
# this gave me IPv6 address in PowerShell
```
or
```shell
ping raspberrypi.lan
# this gave me IPv4 address in PowerShell
```

### Test Remote Connection
Connect to the pi device using `SSH pi@raspberrypi.local` or use the IP of the device on the local network.

## Generate SSH Keys
Follow the good guide on GitHub [here][github ssh-keygen]