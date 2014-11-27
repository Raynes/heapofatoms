# Heap of Atoms

Heap of Atoms is a plugin for pasting your awesome stuff to refheap.

Two commands: create a paste, create a private paste

You can probably figure out what they do. If you have something selected, that
gets pasted otherwise the entire buffer.

One thing you might not expect is that Heap of Atoms doesn't actually use the
grammar you have specified, it simply passes the file extension you're editing
on to refheap. The reason for this is because not all of the grammar names
match what refheap expects and sans a mapping of all of them to the Refheap
names.
