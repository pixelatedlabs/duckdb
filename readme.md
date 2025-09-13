<!-- This is free and unencumbered software released into the public domain. -->

<picture>
	<source media="(prefers-color-scheme: light)" srcset="https://raw.github.com/duckdb/duckdb/f8761864efe92a157a0248bea3fb7446de13489a/logo/DuckDB_Logo-horizontal.png">
	<source media="(prefers-color-scheme: dark)" srcset="https://raw.github.com/duckdb/duckdb/f8761864efe92a157a0248bea3fb7446de13489a/logo/DuckDB_Logo-horizontal-dark-mode.png">
	<img alt="DuckDB logo" src="https://raw.github.com/duckdb/duckdb/f8761864efe92a157a0248bea3fb7446de13489a/logo/DuckDB_Logo-horizontal.png">
</picture>
<br>
<br>
<div align=center>
	<!--
		Place the closing '</a>' tags on the parent's line to prevent the link highlights from being
		extended past the images.
	-->
	<a href=https://github.com/pixelatedlabs/duckdb/releases/latest>
		<img alt=Release src=https://img.shields.io/github/v/release/pixelatedlabs/duckdb?style=for-the-badge></a>
	&nbsp;
	<a href=https://github.com/pixelatedlabs/duckdb/blob/master/license.txt>
		<img alt=License src=https://img.shields.io/github/license/pixelatedlabs/duckdb?style=for-the-badge></a>
</div>
<br>

Scripts to build the DuckDB bundle in such a way as to allow it to be statically linked into Zig
applications.

> The released bundle is intended for use in internal projects and therefore may build DuckDB with
> configurations that are not optimal for external projects. If you'd like to use this in your own
> project it's recommended to fork this repository rather than rely on it directly.

# Installation

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

# Releasing

To build and release a new version of the bundle follow these steps.

> All steps must be completed in order - missing any or doing them out of order may result in
> bundles being created with the wrong versions or added to the wrong releases.

- Update the DuckDB and/or Zig versions in the [workflow file](.github/workflows/build.yml)
- PR the above changes into master
- Manually create a new release - the name is not significant but by convention is recommended to be
  `<zig_version>-<duckdb_version>`, for example `0.15.1-1.3.2`
- The workflow will automatically build the bundle and add it to the release - expect this process
  to take about an hour

# References

This project was made possible by:

- [github.com/duckdb/duckdb](https://github.com/duckdb/duckdb)
- [github.com/karlseguin/zuckdb.zig](https://github.com/karlseguin/zuckdb.zig)

# License

This is free and unencumbered software released into the public domain.
