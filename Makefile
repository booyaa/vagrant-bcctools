.PHONY: clean
clean:
	vagrant destroy

.PHONY: setup
setup:
	vagrant up
	@echo "use 'vagrant ssh' to connect"