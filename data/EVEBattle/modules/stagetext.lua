-- STAGETEXT: Additional stage text parameters to announce stage info in select/versus screen.
-- Version: 1.1
-- Date: 3/10/2022
-- Author: Laziness/Wreq!
-- Compatible with: 0.98.2
-- Description: Adds new parameters in system.def that allow rendering various stage info in select and versus screens.
-- New system.def parameters:
-- At [VS Screen]
-- * stage.text: "Stage %s": sets stage text. %s renders stage name. %i can additionally render stageNo.
-- * stage.font: sets stage text font.
-- * stage.pos: sets stage text pos.
-- * stage.scale: sets stage text scale.
-- At [Select Info] or [VS Screen]
-- * stage.author.text: "Author %s": sets stage author text. %s renders stage author. %i can additionally render stageNo.
-- * stage.author.font: sets stage author text font.
-- * stage.author.pos: sets stage author text pos.
-- * stage.author.scale: sets stage author text scale.
-- * stage.description.text: "%s": sets stage description text. %s renders stage description (from stage def file, inside [Info]). %i can additionally render stageNo.
-- * stage.description.font: sets stage description text font.
-- * stage.description.pos: sets stage description text pos.
-- * stage.description.scale: sets stage description text scale.

--------------------------------------------------------
--- General functions
--------------------------------------------------------

function f_getParamValue(def, searchParam, searchGroup)
	local param = ""
	local value = ""
	local group = ""
	local foundGroup = false
	
	io.input(def)
	for line in io.lines() do
		if line:match('^[^%g]*%s*%[.-%s*%]%s*$') then
			line = line:match('%[(.-)%s*%]%s*$') --match text between []
			line = line:gsub('[%. ]', '_') --change . and space to _
			group = tostring(line:lower())
		end
		if group == searchGroup then
			foundGroup = true
		end
		
		if foundGroup and string.find(line, "=") ~= nil and string.find(line, searchParam) ~= nil then
			if group ~= searchGroup then break end
			line = line:gsub('%s*;.*$', '') -- remove comment
			param, value = line:match('^%s*([^=]-)%s*=%s*(.-)%s*$')
			if param == searchParam and value ~= "" then 
				value = value:gsub('"', '') --remove brackets from value
				value = value:gsub('^(%.[0-9])', '0%1') --add 0 before dot if missing at the beginning of matched string
				value = value:gsub('([^0-9])(%.[0-9])', '%10%2') --add 0 before dot if missing anywhere else
				value = value:gsub(',%s*$', '') --remove dummy ','
				break
			end
		end
	end
	return value
end

function f_stageChangeUpdate()
	local n = stageFollowNo
	if main.f_input(main.t_players, {'$B'}) then
		stageFollowNo = stageFollowNo - 1
		if stageFollowNo < 0 then stageFollowNo = #main.t_selectableStages end
	elseif main.f_input(main.t_players, {'$F'}) then
		stageFollowNo = stageFollowNo + 1
		if stageFollowNo > #main.t_selectableStages then stageFollowNo = 0 end
	elseif main.f_input(main.t_players, {'$U'}) then
		for i = 1, 10 do
			stageFollowNo = stageFollowNo - 1
			if stageFollowNo < 0 then stageFollowNo = #main.t_selectableStages end
		end
	elseif main.f_input(main.t_players, {'$D'}) then
		for i = 1, 10 do
			stageFollowNo = stageFollowNo + 1
			if stageFollowNo > #main.t_selectableStages then stageFollowNo = 0 end
		end
	end
	--if n ~= stageFollowNo and stageFollowNo > 0 then
	--	stageAuthor = nil
	--end
end

--------------------------------------------------------
--- Text rendering functions
--------------------------------------------------------

function text:drawText(section, param, stageNo)
	local textType = 'stage'
	if param ~= "name" then
		textType = textType .. '_' .. param
	end
	
	if motif[section][textType .. '_pos'] == nil then 
		motif[section][textType .. '_pos'] = {0, 0}
	end
	if motif[section][textType .. '_offset'][1] == nil then
		motif[section][textType .. '_offset'] = {0, 0}
	end
	if motif[section][textType .. '_scale'][1] == nil then 
		motif[section][textType .. '_scale'] = {1, 1}
	end
	
	local t_txt = {}
	local txt = motif[section][textType .. '_text']:gsub('%%i', tostring(stageNo))
	txt = txt:gsub('\n', '\\n')
	txt = txt:gsub('%%s', main.t_selStages[stageNo][param])
	for i, c in ipairs(main.f_strsplit('\\n', txt)) do
		t_txt[i] = c
	end
	
	for i = 1, #t_txt do
		self:update({
			font =   motif[section][textType .. '_font'][1],
			bank =   motif[section][textType .. '_font'][2],
			align =  motif[section][textType .. '_font'][3],
			text =   t_txt[i],
			x =      motif[section][textType .. '_pos'][1] + motif[section][textType .. '_offset'][1],
			y =      motif[section][textType .. '_pos'][2] + motif[section][textType .. '_offset'][2] + main.f_ySpacing(motif[section], textType) * (i - 1),
			scaleX = motif[section][textType .. '_scale'][1],
			scaleY = motif[section][textType .. '_scale'][2],
			r =      motif[section][textType .. '_font'][4],
			g =      motif[section][textType .. '_font'][5],
			b =      motif[section][textType .. '_font'][6],
			height = motif[section][textType .. '_font'][7],
		})
		self:draw()
	end
end

function f_stageTextDraw(section)
	if section == "select_info" then
		if start.p[1].selEnd and start.p[2].selEnd and start.p[1].teamEnd and start.p[2].teamEnd then
			f_stageChangeUpdate()
		
			if stageFollowNo > 0 then
				for p, v in pairs(stageTextList[section]) do
					v:drawText(section, p, stageFollowNo)
				end
			end
		end
	elseif section == "vs_screen" then
		for p, v in pairs(stageTextList[section]) do
			v:drawText(section, p, getStageNo())
		end
	end
end

--------------------------------------------------------
--- Hooks and intialization code
--------------------------------------------------------

function f_resetStageFollowNo()
	stageFollowNo = 0
end

function f_vsScreenDraw()
	f_stageTextDraw("vs_screen")
end

function f_ssScreenDraw()
	f_stageTextDraw("select_info")
end

function f_selStagesSetData(section, param)
	for _, s in ipairs(main.t_selStages) do
		if s.def ~= nil and s[param] == nil then
			s[param] = f_getParamValue(s.def, param, section)
		end
	end
end

function f_stageTextListInsert(section, param)
	local textType = 'stage'
	if param ~= "name" then
		textType = textType .. '_' .. param
	end
	if motif[section][textType .. "_text"] ~= nil and motif[section][textType .. "_font"] ~= nil then
		stageTextList[section][param] = main.f_createTextImg(motif[section], textType)
	end
end

stageTextList = {
	select_info = {},
	vs_screen = {}
}

-- Gather required stage data for text display
f_selStagesSetData("info", "description")
f_selStagesSetData("info", "author")

-- Add stage parameters that should be displayed to render list (and where to display them)
f_stageTextListInsert("select_info", "description")
f_stageTextListInsert("vs_screen", "description")
f_stageTextListInsert("select_info", "author")
f_stageTextListInsert("vs_screen", "author")
f_stageTextListInsert("vs_screen", "name")

hook.add("main.t_itemname", "resetStageFollowNo", f_resetStageFollowNo)
hook.add("start.f_selectVersus", "vsScreenDraw", f_vsScreenDraw)
hook.add("start.f_selectScreen", "ssScreenDraw", f_ssScreenDraw)
