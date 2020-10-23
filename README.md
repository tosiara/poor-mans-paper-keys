# Poor man's paper keys

A way to save your GPG keys on paper.

# Print

```
xxd -p export.asc > print.txt
```
Generate checksums:

```
./checksum.txt print.txt
```
Use your favorite text editor to print two files using monospace font: `print.txt` and `print.txt.checksum`.

# Restore

## Take a clear photo with your smartphone or use a hardware scanner

## Scan

```
tesseract -c tessedit_char_whitelist=0123456789abcdef scanned.jpg scanned
```
Alternatively, you can use gocr, but it works best with the hardware scans. Smartphone photos will produce up to 50% inaccuracy

```
gocr -C "0-9a-f" -u "____" -a 98 scanned.jpg > scanned.txt
```

Do the same with checksums or type them in manually.

## Verify

It may be challenging to read all the characters back. But we will use tiny checksums to help you identify which line needs to be fixed manually:

```
./verify.sh scanned.txt
```

## Restore

```
xxd -r -p scanned.txt > export.asc
```

# Example

See example dir for a real case print-scan-restore example.



