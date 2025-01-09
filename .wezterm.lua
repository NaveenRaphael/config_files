-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end


-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'
-- So that i can do whatever the heck I want
config.disable_default_key_bindings = true

config.leader = { key = "Alt", mods = "NONE", timeout_milliseconds = 2000 }

local act = wezterm.action
local mux = wezterm.mux

config.keys = {
  {-- To rename the present tab
    key = 'E',
    mods = 'CTRL|SHIFT',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, _, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  {
    key = 'Tab',
    mods = 'CTRL',
    action = act.ActivateTabRelative(1)
  },
  {
    key = 'Tab',
    mods = 'CTRL|SHIFT',
    action = act.ActivateTabRelative(1)
  },
  {
    key = 'C',
    mods = 'CTRL|SHIFT',
    action = act.CopyTo 'Clipboard'
  },
  {
    key = 'V',
    mods = 'CTRL|SHIFT',
    action = act.PasteFrom 'Clipboard'
  },
{
    key = 'C',
    mods = 'LEADER',
    action = act.CopyTo 'Clipboard'
  },
  {
    key = 'V',
    mods = 'LEADER',
    action = act.PasteFrom 'Clipboard'
  },
  {
    key='\\',
    mods = "LEADER",
    action = act.SplitHorizontal{
      domain = 'CurrentPaneDomain'
    }
  },
  {
    key='-',
    mods = "LEADER",
    action = act.SplitVertical{
      domain = 'CurrentPaneDomain'
    }
  },
{
    key='t',
    mods = "LEADER",
    action = act.SpawnTab 'CurrentPaneDomain'
  },
{
    key='d',
    mods = "LEADER",
    action = act.CloseCurrentPane { confirm = false}
  },
{
    key='c',
    mods = "LEADER",
    action = act.ActivateCopyMode
  },
{
    key='s',
    mods = "LEADER",
    action = act.QuickSelect
  },
{
    key='LeftArrow',
    mods = "LEADER",
    action = act.ActivatePaneDirection 'Left',
  },
{
    key='RightArrow',
    mods = "LEADER",
    action = act.ActivatePaneDirection 'Right',
  },
{
    key='UpArrow',
    mods = "LEADER",
    action = act.ActivatePaneDirection 'Up',
  },
{
    key='DownArrow',
    mods = "LEADER",
    action = act.ActivatePaneDirection 'Down',
  },
}

for i = 0, 9 do
    -- leader + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = "LEADER",
        -- Because of zero indiced tabs
        action = wezterm.action.ActivateTab(i-1),
    })
end-- tab bar

-- todo: Fill this up
config.key_tables = {
  copy_mode = {
      { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      { key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
      { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
      { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
      { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
      { key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
      { key = 'F', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
      { key = 'F', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
      { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
      { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
      { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
      { key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
      { key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
      { key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
      { key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
      { key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
      { key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
      { key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
      { key = 'T', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
      { key = 'T', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
      { key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
      { key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode =  'Line' } },
      { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
      { key = 'c', mods = 'CTRL', action = act.CopyMode 'Close' },
      { key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },
      { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
      { key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
      { key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
      { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
      { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
      { key = 'g', mods = 'CTRL', action = act.CopyMode 'Close' },
      { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
      { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'm', mods = 'ALT', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
      { key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 't', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = true } } },
      { key = 'u', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } },
      { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
      { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
      { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
      { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { CopyMode =  'Close' } } },
      { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
      { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
      { key = 'End', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = 'Home', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
      { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'LeftArrow', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
      { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
  },
search_mode = {
      { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
      { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
      { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
      { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
      { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
      { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
      { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
      { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
      { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
    },
}

config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false

config.enable_wayland = false


-- I used to use zellij before this
-- config.default_prog = { 'zellij', '-l', 'welcome' }


config.unix_domains = {
  {
    name = 'unix',
  },
}
-- config.default_gui_startup_args = { 'connect', 'unix' }

-- tmux status
wezterm.on("update-right-status", function(window, _)
    local prefix = ""

    if window:leader_is_active() then
        prefix = " -"
    end

    if window:active_tab():tab_id() ~= 0 then
        ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
    end -- arrow color based on if tab is first pane

    window:set_left_status(wezterm.format {
        { Background = { Color = "#b7bdf8" } },
        { Text = prefix },
    })
end)


-- wezterm.on('mux-startup', function(cmd)
--   local tab, pane, window = mux.spawn_window(cmd or {})

--   window:gui_window():maximize()
--   local top_pane= pane:split{
--     direction = 'Top',
--   }
--   local bottom_left_pane = pane:split{
--     direction = 'Left',
--   }
--   local top_right_pane = top_pane:split{
--     direction = 'Right',
--   }
--   top_pane:send_text 'viva \n'
--   pane: send_text 'zotero\n'
--   top_right_pane: send_text 'obsidian \n'
--   bottom_left_pane: send_text 'htop\n'

--   window:spawn_tab({})
-- end)

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})

  window:gui_window():maximize()
  local top_pane= pane:split{
    direction = 'Top',
    size=0.2
  }
  local top_right_pane = top_pane:split{
    direction = 'Right',
    size=0.5
  }
  top_pane:send_text 'zen \n'
  top_right_pane: send_text 'obsidian \n'
  pane: send_text 'btop \n'
  window:spawn_tab({})
end)
-- and finally, return the configuration to wezterm
return config
