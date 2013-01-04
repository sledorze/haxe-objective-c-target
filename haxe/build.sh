clear
make haxe
cd ..
echo " "
echo "Build CocoaTouch demo..."
echo " "
# ./haxe/haxe -main HelloWorld -cp demo -objc demo/objc

echo " "
echo "Build ObjC tests..."
echo " "
./haxe/haxe -main Tests --dce no -cp tests -objc tests/objc -objc-version 6 -objc-identifier org.haxe.ObjcTests --times
# ./haxe/haxe -main Tests -cp tests -as3 tests/as3
# ./haxe/haxe -main Tests -cp tests -php tests/php
# echo "Build Cpp tests..."
# ./haxe/haxe -main Tests -cp tests -cpp tests/cpp
# echo "Build CS tests..."
# ./haxe/haxe -main Tests -cp tests -cs tests/cs
# echo "Build Java tests..."
# ./haxe/haxe -main Tests -cp tests -java tests/java