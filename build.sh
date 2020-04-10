#!/bin/bash -e

export VERSION="$(cat VERSION)"

git log --no-walk --tags --pretty="liteshort (%S) unstable; urgency=medium%n%n  * See the full changelog at:%n  * https://github.com/132ikl/liteshort/releases/tag/v%S%n%n -- Steven Spangler <132@ikl.sh>  %cD%n" --decorate=off | sed 's/(v/(/g' | sed 's/\/v/\//g' > debian/changelog

dpkg-buildpackage -us -uc --build=all
