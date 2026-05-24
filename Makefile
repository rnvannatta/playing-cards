# DBUS BRINGS DBUGS :(
.NOTPARALLEL: png

HEIGHT=512

SVGIN=svg-cards
SVGOUT=svg-out
PNGOUT=png-out

SVGIN_FILES=$(wildcard svg-cards/*.svg)
SVGOUT_FILES=$(patsubst $(SVGIN)/%,$(SVGOUT)/%,$(SVGIN_FILES))
PNGOUT_FILES=$(patsubst $(SVGOUT)/%.svg,$(PNGOUT)/%.png,$(SVGOUT_FILES))

png: $(PNGOUT_FILES)
svg: $(SVGOUT_FILES)

$(SVGOUT)/%.svg: $(SVGIN)/%.svg
	@mkdir -p $(dir $@)
	xmlstarlet edit \
  -i '//_:path[@id="path5"]' -t attr -n stroke -v none \
  -u '//_:path[@id="path5"]/@stroke' -v none $< > $@

$(PNGOUT)/%.png: $(SVGOUT)/%.svg
	@mkdir -p $(dir $@)
	inkscape --export-type=png $< --export-filename=$@ --export-height=$(HEIGHT)

clean:
	rm -rf $(SVGOUT) $(PNGOUT)

.PHONY: clean svg png
