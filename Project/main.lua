-- main.lua
display.setStatusBar(display.HiddenStatusBar)

local myWebView

local function createWebView()
    if myWebView then
        myWebView:removeSelf()
        myWebView = nil
    end

    local width = display.contentWidth - (display.screenOriginX * 2)
    local height = display.contentHeight - (display.screenOriginY * 2)

    myWebView = native.newWebView(
        display.contentCenterX, 
        display.contentCenterY, 
        width, 
        height
    )

    if myWebView.setNativeProperty then
        -- ОТКЛЮЧАЕМ УВЕЛИЧЕНИЕ И УМЕНЬШЕНИЕ ПАЛЬЦАМИ (ЗУМ)
        myWebView:setNativeProperty( "setBuiltInZoomControls", false )

        -- Разрешаем доступ к локальным файлам
        myWebView:setNativeProperty( "setAllowFileAccess", true )
        myWebView:setNativeProperty( "setAllowFileAccessFromFileURLs", true )
        myWebView:setNativeProperty( "setAllowUniversalAccessFromFileURLs", true )
    end

    myWebView:request( "index.html", system.ResourceDirectory )
end

createWebView()

local function onOrientationChange(event)
    timer.performWithDelay( 10, createWebView )
end
Runtime:addEventListener("orientation", onOrientationChange)
