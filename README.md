# PNG & SVG Playing Cards

Public domain playing card assets.

* [Playing Card Source](https://code.google.com/p/vector-playing-cards/)
* [Card Back Source](https://commons.wikimedia.org/wiki/File:Tiled_blue_broken_line_rhombus_card_back.svg)

Mildly processed to remove the borders and correct the cards to a standard poker aspect ratio with correct rounded corner radius. Also included a version of the aces without the fake specular highlights. Requires xmlstarlet to process the svgs and inkscape to render them.

```
make -j svg && make png
```

Change png height with `make png HEIGHT=1024`

Inkscape can't run in parallel because of DBUS.

Forked from https://github.com/hayeah/playing-cards-assets. The original build pipeline and asset processing have been fully rewritten with an up to date Inkscape-based workflow.
