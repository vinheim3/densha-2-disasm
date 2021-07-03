OBJS = $(shell find code/ -name '*.s' | sed "s/code/build/" | sed "s/\.s/.o/")
RAM_OBJS = build/wram.o build/hram.o build/sram.o
GFX_OBJS = $(shell find gfx/ -name '*.png' | sed "s/gfx/build/" | sed "s/.png/.2bpp/")

all: densha2.gbc

build//bgAnimation_%.2bpp: gfx//bgAnimation_%.png
	rgbgfx -o $@ $< -x 6

build/%.2bpp: gfx/%.png
	rgbgfx -o $@ $<

build/%.o: code/%.s
	rgbasm -h -L -o $@ $<

build/wram.o: include/wram.s
	rgbasm -h -L -o $@ $<

build/hram.o: include/hram.s
	rgbasm -h -L -o $@ $<

build/sram.o: include/sram.s
	rgbasm -h -L -o $@ $<

densha2.gbc: $(GFX_OBJS) $(OBJS) $(RAM_OBJS)
	rgblink -n densha2.sym -m densha2.map -o $@ $(OBJS) $(RAM_OBJS)
	rgbfix -v -p 0 -C -i "B82J" -k "8M" -l 0x33 -m 0x1b -r 3 -t "DENSYADEGO2" $@

	md5 $@

clean:
	rm -f build/* densha2.gbc densha2.sym densha2.map
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' \) -exec rm {} +