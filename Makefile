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
	xmlstarlet ed \
		-N svg='http://www.w3.org/2000/svg' \
		-d '//*[@id="path5"]/@transform' \
		-d '//*[@id="path5"]/@stroke' \
		-u '//*[@id="path5"]/@style' \
			-v 'fill:#FFFFFF;stroke:none;' \
		-u '//*[@id="path5"]/@d' \
			-v 'M -2.8651769,8.6668 A 8.6668,8.6668 0 0 1 5.8016231,0 H 161.8039878 A 8.6668,8.6668 0 0 1 170.4707878,8.6668 V 234.0001922 A 8.6668,8.6668 0 0 1 161.8039878,242.6669922 H 5.8016231 A 8.6668,8.6668 0 0 1 -2.8651769,234.0001922 Z' \
		-u '/svg:svg/@width' -v '173.3359647pt' \
		-u '/svg:svg/@viewBox' -v '-2.8651769 0 173.3359647 242.6669922' \
		$< > $@

$(PNGOUT)/%.png: $(SVGOUT)/%.svg
	@mkdir -p $(dir $@)
	inkscape --export-type=png $< --export-filename=$@ --export-height=$(HEIGHT)

clean:
	rm -rf $(SVGOUT) $(PNGOUT)

.PHONY: clean svg png
