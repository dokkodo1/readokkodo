-- CONSOLIDATE ALL PROJECT TABS INTO MASTER PROJECT

---@diagnostic disable-next-line: undefined-global
local r = reaper

function SaveClose()
    r.Main_OnCommand(40026, 0)                      -- saves current project
    r.Main_OnCommand(40860, 0)                      -- closes current project
end

function Msg(param)
    --r.ClearConsole()
    r.ShowConsoleMsg(tostring(param) .. "\n")
end

function ProjTabNext()
    r.Main_OnCommand(40861, 0)
end

function ProjTabPrev()
    r.Main_OnCommand(40862, 0)
end

function TSItems()                                  -- creates time selection around selected items
    r.Main_OnCommand(40290, 0)
end

function CreateRegion()                             -- creates region from time selection
    r.Main_OnCommand(40174, 0)
end

function Copy()                                     -- copies selected items
    r.Main_OnCommand(41383, 0)
end

function Paste()                                    -- pastes at edit cursor
    r.Main_OnCommand(42398, 0)
end

function Len_TS()                                   -- returns length of time selection
    local TS_Start, TS_End = r.GetSet_LoopTimeRange(false, false, 0, 0, false)
    return TS_End - TS_Start
end

function ClearTS()                                  -- clears time selection
    r.GetSet_LoopTimeRange(true, true, 0, 0, false)
end

function UnselectItems()                            -- unselects items
    r.SelectAllMediaItems(-1, false)
end

function ClearAll()                                 -- unselects all
    ClearTS() UnselectItems()
end

function CursorToEnd()                              -- moves cursor 5 seconds after last media item in current project tab
    r.SelectAllMediaItems(0, true) TSItems()
    r.SetEditCurPos(Len_TS() + 5, false, false)
    ClearAll()
end

function SelectTSCopy(CurrentProj, ...)             -- !Needs work!
    r.SelectAllMediaItems(CurrentProj, true)
    TSItems() Copy()
end

function PasteToMaster()                            -- !Needs work!
    r.SelectProjectInstance(1) Paste()
end

function NumProjects()                              -- outputs the number of project tabs (thanks alex)
    local Projects = 0
    while r.EnumProjects(Projects, "") ~= nil do
        Projects = Projects + 1
    end
    return Projects
end

function GetProjects()                              -- stores each project tab in a table
    local Projects = {}
    for i = 0, NumProjects() + 1 do
        Projects[i] = r.EnumProjects(i, "")
    end
    return Projects
    
end


 --Msg(reaper.EnumProjects(-1))
function Main()
    ProjTabNext()
    r.SelectAllMediaItems(0, true) Copy()
    --SaveClose()
    ProjTabPrev()
    CursorToEnd() Paste()
end

Main()