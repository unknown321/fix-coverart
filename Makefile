PRODUCT=fix-coverart

build: nw-installer/installer/userdata.tar.gz nw-installer/installer/userdata.uninstaller.tar.gz
	$(MAKE) -C nw-installer OUTFILE=$(PRODUCT).exe APPNAME=$(PRODUCT) build win

nw-installer/installer/userdata.tar.gz:
	tar -czf $@ run.sh

nw-installer/installer/userdata.uninstaller.tar.gz:
	tar -czf $@ run.sh

clean:
	$(MAKE) -C nw-installer clean
	rm -rf release

release: build
	mkdir -p release/installer/
	cd nw-installer/installer/a50z/ && tar -czvf ../../../release/installer/a50z.tar.gz NW_WM_FW.UPG
	cd nw-installer/installer/nw-a40/ && tar -czvf ../../../release/installer/nw-a40.tar.gz NW_WM_FW.UPG
	cd nw-installer/installer/nw-a50/ && tar -czvf ../../../release/installer/nw-a50.tar.gz NW_WM_FW.UPG
	cd nw-installer/installer/nw-wm1a/ && tar -czvf ../../../release/installer/nw-wm1az.tar.gz NW_WM_FW.UPG
	cd nw-installer/installer/nw-zx300/ && tar -czvf ../../../release/installer/nw-zx300.tar.gz NW_WM_FW.UPG
	cd nw-installer/installer/walkmanOne/ && tar -czvf ../../../release/installer/walkmanOne.tar.gz NW_WM_FW.UPG
	mv nw-installer/installer/windows/$(PRODUCT).exe release/installer/$(PRODUCT).$(shell date --iso).$(shell git log -1 --format=%h).exe	

.DEFAULT_GOAL := build

.PHONY: release clean build
