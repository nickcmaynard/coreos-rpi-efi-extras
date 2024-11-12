# coreos-rpi-efi-extras

[![Release builds](https://github.com/nickcmaynard/coreos-rpi-efi-extras/actions/workflows/releases.yml/badge.svg)](https://github.com/nickcmaynard/coreos-rpi-efi-extras/actions/workflows/releases.yml)
[![Container image builds](https://github.com/nickcmaynard/coreos-rpi-efi-extras/actions/workflows/container-image.yml/badge.svg)](https://github.com/nickcmaynard/coreos-rpi-efi-extras/actions/workflows/container-image.yml)

This project contains files to assist with installing Fedora CoreOS <= 39 on a Raspberry Pi 4, per https://docs.fedoraproject.org/en-US/fedora-coreos/provisioning-raspberry-pi4/

NOTE: With Fedora 40, the instructions have changed.  With no evidence that this project is used, it shall not be updated further.  If you would like to take over maintenance, please raise an issue.

In essence, extra files need to be inserted into the coreos-installer EFI boot partition to make it boot.

You can build a ZIP of these files yourself (see source) or use the generated ZIP files hosted on Github.

NB. I originally wrote this to assist with installing an rpi3 - I don't have an rpi4.  I can't make the rpi3 boot work - something about the SD card structure created by coreos-installer isn't working with my rpi3.  Thus, here's the current status:
  * rpi4 - *should* work - please let me know if it does!
  * rpi3 - doesn't work for unknown reasons - please send a PR/doc updates if you can make it work!

## Usage
Several options exist (see below) - all will create a ZIP file for your chosen release, ie. `coreos-rpi-efi-extras_RELEASE.zip`.

Simply copy the *contents* of this ZIP file to the EFI partition on the disk you targeted with coreos-installer.

### Download the ZIP file for your CoreOS release
Nightly builds are here [Releases](https://github.com/nickcmaynard/coreos-rpi-efi-extras/releases).

### Container image - self-built
```sh
podman build . -t coreos-rpi-efi-extras
podman run -e RELEASE=<coreos_release> -v <destdir>:/output coreos-rpi-efi-extras
```

### Container image - pre-built
```sh
podman run -e RELEASE=<coreos_release> -v <destdir>:/output ghcr.io/nickcmaynard/coreos-rpi-efi-extras
```
