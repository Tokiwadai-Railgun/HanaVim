local config = require 'colorsheme.nier-light.config'

local function get_colors()
    local colorscheme = {
        standardWhite = '#ffffff',
        standardBlack = '#1e1e1e',
    }

    -- Prioritize config.theme if set, otherwise follow vim.o.background
    local bg_mode = config.theme or vim.o.background

    if bg_mode == 'light' then
        colorscheme.editorBackground = config.transparent and 'none' or '#dad4bb'
        colorscheme.sidebarBackground = '#4e4b42'
        colorscheme.popupBackground = '#dad4bb'
        colorscheme.floatingWindowBackground = '#e0e0e0'
        colorscheme.menuOptionBackground = '#ededed'

        colorscheme.mainText = '#504d44'
        colorscheme.emphasisText = '#FF0000'
        colorscheme.commandText = '#333333'
        colorscheme.inactiveText = '#9e9e9e'
        colorscheme.disabledText = '#d0d0d0'
        colorscheme.lineNumberText = '#a1a1a1'
        colorscheme.selectedText = '#424242'
        colorscheme.inactiveSelectionText = '#757575'

        colorscheme.windowBorder = '#504d44'
        colorscheme.focusedBorder = '#4e4b42'
        colorscheme.emphasizedBorder = '#FF0000'

        colorscheme.syntaxFunction = '#6871ff'
        colorscheme.syntaxError = '#d6656a'
        colorscheme.syntaxKeyword = '#9966cc'
        colorscheme.errorText = '#d32f2f'
        colorscheme.warningText = '#f29718'
        colorscheme.linkText = '#1976d2'
        colorscheme.commentText = '#848484'
        colorscheme.stringText = '#286983'
        colorscheme.successText = '#22863a'
        colorscheme.warningEmphasis = '#cd9731'
        colorscheme.specialKeyword = '#800080'
        colorscheme.syntaxOperator = '#a1a1a1'
        colorscheme.foregroundEmphasis = '#000000'
        colorscheme.terminalGray = '#333333'
    else
        colorscheme.editorBackground = config.transparent and 'none' or '#0000FF'
        colorscheme.sidebarBackground = '#151515'
        colorscheme.popupBackground = '#252525'
        colorscheme.floatingWindowBackground = '#2a2a2a'
        colorscheme.menuOptionBackground = '#303030'

        colorscheme.mainText = '#dadada'
        colorscheme.emphasisText = '#ffffff'
        colorscheme.commandText = '#e0e0e0'
        colorscheme.inactiveText = '#666666'
        colorscheme.disabledText = '#444444'
        colorscheme.lineNumberText = '#555555'
        colorscheme.selectedText = '#eeeeee'
        colorscheme.inactiveSelectionText = '#444444'

        colorscheme.windowBorder = '#333333'
        colorscheme.focusedBorder = '#555555'
        colorscheme.emphasizedBorder = '#444444'

        colorscheme.syntaxError = '#ff7a84'
        colorscheme.syntaxFunction = '#79b8ff'
        colorscheme.warningText = '#ff9800'
        colorscheme.syntaxKeyword = '#b392f0'
        colorscheme.linkText = '#9db1c5'
        colorscheme.stringText = '#286983'
        colorscheme.warningEmphasis = '#cd9731'
        colorscheme.successText = '#22863a'
        colorscheme.errorText = '#cd3131'
        colorscheme.specialKeyword = '#800080'
        colorscheme.commentText = '#6b737c'
        colorscheme.syntaxOperator = '#bbbbbb'
        colorscheme.foregroundEmphasis = '#ffffff'
        colorscheme.terminalGray = '#5c5c5c'
    end

    return colorscheme
end

local M = {}
setmetatable(M, {
    __index = function(_, key)
        return get_colors()[key]
    end
})

return M
