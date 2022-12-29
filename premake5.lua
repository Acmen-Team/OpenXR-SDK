project "OpenXR-Loader"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/loader/**.h",
        "src/loader/**.hpp",
        "src/loader/**.c",
		"src/loader/**.cpp",
		
		"include/**.h",
        "src/xr_generated_dispatch_table.h",
        "src/xr_generated_dispatch_table.c",
        "src/common/**.**",
        "src/external/jsoncpp/src/lib_json/**.h",
        "src/external/jsoncpp/src/lib_json/**.inl",
        "src/external/jsoncpp/src/lib_json/**.cpp",
	}

    includedirs
	{
		"include/",
        "src/common/",
        "src/external/jsoncpp/include/",
        "src/",
	}
    

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "off"

        defines
		{
			"XR_USE_GRAPHICS_API_OPENGL",
			"XR_OS_WINDOWS",
			"XR_USE_PLATFORM_WIN32",
			-- "DK_RENDER_VULKAN"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
