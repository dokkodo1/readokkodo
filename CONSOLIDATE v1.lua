-- CONSOLIDATE ALL PROJECT TABS INTO MASTER PROJECT

local r = reaper

function Msg(param)
    reaper.ClearConsole()
    reaper.ShowConsoleMsg(tostring(param))
end

function ProjTabNext()
    reaper.Main_OnCommand(40861, 0)
end

function ProjTabPrev()
    reaper.Main_OnCommand(40862, 0)
end

function TSItems()
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

--[[
            USEFUL STUFF, RIGHT?
reaper.GetSet_LoopTimeRange2()
reaper.GetSet_LoopTimeRange()
reaper.EnumProjects() -- 
reaper.SelectAllMediaItems()
--]]
--[[
reaper.SelectAllMediaItems(0)
TSItem()
local Start_Length, End_Length = reaper.GetSet_LoopTimeRange(true, false, 0, 0, false)
--]]

function NumProjects()
    local Projects = 0
    while reaper.EnumProjects(Projects, "") ~= nil do
        Projects = Projects + 1
    end
    return Projects  
end

function GenerateRegions()
    for i in NumProjects() do
        r.SelectAllMediaItems(i)
        TSItems()
        CreateRegion()
    end
end
