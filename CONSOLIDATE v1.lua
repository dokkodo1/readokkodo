-- CONSOLIDATE ALL PROJECT TABS INTO MASTER PROJECT

---@diagnostic disable-next-line: undefined-global
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

function ClearTS()
    r.GetSet_LoopTimeRange(true, true, 0, 0, false)
end

function UnselectItems()
    reaper.SelectAllMediaItems(-1, false)
end

function ClearAll()
    ClearTS()
    UnselectItems()
end

function CursorToEnd()
    r.SelectAllMediaItems(-1, true)
    TSItems()
    r.SetEditCurPos(Len_TS() + 5, false, false)
    ClearAll()
end

function NumProjects()
    local Projects = 0
    while r.EnumProjects(Projects, "") ~= nil do
        Projects = Projects + 1
    end
    return Projects
end

function GetProjectID() -- ! Needs work
    local i = 0
    for i in NumProjects() do
        r.SelectProjectInstance(i)
        r.SelectAllMediaItems(i, true)
        TSItems()
        CreateRegion()
    end
    
end


function MassCopy() -- ! Needs work
    local current_project
    r.SelectAllMediaItems(-1, true)
    TSItems()
    CreateRegion()
    Copy()
end