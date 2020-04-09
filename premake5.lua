project "GLFW"
    kind "StaticLib"
    language "C"
    targetdir ("bin/" .. outputdir .. "/GLFW")
    objdir ("bin-int/" .. outputdir .. "/GLFW")

    staticruntime "On"

    files
    {
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    }
    --Linux specific files (X11)
    --TODO: Add Windows support
    filter "system:linux"
        pic "On"

        systemversion "latest"

        files
        {
            "src/x11_init.c",
            "src/x11_monitor.c",
            "src/x11_window.c",
            "src/xkb_unicode.c",
            "src/posix_time.c",
            "src/posix_thread.c",
            "src/glx_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c",
            "src/linux_joystick.c"
        }

        defines "_GLFW_X11"

        filter "system:linux"
            pic "On"

        filter "configurations:Debug"
            runtime "Debug"
            symbols "On"
        filter "configurations:Release"
            runtime "Release"
            optimize "On"
