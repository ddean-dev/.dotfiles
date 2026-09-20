SHELL=/bin/sh

.DEFAULT_GOAL := src/target/release/wowlua_ls
.PHONY: update install

src:
	@git clone https://github.com/TradeSkillMaster/wowlua-ls src

update: src
	@cd src && git pull

src/target/release/wowlua_ls: update
	@cd src && cargo build --release

install: src/target/release/wowlua_ls
	@sudo install -Dm755 src/target/release/wowlua_ls /usr/bin/wowlua_ls
