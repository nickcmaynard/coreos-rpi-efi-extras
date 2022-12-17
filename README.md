# coreos-rpi-efi-extras
This project contains files to assist with installing Fedora CoreOS on a Raspberry Pi 3 or 4, per https://docs.fedoraproject.org/en-US/fedora-coreos/provisioning-raspberry-pi4/

In essence, extra files need to be inserted into the coreos-installer EFI boot partition to make it boot.

You can build a ZIP of these files yourself (see source) or use the generated ZIP files hosted on Github.

## Usage
Several options exist.

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
