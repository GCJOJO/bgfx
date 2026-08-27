project "bgfx"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")


    files
	{
		"src/**.h",
		"src/**.cpp",
		"include/**.h"
	}

	removefiles
	{
		"src/amalgamated.cpp"
	}

	includedirs
	{
		"include",
		"src",
		"3rdparty",
		"3rdparty/khronos",
		"3rdparty/directx-headers/include/directx",
		"%{IncludeDir.bx}",
		"%{IncludeDir.bimg}"
	}

	links
	{
		"bx",
		"bimg"
	}
	
	defines
	{
		"BX_CONFIG_DEBUG"
	}

	filter "system:windows"
		systemversion "latest"
		buildoptions { "/Zc:__cplusplus", "/Zc:preprocessor" }
        exceptionhandling "Off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
