fix-coverart
============

Fixes missing coverart on following models:

  - NW-A50
    - A50Z mod
  - NW-A40
    - A50 mod
  - NW-A30
  - NW-ZX300
  - NW-WM1A
  - NW-WM1Z
  - DMP-Z1

Fix is already included in Walkman One.

## Install

Download exe from [releases](https://github.com/unknown321/fix-coverart/releases), run and follow instructions.

Device will restart twice.

### Linux/OSX

Linux:

- copy corresponding `NW_WM_FW.UPG` to root directory on device (the one with MUSIC directory)
- use [scsitool](https://www.rockbox.org/wiki/SonyNWDestTool.html):
  - `scsitool list_devices`
  - choose your device, I use `/dev/sg4`
  - `scsitool -d -s nw-a50 /dev/sg4 do_fw_upgrade` (may require root)
- device reboots, upgrades a little, reboots again and upgrades again (fully)


On OSX you'll have to build `scsitool` yourself or use virtual machine.

## Uninstall

Flash stock firmware, uninstaller does not work.

## Build from source

```shell
git submodule update --init --recursive
make -C nw-installer prepare
make release

# or something like that
```

## Other projects for these DAPs

[Wampy](https://github.com/unknown321/wampy) - interface addon with various skins and other enhancing functions

[Scrobbler](https://github.com/unknown321/scrobbler) - keeps tracks of played songs in .scrobbler.log for further
submission to Last.fm.
