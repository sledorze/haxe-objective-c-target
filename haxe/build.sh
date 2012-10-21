clear
make haxe
cd ..
echo " "
echo "Build the test project..."
echo " "
./haxe/haxe -main Main -cp test -objc test/objc
# haxe compile.hxml