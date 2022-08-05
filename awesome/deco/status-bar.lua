-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local lain = require("lain")

-- Wibox handling library
local wibox = require("wibox")

-- Custom Local Library: Common Functional Decoration
local deco = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.tag-list"),
  tasklist  = require("deco.task-list")
}

local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
--
local markup     = lain.util.markup

local battery_cols = {
  red = "#ba0202",
  green = "#5eab05",
  orange = "#e08f14",
}

local statuses = {
  none = "N/A",
  discharge = "Discharging",
  charge = "Charging",
  full = "Full",
  not_charging = "Not charging",
}

local icons = {
  bat_00 = "",
  bat_25 = "",
  bat_50 = "",
  bat_75 = "",
  bat_100 = "",
}

local theme = {}
local baticon = wibox.widget.imagebox(theme.bat100)
local bat = lain.widget.bat({
    battery = 'BAT0',
    settings = function()
        local bat_p = bat_now.perc
        local status = bat_now.status
        local col = battery_cols.green
        local icon = icons.bat_100

        if bat_p <= 20 and status == statuses.discharge then
            col = battery_cols.red
        elseif status == statuses.charge then
            col = battery_cols.orange
        elseif status == statuses.not_charging then
            col = battery_cols.green
        end

        if bat_p <= 5 then
            icon = icons.bat_00
        elseif bat_p > 5 and bat_p <= 25 then
            icon = icons.bat_25
        elseif bat_p > 25 and bat_p <= 50 then
            icon = icons.bat_50
        elseif bat_p > 50 and bat_p <= 75 then
            icon = icons.bat_75
        elseif bat_p > 75 then
            icon = icons.bat_100
        end

        widget:set_markup(markup.font(theme.font, markup(col, icon .. " " .. bat_p .. "%")))
        baticon:set_image(bat100)
    end
})

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({ }, 1, function () awful.layout.inc( 1) end),
    awful.button({ }, 3, function () awful.layout.inc(-1) end),
    awful.button({ }, 4, function () awful.layout.inc( 1) end),
    awful.button({ }, 5, function () awful.layout.inc(-1) end)
  ))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      RC.launcher,
      s.mytaglist,
      s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    { -- Right widgets
      wibox.widget.systray(),
      layout = wibox.layout.fixed.horizontal,
      mykeyboardlayout,
      bat.widget,
      mytextclock,
      s.mylayoutbox,
    },
  }
end)
-- }}}
