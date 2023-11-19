export CC := "clang"
export CXX := "clang++"

cflags := "-march=native -O3 -flto=full"

export CFLAGS := cflags
export CXXFLAGS := cflags

export RUSTFLAGS := "-Ctarget-cpu=native -Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld -Cllvm-args=-enable-dfa-jump-thread -Clink-args=-Wl,--icf=all"

default: build

build: submodule-update
	cargo +nightly build -Zbuild-std --release --bin wezterm --bin wezterm-gui --bin wezterm-mux-server

install:
	cp -f target/release/wezterm ~/.local/opt/wezterm/
	cp -f target/release/wezterm-gui ~/.local/opt/wezterm/
	cp -f target/release/wezterm-mux-server ~/.local/opt/wezterm/

submodule-update:
	git submodule update --init --recursive
