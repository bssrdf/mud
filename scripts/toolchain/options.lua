-- mud toolchain
-- options

newoption {
    trigger = "cpp-modules",
    description = "Use C++ experimental modules",
}

newoption {
    trigger = "as-libs",
    description = "Generate separate mud libraries",
}

newoption {
    trigger = "webgl2",
    description = "Use WebGL 2.0",
}

newoption {
    trigger = "webshaderc",
    description = "Use shaderc compiler on web",
}

newoption {
    trigger = "sound",
    description = "Build mud library with Sound.",
}

--newoption {
--    trigger = "renderer",
--    --value = "toolset",
--    description = "UI renderer",
--    allowed = {
--        { "bgfx",   "bgfx UI renderer"      },
--        { "gl",     "OpenGL UI renderer"    },
--    },
--}

newoption {
    trigger = "renderer-bgfx",
    description = "Use bgfx UI renderer",
}

newoption {
    trigger = "renderer-gl",
    description = "Use ",
}

newoption {
    trigger = "context-native",
    description = "Use native context",
}

newoption {
    trigger = "context-glfw",
    description = "Use GLFW context",
}

newoption {
    trigger = "context-wasm",
    description = "Use html5 context",
}

newoption {
    trigger = "context-ogre",
    description = "Use Ogre context",
}

newoption {
    trigger = "vg-vg",
    description = "Use vg-renderer",
}

newoption {
    trigger = "vg-nanovg",
    description = "Use NanoVG",
}

function default_options()
    if _OPTIONS["cpp-modules"] then
        _OPTIONS["as-libs"] = ""
    end

    if not _OPTIONS["renderer-gl"] and not _OPTIONS["renderer-bgfx"] then
        _OPTIONS["renderer-bgfx"] = ""
    end

    if not _OPTIONS["context-native"] and not _OPTIONS["context-glfw"] and not _OPTIONS["context-ogre"] then
        if _OPTIONS["vs"] ~= "asmjs" then
            _OPTIONS["context-glfw"] = ""
        else
            _OPTIONS["context-wasm"] = ""
        end
    end

    if _OPTIONS["renderer-gl"] then
        _OPTIONS["vg-nanovg"] = ""
    end

    if not _OPTIONS["vg-vg"] and not _OPTIONS["vg-nanovg"] then
        _OPTIONS["vg-vg"] = ""
    end
end
