.PHONY: build	install add_desktop_entry

build:
	xmonad --recompile

install: add_desktop_entry
	stack install

add_desktop_entry:
	sudo cp ~/.dotfiles/config/xmonad/xmonad-custom.desktop /usr/share/xsessions
