-- config.lua
application = {
    content = {
        width = 320,
        height = 480,
        scale = "zoomEven", -- Автоматически растягивает контент на весь экран без полос
        fps = 60,
        
        imageSuffix = {
            ["@2x"] = 2,
            ["@4x"] = 4,
        },
    },
}
