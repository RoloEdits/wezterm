set shell := ["nu", "-c"]

build:
	git submodule update --init --recursive
	RUSTFLAGS='-C target-cpu=native' cargo build --release --all