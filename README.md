# a1mon68

This is [Eric Smith](https://github.com/brouhaha)'s faithful translation of the
[Apple-1](https://en.wikipedia.org/wiki/Apple_I) ROM monitor ([wozmon](https://www.sbprojects.net/projects/apple1/wozmon.php)) to the [Motorola
6800 (M6800) microprocessor](https://en.wikipedia.org/wiki/Motorola_6800).

See [YouTube demo](https://www.youtube.com/watch?v=Nh7qqymZeiQ) and blog posts ([#1](https://web.archive.org/web/20130115111836/http://whats.all.this.brouhaha.com/2011/07/18/demo-of-rewritten-apple-1-monitor-rom-for-6800-processor/), [#2](https://web.archive.org/web/20220705004052/http://whats.all.this.brouhaha.com/2011/07/18/apple-1mc6800-test-program/)).

## Building

1. Build and install the AS Macro Assembler <http://john.ccac.rwth-aachen.de:8000/as/>
2. Run `make`

## Compatibility

When making modifications, symbol addresses should generally be preserved in
order to maintain compatibility with any client software that makes use of the
monitor.

In particular, the following entry points are documented in the original [Apple-1
manual](http://apple1.chez.com/Apple1project/Docs/pdf/AppleI_Manual.pdf)
(_addresses shown here are for this 6800 version_):

| Symbol | Address | Description |
|--------|---------|-------------|
|GETLINE | $FF21   | monitor entry point _(jumping to $FF21 will enter monitor and echo carriage return. You can then examine memory locations with the monitor.)_ |
|ECHO    | $FFB4   | prints one byte (ASCII) _(data from ACC A, contents of ACC A not disturbed. Example: `BD FF B4` (`JSR ECHO`))_ |
|PRBYTE  | $FFA2   | prints one byte (HEX) _(data from ACC A, contents of ACC A disturbed.)_ |
|PRHEX   | $FFAA   | prints one hex digit _(data from four least significant bits of ACC A, contents of ACC A disturbed.)_ |

Use of RAM locations $24 to $2F are used by the monitor and should be
avoided by client software that makes use of the monitor.

_**NOTE**: This version of the monitor uses RAM locations $30 to $38 as
vectors for IRQ, SWI, and NMI interrupts, so use of these locations for other
purposes in user software must also be avoided if those interrupts may occur in
the system._

Refer to the assembly listing (`a1mon68.lst`) for additional symbol addresses.
