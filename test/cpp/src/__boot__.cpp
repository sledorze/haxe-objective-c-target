#include <hxcpp.h>

#include <haxe/Log.h>
#include <Test.h>
#include <Std.h>

void __boot_all()
{
hx::RegisterResources( hx::GetResources() );
::haxe::Log_obj::__register();
::Test_obj::__register();
::Std_obj::__register();
::haxe::Log_obj::__boot();
::Std_obj::__boot();
::Test_obj::__boot();
}

