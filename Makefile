deploy:
	nix build .#darwinConfigurations.mf-3949-mm01.system \
	   --extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#mf-3949-mm01
