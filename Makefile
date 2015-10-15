INSTALL_PATH = /usr/local

all: smc

smc: smc.o
	clang -framework IOKit -o smc smc.o

smc.o: smc.h smc.c
	clang -c smc.c

install: all
	install -d $(INSTALL_PATH)/bin
	install smc $(INSTALL_PATH)/bin/smc
	install -d $(INSTALL_PATH)/share/man/man1
	gzip -9 -c < smc.1 > $(INSTALL_PATH)/share/man/man1/smc.1.gz

clean:
	-rm -f smc smc.o
