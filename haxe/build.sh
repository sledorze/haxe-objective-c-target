clear
make haxe
cd ..
echo " "
echo "Build the HelloWorld project..."
echo " "
./haxe/haxe -main HelloWorld -cp test -objc test/objc
# haxe compile.hxml