-- CONSOLIDATE ALL PROJECT TABS INTO MASTER PROJECT

local r = reaper

function Msg(param)
    r.ClearConsole()
    r.ShowConsoleMsg(tostring(param))
end

function ProjTabNext()
    r.Main_OnCommand(40861, 0)
end

function ProjTabPrev()
    r.Main_OnCommand(40862, 0)
end

function TSItems()
    r.Main_OnCommand(40290, 0)
end

function CreateRegion()
    r.Main_OnCommand(40174, 0)
end

function Copy()
    r.Main_OnCommand(41383, 0)
end

function Paste()
    r.Main_OnCommand(42398, 0)
end

function Len_TS()
    local TS_Start, TS_End = r.GetSet_LoopTimeRange(false, false, 0, 0, false)
    return TS_End - TS_Start
end

--[[
            USEFUL STUFF, RIGHT?
r.GetSet_LoopTimeRange2()
r.GetSet_LoopTimeRange()
r.EnumProjects() -- 
r.SelectAllMediaItems()
--]]
--[[
r.SelectAllMediaItems(0)
TSItem()
local Start_Length, End_Length = r.GetSet_LoopTimeRange(true, false, 0, 0, false)
--]]

function NumProjects()
    local Projects = 0
    while r.EnumProjects(Projects, "") ~= nil do
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

--local edit
-- some edit