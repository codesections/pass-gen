.PHONY : install
install : 
	install -m 0644 -v ./man/pass-gen.1 /usr/local/share/man/man1/pass-gen.1 
	install -m 0755 -v ./pass-gen /usr/local/bin/pass-gen
	install -d /usr/local/lib/pass-gen
	install -d /usr/local/share/zsh/site-functions
	cp -r ./character-lists /usr/local/lib/pass-gen
	cp -r ./wordlists /usr/local/lib/pass-gen

.PHONY : uninstall
uninstall :
	rm -f /usr/local/bin/pass-gen
	rm -rf /usr/local/lib/pass-gen
	rm -f /usr/local/share/man/man1/pass-gen.1
