<!-- This is free and unencumbered software released into the public domain. -->

<picture>
	<source media="(prefers-color-scheme: light)" srcset="https://raw.github.com/duckdb/duckdb/f8761864efe92a157a0248bea3fb7446de13489a/logo/DuckDB_Logo-horizontal.png">
	<source media="(prefers-color-scheme: dark)" srcset="https://raw.github.com/duckdb/duckdb/f8761864efe92a157a0248bea3fb7446de13489a/logo/DuckDB_Logo-horizontal-dark-mode.png">
	<img alt="DuckDB logo" src="https://raw.github.com/duckdb/duckdb/f8761864efe92a157a0248bea3fb7446de13489a/logo/DuckDB_Logo-horizontal.png">
</picture>

<br>
<div align=center>
	<!--
		Place the closing '</a>' tags on the parent's line to prevent the link highlights from being
		extended past the images.
	-->
	<a href=https://github.com/pixelatedlabs/headcheck/releases/latest>
		<img alt=Release src=https://img.shields.io/github/v/release/pixelatedlabs/headcheck?style=for-the-badge></a>
	&nbsp;
	<a href=https://ziglang.org>
		<img alt=Language src=https://img.shields.io/github/languages/top/pixelatedlabs/headcheck?style=for-the-badge></a>
	&nbsp;
	<a href=https://github.com/pixelatedlabs/headcheck/blob/master/license.txt>
		<img alt=License src=https://img.shields.io/github/license/pixelatedlabs/headcheck?style=for-the-badge></a>
</div>
<br>

Scripts to build the DuckDB bundle in such a way as to allow it to be statically linked into Zig
applications.

> This project is intended for use in internal projects and therefore may build DuckDB with
configurations that are not optimal for external projects. If you'd like to use this in your own
project it's recommended to fork this repository rather than rely on it directly.

# Install

Download the appropriate release and place the extracted files in a `lib` directory next to your
`build.zig`, then add this snippet to statically link the library.

```zig
// Assumes an existing 'exe' executable step.
exe.linkSystemLibrary("duckdb");
exe.linkSystemLibrary("stdc++");
exe.addLibraryPath(b.path("lib/"));
```

DuckDB can then be called from your Zig code, either through `cImport` or via a wrapper library such
as [zuckdb](https://github.com/karlseguin/zuckdb.zig).

# References

- [github.com/duckdb/duckdb](https://github.com/duckdb/duckdb)
- [github.com/karlseguin/zuckdb.zig](https://github.com/karlseguin/zuckdb.zig)

# License

This is free and unencumbered software released into the public domain.
