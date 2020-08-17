CFLAGS = -g -O2 -shared -fPIC -Wall -pedantic
LDFLAGS = -lSoundTouch

all: app_cenvoicechanger.so

app_cenvoicechanger.so: app_cenvoicechanger.o voicechanger.o
	g++ $(CFLAGS) -o $@ $^ $(LDFLAGS)

app_cenvoicechanger.o: app_cenvoicechanger.c
	gcc $(CFLAGS) --std=gnu99 -c -o $@ $<

voicechanger.o: voicechanger.cpp
	g++ $(CFLAGS) -c -o $@ $<

install: all
	cp -av app_cenvoicechanger.so /usr/lib/asterisk/modules/

clean:
	rm -f *.o *.so
