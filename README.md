# poor-mans-paper-keys

A way to save your GPG keys on paper

# Print

```
xxd -p export.asc > print.txt
```
Generate checksums:

```
./checksum.txt print.txt
```

# Restore

Take a clear photo with your smartphone or use a hardware scanner

1. Scan it:

```
tesseract -c tessedit_char_whitelist=0123456789abcdef scanned.jpg scanned
```
Alternatively, you can use gocr, but it works best with the hardware scans. Smartphone photos will produce up to 50% inaccuracy

```
gocr -C "0-9a-f" -u "____" -a 98 scanned.jpg > scanned.txt
```

Do the same with checksums or type them in manually.

2. Verify

It may be challenging to read all the characters back. But we will use tiny checksums to help you identify which line needs to be fixed manually:

```
./verify.sh scanned.txt
```

3. Revert to bytes:

```
xxd -r -p scanned.txt > export.asc
```

# Example

See example dir for a real case print-scan-restore example.



