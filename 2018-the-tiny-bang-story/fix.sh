#!/bin/sh -x

cd
cd ".steam/steam/SteamApps/common/The Tiny Bang Story"

test -e TTBS.bin && exit 20

mv -v TTBS TTBS.bin || exit 2

touch TTBS || exit 10
echo "#!/bin/sh" > TTBS
echo "LD_LIBRARY_PATH=. exec ./TTBS.bin" >> TTBS

chmod 755 TTBS || exit 3

echo Game fixed
