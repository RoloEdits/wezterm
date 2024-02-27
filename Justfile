set shell := ["nu", "-c"]

default: build

path := "C:/Program Files/WezTerm"


build:
	git submodule update --init --recursive
	RUSTFLAGS='-C target-cpu=native' cargo build --release --all

[windows]
install:
	mkdir {{path}}
	cp -r target/release/mesa/ {{path}}/mesa/
	cp target/release/conpty.dll {{path}}/contpty.dll
	cp target/release/generate-bidi.exe {{path}}/generate-bidi.exe
	cp target/release/libEGL.dll {{path}}/libEGL.dll
	cp target/release/libGLESv2.dll {{path}}/libGLESv2.dll
	cp target/release/OpenConsole.exe {{path}}/OpenConsole.exe
	cp target/release/strip-ansi-escapes.exe {{path}}/strip-ansi-escapes.exe
	cp target/release/sync-color-schemes.exe {{path}}/sync-color-schemes.exe
	cp target/release/wezterm.exe {{path}}/wezterm.exe
	cp target/release/wezterm-gui.exe {{path}}/wezterm-gui.exe
	cp target/release/wezterm-mux-server.exe {{path}}/wezterm-mux-server.exe

clean:
	rm -r target/