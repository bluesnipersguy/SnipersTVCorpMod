--- STEAMODDED HEADER
--- MOD_NAME: Snipers TV Corporation Mod
--- MOD_ID: SnipersTV
--- MOD_DESCRIPTION: It's fine... right???
--- PREFIX: SnipersTV
--- AUTHOR: bluesnipersguy, colonthreeing, Egg (illudethis)
----------------------------------------------------------
----------- MOD CODE -------------------------------------
if not SnipersTV then
	SnipersTV = {}
end

local mod_path = "" .. SMODS.current_mod.path

SnipersTV.path = mod_path
SnipersTV_config = SMODS.current_mod.config

SMODS.current_mod.optional_features = {
    retrigger_joker = true,
}

local files = NFS.getDirectoryItems(mod_path .. "items")

for _, file in ipairs(files) do
	print("SnipersTV Loading lua files..." .. file)
	local f, err = SMODS.load_file("items/" .. file)
	if err then
		error(err) 
	end
	if f then
		f()
	end
end

SMODS.ObjectType({
	key = 'SnipersTVAddition',
	default = "j_reserved_parking",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
	end,
})