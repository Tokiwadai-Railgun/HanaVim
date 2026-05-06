local config = require 'colorsheme.nier-light.config'

local function get_colors()
    local colorscheme = {
        standardWhite = '#f2efdf',
        standardBlack = '#1a1917',
    }

    local bg_mode = config.theme or vim.o.background

    if bg_mode == 'light' then
        -- The iconic "Beige/Sand" UI
        colorscheme.editorBackground = config.transparent and 'none' or '#dad4bb'
        colorscheme.sidebarBackground = '#4e4b42'
        colorscheme.popupBackground = '#cec8af'
        colorscheme.floatingWindowBackground = '#c4beaa'
        colorscheme.menuOptionBackground = '#b8b29c'

        colorscheme.mainText = '#4e4b42'
        colorscheme.emphasisText = '#9d312f' -- YorHa Red
        colorscheme.commandText = '#3b3932'
        colorscheme.inactiveText = '#918c7d'
        colorscheme.disabledText = '#bab5a1'
        colorscheme.lineNumberText = '#9e9985'
        colorscheme.selectedText = '#3b3932'
        colorscheme.inactiveSelectionText = '#8b8675'

        colorscheme.windowBorder = '#4e4b42'
        colorscheme.focusedBorder = '#3b3932'
        colorscheme.emphasizedBorder = '#9d312f'

        -- Syntax (Muted and Earthy)
        colorscheme.syntaxFunction = '#6b7a84'
        colorscheme.syntaxError = '#9d312f'
        colorscheme.syntaxKeyword = '#7a7561'
        colorscheme.errorText = '#9d312f'
        colorscheme.warningText = '#c8923a'
        colorscheme.linkText = '#5a7b8c'
        colorscheme.commentText = '#918c7d'
        colorscheme.stringText = '#7a8c6e'
        colorscheme.successText = '#6d8c6b'
        colorscheme.warningEmphasis = '#c8923a'
        colorscheme.specialKeyword = '#4e4b42'
        colorscheme.syntaxOperator = '#4e4b42'
        colorscheme.foregroundEmphasis = '#1a1917'
        colorscheme.terminalGray = '#5e5a4f'
    else
        colorscheme.editorBackground = config.transparent and 'none' or '#504d44'
        colorscheme.sidebarBackground = '#121211'
        colorscheme.popupBackground = '#252421'
        colorscheme.floatingWindowBackground = '#2a2926'
        colorscheme.menuOptionBackground = '#33312c'

        colorscheme.mainText = '#dad4bb'
        colorscheme.emphasisText = '#f2efdf'
        colorscheme.commandText = '#bab5a1'
        colorscheme.inactiveText = '#5e5a4f'
        colorscheme.disabledText = '#3b3932'
        colorscheme.lineNumberText = '#85806d'
        colorscheme.selectedText = '#ffffff'
        colorscheme.inactiveSelectionText = '#3b3932'

        colorscheme.windowBorder = '#3b3932'
        colorscheme.focusedBorder = '#bab5a1'
        colorscheme.emphasizedBorder = '#9d312f'

        colorscheme.syntaxError = '#f06262'
        colorscheme.syntaxFunction = '#8db1bd' -- Pale Cyan
        colorscheme.warningText = '#e8b862'
        colorscheme.syntaxKeyword = '#c0b9a0'
        colorscheme.linkText = '#8db1bd'
        colorscheme.stringText = '#99ab8a'
        colorscheme.warningEmphasis = '#c8923a'
        colorscheme.successText = '#8fb58d'
        colorscheme.errorText = '#9d312f'
        colorscheme.specialKeyword = '#c0b9a0'
        colorscheme.commentText = '#a09b8a'
        colorscheme.syntaxOperator = '#bab5a1'
        colorscheme.foregroundEmphasis = '#f2efdf'
        colorscheme.terminalGray = '#3b3932'
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
