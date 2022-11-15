local r = reaper

function Msg(param) -- print string to console
    reaper.ClearConsole()
    reaper.ShowConsoleMsg(tostring(param))
end

function ProjTabNext()
    reaper.Main_OnCommand(40861, 0)
end

function ProjTabPrev()
    reaper.Main_OnCommand(40862, 0)
end

function TSItem()
    reaper.Main_OnCommand(40290, 0)
end

function CreateRegion()
    reaper.Main_OnCommand(40174, 0)
end

function Copy()
    reaper.Main_OnCommand(41383, 0)
end

function Paste()
    reaper.Main_OnCommand(42398, 0)
end

function Len_TS()
    local TS_Start, TS_End = reaper.GetSet_LoopTimeRange(false, false, 0, 0, false)
    return TS_End - TS_Start
end