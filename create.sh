#!/usr/bin/env bash
set -euo pipefail

validate_root_txt() {
	local root_txt="$1"

	if [ ! -f "$root_txt" ]; then
		echo "Error: root.txt not found at $root_txt" >&2
		return 1
	fi

	local expected="This directory is the root of the category-theory-scrap project."
	local actual
	actual="$(sed '/^$/d' "$root_txt")"

	if [ "$actual" != "$expected" ]; then
		echo "Error: root.txt content does not match expected content." >&2
		echo "Expected: $expected" >&2
		echo "Actual:   $actual" >&2
		return 1
	fi
}

create_fig() {
	local dir_name="$1"
	local script_dir
	script_dir="$(cd "$(dirname "$0")" && pwd)"

	validate_root_txt "$script_dir/root.txt"

	local template="$script_dir/.template/fig.typ"
	if [ ! -f "$template" ]; then
		echo "Error: .template/fig.typ not found at $template" >&2
		return 1
	fi

	local target_dir="$script_dir/$dir_name"
	local target_file="$target_dir/fig.typ"

	if [ -f "$target_file" ]; then
		echo "Error: $target_file already exists." >&2
		return 1
	fi

	mkdir -p "$target_dir"
	cp "$template" "$target_file"
	echo "Created $target_file"
}

main() {
	if [ $# -ne 1 ]; then
		echo "Usage: $0 <directory-name>" >&2
		exit 1
	fi

	create_fig "$1"
}

main "$@"

