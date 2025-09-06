-- This module loads additional external modules from your motif/screenpack folder.
-- These modules must be located inside a subfolder in your motif folder called "modules".
-- To use this mod, declare it in your system.def file, inside the section [Files], like this:
-- module = data/<myscreenpackfolder>/modloader.lua
for _, v in ipairs(getDirectoryFiles(motif.fileDir .. 'modules/')) do
	if v:lower():match('%.([^%.\\/]-)$') == 'lua' then
		print('Loading module: ' .. v)
		v = v:gsub('^%s*[%./\\]*', '')
		v = v:gsub('%.[^%.]+$', '')
		require(v:gsub('[/\\]+', '.'))
	end
end