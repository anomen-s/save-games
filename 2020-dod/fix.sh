
cd ~/.local/share/Steam/SteamApps/common/Half-Life

mv libgcc_s.so.1 libgcc_s.so.X
ln -s /usr/lib/gcc/x86_64-pc-linux-gnu/9.2.0/32/libgcc_s.so.1

mv libstdc++.so.6 libstdc++.so.X
ln -s /usr/lib/gcc/x86_64-pc-linux-gnu/9.2.0/32/libstdc++.so.6
