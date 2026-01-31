function table_contains(table, value)
  if table[value] ~= nil then return true end
  return false
end

SMODS.Atlas{
    key = 'ForestJoker',
    path = 'ForestJoker.png',
	px = 69,
	py = 96,
}
SMODS.Atlas({
	key = "TinsCustomJokers",
	path = "TinsCustomJokers.png",
	px = 71,
	py = 95,
    atlas_table = "ASSET_ATLAS"
}):register()
SMODS.Atlas{
    key = 'MafiosoJoker', 
    path = 'MafiosoJoker.png',
	px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'SteelTicket', 
    path = 'SteelTicket.png',
	px = 71,
    py = 95
}
SMODS.Atlas{
    key = 'EvilBlueprint', 
    path = 'EvilBlueprint.png',
	px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'OMORIJoker',
    path = 'OMORIJoker.png',
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'DrRobotnikJoker',
    path = 'DrRobotnikJoker.png',
    px = 71,
    py = 95
}
SMODS.Sound{
	key = 'youwontlivetoseethenextday',
	path = 'youwontlivetoseethenextday.ogg',
}
SMODS.Sound{
	key = 'justshutupandragequit',
	path = 'justshutupandragequit.ogg',
}
SMODS.Sound{
	key = 'marispicnicsell',
	path = 'marispicnicsell.ogg',
}
SMODS.Sound{
	key = 'blueprintforgiven',
	path = 'blueprintforgiven.ogg',
}
SMODS.Sound {
    key = 'omorisuccumb',
    path = 'omorisuccumb.ogg',
}
SMODS.Sound {
    key = 'snooping',
    path = 'snooping.ogg',
}

SMODS.Joker{
    key = 'ForestJoker',
    loc_txt= {
        name = 'Forest',
        text = {'For each {C:attention}Joker{},',
                'retrigger all {C:attention}Jokers{} an extra time.',
                'Currently retriggering: {C:attention}#1#{} extra time(s).',
                '{C:inactive} My cute boyfriend! - bluesnipersguy{}',
            }
	},
    pools = { ['SnipersTVAdditions'] = false },
    pos = {x=0, y= 0},
	soul_pos = { x = 0, y = 1 },
	cost = 30,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    atlas = 'ForestJoker',
	loc_vars = function(self, info_queue, center)
		if not G.jokers then
            return { vars = {0} }
		end
        return { vars = {#G.jokers.cards} }
	end,
	check_for_unlock = function(self)
		unlock_card(self)
	end,
	calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card and context.other_card then
			return {
				repetitions = #G.jokers.cards,
                message = "There ya go! :3c"
			}
		end
		--     if context.card_added then
		--         if context.cardarea == G.jokers and (context.retrigger_joker == nil) then
		--             return {
		--                 message = "Welcome :3c"
		--             }
		--         end
		--     end
		--     if context.selling_card then
		--         if context.cardarea == G.jokers and (context.retrigger_joker == nil) then
		--             print(inspectDepth(self))
		--             print(inspectDepth(context.card))
		--             print(card == context.card)
		--             return {
		--                 message = "Rest in peace 3:"
		--             }
		--         end
		--     end
	end,
	credits = {	
		art = { "bluesnipersguy" },
		code = { "bluesnipersguy + colonthreeing" },
		idea = { "bluesnipersguy" },
},
}

SMODS.Atlas{
	key = 'SnakeEyes',
	path = 'SnakeEyes.png',
	px = 69,
	py = 96,
}

SMODS.Joker{
    key = 'SnakeEyes',
    loc_txt= {
        name = 'Oops... Snake Eyes!',
        text = { 'Unlucky!',
                'All {C:attention}listed{} {C:green}probablities{}',
                'are {C:red}HALFED.{}',
                '{C:inactive}makes all glass viable - blue',
            }
	},
    pools = { ['SnipersTVAdditions'] = true },
    pos = {x=0, y= 0},
	cost = 8,
	rarity = 2,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
    atlas = 'SnakeEyes',
	check_for_unlock = function(self)
		unlock_card(self)
	end,
	add_to_deck = function(self, card, from_debuff)
		for k, v in pairs(G.GAME.probabilities) do
			G.GAME.probabilities[k] = v / 2
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		for k, v in pairs(G.GAME.probabilities) do
			G.GAME.probabilities[k] = v * 2
		end
	end,
	credits = {	
		art = { "bluesnipersguy" },
		code = { "colonthreeing + bluesnipersguy" },
		idea = { "bluesnipersguy" },
},
}

SMODS.Atlas{
	key = 'Hakari',
	path = 'Hakari.png',
	px = 69,
	py = 96,
}

SMODS.Joker{
    key = 'Hakari',
    loc_txt= {
        name = 'Hakari',
		text = {
            'All {c:attention}listed{}',
            '{C:green}probabilities{} are {C:red}RIGGED{}',
            'to be {C:legendary}Guaranteed{}.',
            '{C:inactive}Always bet on Hakari. - blue',
        }
	},
    pools = { ['SnipersTVAdditions'] = false },
    pos = {x=0, y= 0},
	soul_pos = { x = 0, y = 1 },
	cost = 35,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
    atlas = 'Hakari',
	check_for_unlock = function(self)
		unlock_card(self)
	end,
	original_odds = {},
	add_to_deck = function(self, card, context)
		for k, v in pairs(G.GAME.probabilities) do
			self.original_odds[k] = v
			G.GAME.probabilities[k] = math.huge
		end
	end,
	remove_from_deck = function(self, card, context)
		for k, v in pairs(G.GAME.probabilities) do
			G.GAME.probabilities[k] = self.original_odds[k]
		end
	end,
	credits = {
		art = { "bluesnipersguy" },
		code = { "colonthreeing" },
		idea = { "bluesnipersguy (Cryptid's Seed Card)" }
	},
}

SMODS.Atlas{
	key = 'DarkJoker',
	path = 'DarkJoker.png',
	px = 69,
	py = 96,
}

SMODS.Joker{
    key = 'DarkJoker',
    loc_txt= {
        name = 'Harold',
        text = { 'Starts out with {X:mult,C:white}X1.5{} Mult{}',
                 'gain {X:mult,C:white}X0.25{} Mult{},',         
                 'for each {C:attention}consectutive{}',
                 '{C:red}discarded{} {C:attention}face{} card,',
                 'that is not a {C:attention}Queen{}.',
                 'Unleash this {X:mult,C:white}XMult{} on played {C:attention}Queen{} Cards.',
                 '{C:inactive}Currently applying: {X:mult,C:white}X#1#{} Mult{}',
                '{C:inactive}A true gentleman. - blue',
            }
	},
    pools = { ['SnipersTVAdditions'] = false },
    pos = {x=0, y= 0},
	soul_pos = { x = 0, y = 1 },
    config = { extra = { DarkXMult = 1.5, } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.DarkXMult } }
	end,
	cost = 30,
	rarity = 4,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
    atlas = 'DarkJoker',
	check_for_unlock = function(self)
		unlock_card(self)
	end,
	calculate = function(self, card, context)
        if context.discard and context.other_card:get_id() ~= 12  and context.other_card:is_face()  then
			card.ability.extra.DarkXMult = card.ability.extra.DarkXMult + 0.25
			return {
				message = "My pleasure. +0.25X Mult",
				colour = G.C.RED,
			}
		elseif context.discard and context.other_card:get_id() == 12 then
			card.ability.extra.DarkXMult = 1.5
			return {
				message = "Sorry about that. (Reset)",
				colour = G.C.RED,
			}
		end
		if context.individual and context.cardarea == G.play and context.other_card:get_id() == 12 then
			return {
				xmult = card.ability.extra.DarkXMult,
			}
		end
	end,
	credits = {	
		art = { "bluesnipersguy" },
		code = { "bluesnipersguy" },
		idea = { "DARKINUM" },
},
}

SMODS.Atlas{
    key = 'EggJoker',
    path = 'EggJoker.png',
	px = 71,
	py = 96,
}

SMODS.Joker{
    key = 'Egg',
    loc_txt= {
        name = 'Egg (illudethis)',
        text = { '{C:legendary}Legendary{} Jokers can be found in the {C:attention}shop{}.',
                '{C:legendary}Legendary{} jokers are more common every reroll.',
                '{inactive}Chance: {X:mult,C:white}#1#%{}',
                '{C:inactive}These damn script kiddies. - blue',
            }
	},
    config = { extra = { BuffedOdds = 0, } },
	loc_vars = function(self, info_queue, card)
		return { vars = { math.min(50, card.ability.extra.BuffedOdds * 100) } }
	end,
    pools = { ['SnipersTVAdditions'] = true },
    pos = {x=0, y= 0},
	soul_pos = { x = 0, y = 1 },
    atlas = 'EggJoker',
	cost = 12,
	rarity = 3,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	check_for_unlock = function(self)
		unlock_card(self)
	end,
	calculate = function(self, card, context)
		if context.reroll_shop then
			card.ability.extra.BuffedOdds = math.min(0.5, card.ability.extra.BuffedOdds + 0.02)
			return {
				message = "Buffed!",
			}
		end
		if context.starting_shop then
			card.ability.extra.BuffedOdds = 0.0
		end
	end,
	credits = {	
		art = { "Egg (illudethis)" },
		code = { "colonthreeing" },
		idea = { "Egg (illudethis)" },
},
}
--[[
SMODS.Joker{
    key = 'Malk',
    loc_txt= {
        name = 'Malk',
        text = { '',
                '',
                '',
                '   ',
            }
    },
    config = { extra = { BuffedOdds = 0, } },
    loc_vars = function(self, info_queue, card)
        return { vars = { math.min(50, card.ability.extra.BuffedOdds * 100) } }
    end,
    pools = { ['SnipersTVAdditions'] = true },
    pos = {x=0, y= 0},
    soul_pos = { x = 0, y = 1 },
    atlas = 'EggJoker',
    cost = 12,
    rarity = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.reroll_shop then
            card.ability.extra.BuffedOdds = math.min(0.5, card.ability.extra.BuffedOdds + 0.01)
            return {
                message = "Buffed!",
            }
        end
        if context.starting_shop then
            card.ability.extra.BuffedOdds = 0.0
        end
    end,
}
]]
SMODS.Atlas{
    key = 'Landscape',
    path = 'Landscape.png',
	px = 71,
	py = 95,
}

SMODS.Joker{
    key = 'Landscape',
    loc_txt= {
        name = 'Landscape',
        text = { 'For each scored {C:attention}face{} card,',
                'gain {X:mult,C:white}X0.50{} Mult{}',
                'if discarded, gain {C:blue}20 Chips{}.',
                'For each scored non-{C:attention}face{} card,',
                'lose {X:mult,C:white}X0.50{} Mult{},',
                'if discarded, lose {C:blue}20 Chips{}.',
                '{C:inactive}Currently applying: {X:mult,C:white}X#1#{} Mult{}.',
                '{C:inactive}Currently adding: {C:blue}+#2# Chips{}.',
                '{C:inactive}A beautiful landscape filled with 1080p glory. - blue'
            }
	},
    pools = { ['SnipersTVAdditions'] = true },
    config = { extra = { LandscapeXMult = 1, LandscapeChips = 0} },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.LandscapeXMult, card.ability.extra.LandscapeChips } }
	end,
    pos = {x=0, y= 0},
    atlas = 'Landscape',
	cost = 12,
	rarity = 3,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
	check_for_unlock = function(self)
		unlock_card(self)
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face()  then
			card.ability.extra.LandscapeXMult = card.ability.extra.LandscapeXMult + 0.50
			return {
				message = "Blissful. (+0.50X)",
				colour = G.C.RED,
			}
        elseif context.individual and context.cardarea == G.play and not context.other_card:is_face()  then
			card.ability.extra.LandscapeXMult = math.max(card.ability.extra.LandscapeXMult - 0.50, 1)
			return {
				message = "Why??? (-0.50X)",
				colour = G.C.RED,
			}
		end

		if context.discard and context.other_card:is_face() then
			card.ability.extra.LandscapeChips = card.ability.extra.LandscapeChips + 20
			return {
				message = "Chipful. (+20)",
				colour = G.C.BLUE,
			}
		elseif context.discard and not context.other_card:is_face() then
			card.ability.extra.LandscapeChips = math.max(card.ability.extra.LandscapeChips - 20, 0)
			return {
				message = "Hurtful. (-20)",
				colour = G.C.BLUE,
			}
		end
		if context.joker_main then
			return {
				xmult = card.ability.extra.LandscapeXMult,
				chips = card.ability.extra.LandscapeChips,
			}
		end
	end,
	credits = {
		art = { "Masked Man" },
		code = { "bluesnipersguy" },
		idea = { "Masked Man" },
	},
}

SMODS.Atlas {
	key = "Estradiol",
	path = "Estradiol.png",
	px = 71,
    py = 96
}

SMODS.Joker {
	key = "Estradiol",
	loc_txt = {
		name = "Estradiol",
		text = {
			"All scored {C:attention}Kings{} and {C:attention}Jacks{}",
			"become {C:attention}Queens{}.",
            "{C:inactive}is this celeste from the hit game celeste? - blue{}"
        }
	},
	pools = { ["SnipersTVAdditions"] = true },
	pos = { x = 0, y = 0 },
	atlas = "Estradiol",
	cost = 7,
	rarity = 3,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,

	check_for_unlock = function(self)
		unlock_card(self)
	end,

    calculate = function (self, card, context)
		if context.before and context.main_eval and not context.blueprint then
			local found = 0
			for _, scored_card in ipairs(context.scoring_hand) do
				if scored_card:get_id() == 11 or scored_card:get_id() == 13 then
					found = found + 1
					assert(SMODS.change_base(scored_card, nil, "Queen"))
					G.E_MANAGER:add_event(Event({
						func = function()
							scored_card:juice_up()
							return true
                        end
					}))
				end
			end
			if found > 0 then
				return {
					message = "Transitioned!",
                    colour = G.C.MONEY
				}
			end
		end
	end,

	credits = {
		art = "colonthreeing",
		code = "colonthreeing",
		idea = "colonthreeing"
	}
}
SMODS.Joker {
	key = "Sugar",
	loc_txt = {
		name = "Sugar",
		text = {
			"All cards that are scored are converted to {C:attention}Queens{}.",
			"For each {C:attention}Queen{} successfully scored, this joker gains {X:mult,C:white}X1{} Mult{}.",
			"Unleash {X:mult,C:white}XMult{}. on scored {C:attention}Queen{} cards.",
            '{C:inactive}Currently applying: {X:mult,C:white}X#1#{} Mult{}.',
            '{C:inactive}IS THAT {C:legendary}SOURCHAOSCANDY{}{}{C:inactive}FROM THE HIT SERVICE TWITCH?{} - blue{}'
        }
	},
	pools = { ["SnipersTVAdditions"] = false },
	pos = { x = 0, y = 0 },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.SugarXMult, } }
	end,
	cost = 32,
	rarity = 4,
    config = { extra = { SugarXMult = 1, } },
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	check_for_unlock = function(self)
		unlock_card(self)
	end,

    calculate = function (self, card, context)
		if context.before and context.main_eval and not context.blueprint then
			local found = 0
			for _, scored_card in ipairs(context.scoring_hand) do
				if scored_card:get_id() ~= 12 then
					found = found + 1
					assert(SMODS.change_base(scored_card, nil, "Queen"))
					G.E_MANAGER:add_event(Event({
						func = function()
							scored_card:juice_up()
							return true
                        end
					}))
				end
			end
			if found > 0 then
				return {
					message = "Slimed!",
                    colour = G.C.MONEY
				}
			end
		end
		if context.individual and context.cardarea == G.play and context.other_card:get_id() == 12 then
			card.ability.extra.SugarXMult = card.ability.extra.SugarXMult + 1
			return {
				message = "Sugary! (+1 XMult)",
				colour = G.C.RED,
				xmult = card.ability.extra.SugarXMult,
			}
		end
	end,
    credits = {
		art = "Sugar",
		code = "bluesnipersguy",
		idea = "Sugar"
	}
}
SMODS.Joker {
	key = "Gamma",
	loc_txt = {
		name = "Gamma",
		text = {
			"For each scored {C:attention}Queen{},",
			"gain {C:attention}1{} additional retrigger on scored queen cards.",
            "{C:inactive}Current retriggers: {C:attention}#1#{}.",
            "{C:inactive}Did you know she was entirely designed to run Doom '93 and that's it? - Sugar{}",
            "{C:inactive}Notably combos well with Sugar... Wonder why... - blue{}"
        }
	},
	pools = { ["SnipersTVAdditions"] = false },
	pos = { x = 0, y = 0 },
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gammaRepetitions, } }
	end,
	cost = 32,
	rarity = 4,
    config = { extra = { gammaRepetitions = 0, } },
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	check_for_unlock = function(self)
		unlock_card(self)
	end,

    calculate = function (self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card:get_id() == 12 then
			card.ability.extra.gammaRepetitions = card.ability.extra.gammaRepetitions + 1
		elseif context.repetition and context.cardarea == G.play and context.other_card:get_id() == 12 then
            return {
                repetitions = card.ability.extra.gammaRepetitions,
                message = ":3c (+1 Repetition)",
				colour = G.C.MONEY,

            }
        end
	end,
     credits = {
		art = "Gamma",
		code = "bluesnipersguy",
		idea = "bluesnipersguy"
	}
}
SMODS.Joker {
    key = 'Temperance2',
    loc_txt= {
        name = 'Temperance II (Goated Temperance)',
        text = { 'For each {C:attention}${} in Joker sell value,',
                 'gain {X:mult,C:white}X0.10{} Mult{}.',
                 '{C:inactive}Currently applying: {X:mult,C:white}X#1#{} Mult{}',
                '{C:inactive}MONEY MAXXING!!! - blue',
            }
	},
    pools = { ['SnipersTVAdditions'] = true },
    pos = {x=0, y= 0},
	loc_vars = function(self, info_queue, card)
		local sell_cost = 0
		for i = 1, (G.jokers and #G.jokers.cards or 0) do
            if G.jokers.cards[i].ability.set == 'Joker' then
				sell_cost = sell_cost + G.jokers.cards[i].sell_cost / 10.0
			end
		end

		return { vars = { sell_cost + 1 } }
	end,
	cost = 8,
	rarity = 3,
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	check_for_unlock = function(self)
		unlock_card(self)
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			local sell_cost = 0
			for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.set == 'Joker' then
					sell_cost = sell_cost + G.jokers.cards[i].sell_cost / 10.0
				end
			end

			return {
                xmult = sell_cost + 1
			}
		end
	end,
	credits = {
		art = { "bluesnipersguy" },
		code = { "bluesnipersguy + colonthreeing" },
		idea = { "WPawnToE4" },
	},
}
SMODS.Joker {
	key = 'longquiet',
	loc_txt = {
        name = 'The Long Quiet',
		text = {
            'For each {C:attention}Queen{} added',
            'to deck, gain {X:mult,C:white}X0.5{} Mult.',
            'For each {C:attention}Queen{} removed',
            'from deck, lose {X:mult,C:white}X0.5{} Mult.',
            '{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive})',
        }
	},
    pools = { ['SnipersTVAdditions'] = true },
    pos = {x=0, y= 0},
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.LongQuietXMult, } }
	end,
	cost = 7,
	rarity = 3,
    config = { extra = { LongQuietXMult = 1, } },
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,
	check_for_unlock = function(self)
		unlock_card(self)
	end,
    calculate = function (self, card, context)
		if context.playing_card_added and not context.blueprint then
			local found = false
            for k,v in pairs(context.cards) do
				if v:get_id() == 12 then
					card.ability.extra.LongQuietXMult = card.ability.extra.LongQuietXMult + 0.5
					found = true
				end
			end
            if found then return { message = "Saved!" } end
		elseif context.remove_playing_cards and not context.blueprint then
			local removed_value = false
			for _, removed_card in ipairs(context.removed) do
				if removed_card:get_id() == 12 then
					card.ability.extra.LongQuietXMult = card.ability.extra.LongQuietXMult - 0.5
					removed_value = true
				end
			end
			if removed_value then
				card.ability.extra.LongQuietXMult = math.max(card.ability.extra.LongQuietXMult, 1)
				return {
					message = "Slayed!",
				}
			end
		elseif context.joker_main then
			return {
				xmult = card.ability.extra.LongQuietXMult,
			}
		end
    end,
    credits = {
		art = { "colonthreeing" },
		code = { "colonthreeing" },
		idea = { "colonthreeing" },
	},
}
if not SnipersTV then SnipersTV = {} end
if not SnipersTV.MathConvert then SnipersTV.MathConvert = 1 end
local scie = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
	if (
	    key == "mult"
	    or key == "mult_mod"
	) and amount ~= 1
	then
		local mathconvertthere = false
        local _mathconvertcard  = nil
		for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].ability.name == 'j_SnipersTV_mathconvert' then
				mathconvertthere = true
				_mathconvertcard = G.jokers.cards[i]
			end
		end
		if mathconvertthere == true then
			SnipersTV.MathConvert = SnipersTV.MathConvert + amount
            card_eval_status_text(_mathconvertcard,'jokers',nil,nil,nil,{message = "Copied +" ..amount.."!"})
			amount = 1
		end
	end
	local ret = scie(effect, scored_card, key, amount, from_edition)
	return ret
	end
SMODS.Joker{
    key = 'mathconvert',
    loc_txt= {
        name = 'math.convert(#1#)',
        text = { 
                 'At end of play,',    
                 'copy incoming flat {C:red}+Mult{},',
                 'Convert flat {C:red}+Mult{} into {X:mult,C:white}XMult{}.',
                 '{C:inactive}Currently converting, {C:red}+#1#{} into {X:mult,C:white}X#1#{} Mult{}',
                '{C:inactive}Finally... My lua skills paid off. - blue'
            }
    },
    pools = { ['SnipersTVAdditions'] = true },
    pos = {x=0, y= 0},
        loc_vars = function(self, info_queue, card)
        return { vars = {SnipersTV.MathConvert} }
        end,
    cost = 10,
    rarity = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                message = 'X' .. SnipersTV.MathConvert,
                xmult = SnipersTV.MathConvert
            }
        end
        if context.end_of_round or context.setting_blind then
            if SnipersTV.MathConvert ~= 1 then
                SnipersTV.MathConvert = 1
            end
        end
    end,
	credits = {
		art = { "bluesnipersguy" },
		code = { "bluesnipersguy (Yahimod's Lydia)" },
		idea = { "bluesnipersguy" },
	},
}
SMODS.Sound {
    key = 'gamblecoresuccess',
    path = 'gamblecoresuccess.ogg'
 }
 SMODS.Sound {
    key = 'gamblecorefail',
    path = 'gamblecorefail.ogg'
 }
SMODS.Atlas{
    key = 'GamblecoreJoker', 
    path = 'GamblecoreJoker.png',
    px = 71,
    py = 95
}
SMODS.Joker{ --Gamblecore
    name = "Gamblecore",
    key = "gamblecore",
    config = {
        extra = {
            j_joker = 0,
            odds = 50
        }
    },
    loc_txt = {
        ['name'] = 'Gamblecore',
        ['text'] = {
            [1] = 'When blind is selected',
			[2] = 'Create a {C:attention}Joker{} of any rarity (must have room)',
            [3] = '{C:green}1/2{} chance for a {C:blue}Common{}',
            [4] = '{C:green}7/25{} chance for a {C:green}Uncommon{}',
            [5] = '{C:green}1/5{} chance for a {C:red}Rare{}',
            [6] = '{C:green}1/50{} chance for a {C:tarot}Legendary{}',
            [7] = '{C:inactive}Let\'s go gambling!{}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'GamblecoreJoker',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
                if pseudorandom('group_0_171c225a') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        SMODS.calculate_effect({func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('SnipersTV_gamblecoresuccess')
                            SMODS.add_card({
                                set = 'Joker',
                                rarity = 'Legendary',
                                key_append = 'joker_forge_random'
                            })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I cant stop winning!", colour = G.C.BLUE})
            end
            return true
        end}, card)
                    end
                if pseudorandom('group_1_7805fb97') < G.GAME.probabilities.normal * 25 / card.ability.extra.odds then
                        SMODS.calculate_effect({func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('SnipersTV_gamblecorefail')
                            SMODS.add_card({
                                set = 'Joker',
                                rarity = 'Common',
                                key_append = 'joker_forge_random'
                            })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Aw dangit!", colour = G.C.BLUE})
            end
            return true
        end}, card)
                    end
                if pseudorandom('group_2_eeeebcbf') < G.GAME.probabilities.normal * 14 / card.ability.extra.odds then
                        SMODS.calculate_effect({func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            SMODS.add_card({
                                set = 'Joker',
                                rarity = 'Uncommon',
                                key_append = 'joker_forge_random'
                            })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Aw dangit!", colour = G.C.BLUE})
            end
            return true
        end}, card)
                    end
                if pseudorandom('group_3_e4d9c421') < G.GAME.probabilities.normal * 10 / card.ability.extra.odds then
                        SMODS.calculate_effect({func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('SnipersTV_gamblecoresuccess')
                            SMODS.add_card({
                                set = 'Joker',
                                rarity = 'Rare',
                                key_append = 'joker_forge_random'
                            })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I cant stop winning!", colour = G.C.BLUE})
            end
            return true
        end}, card)
                    end
        end
    end
}

SMODS.Joker { --1Eggs
    name = "1Eggs",
    key = "_1eggs",
    config = {
        extra = {
            j_joker = 0,
            j_egg = 0,
            Xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = '1Eggs',
        ['text'] = {
            [1] = 'When blind is selected',
            [2] = 'destroys {C:attention}Joker{} to the right of it',
            [3] = 'and creates a {C:attention}Egg Joker{} in its place',
            [4] = '{C:attention}Egg Jokers{} give {X:mult,C:white}X1.5{} while you have this {C:attention}Joker{}',
            [5] = '{C:inactive}collect my eggs{}'
        }
    },
    pools = { ['SnipersTVAdditions'] = true },
    pos = {
        x = 0,
        y = 0
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'TinsCustomJokers',

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_egg" then
              return true
          end
      end
      return false
  end)() then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
        if context.setting_blind and not context.blueprint then
                return {
                    func = function()
                local my_pos = nil
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then
                        my_pos = i
                        break
                    end
                end
                local target_joker = nil
                if my_pos and my_pos < #G.jokers.cards then
                    local joker = G.jokers.cards[my_pos + 1]
                    if not joker.ability.eternal and not joker.getting_sliced then
                        target_joker = joker
                    end
                end
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                                target_joker:start_dissolve({ G.C.RED }, nil, 1.6)
                            return true
                        end
                    }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                            { message = "Egged!", colour = G.C.RED })
                end
                    return true
                end,
                    extra = {
                        func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_egg')
                            joker_card:add_to_deck()
                            G.jokers:emplace(joker_card)
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, { message = localize('k_plus_joker'), colour = G.C.BLUE })
            end
            return true
        end,
                        colour = G.C.BLUE
                        }
                }
        end
    end,
	credits = {
		art = { "Tinfoilbot65" },
		code = { "Tinfoilbot65" },
		idea = { "Tinfoilbot65" },
	},
}

SMODS.Joker { --Red and Blue Noobs
    name = "Red and Blue Noobs",
    key = "redandbluenoobs",
    config = {
        extra = {
            Xmult = 1.5
        }
    },
    pools = { ['SnipersTVAdditions'] = true },
    loc_txt = {
        ['name'] = 'Red and Blue Noobs',
        ['text'] = {
            [1] = 'This {C:attention}Joker{} grants {X:mult,C:white}X1.5{} Mult',
            [2] = 'for each {C:attention}played{} {C:red}Heart{}',
            [3] = 'and/or {C:blue}Club{}',
            [4] = '{C:inactive}Red and Blue, helping you!'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'TinsCustomJokers',

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit("Hearts") then
                return {
                    Xmult = 1.5
                }
            elseif context.other_card:is_suit("Clubs") then
                return {
                    Xmult = 1.5
                }
            end
        end
    end,
	credits = {
		art = { "Tinfoilbot65" },
		code = { "Tinfoilbot65" },
		idea = { "Tinfoilbot65" },
	},
}

SMODS.Joker { --MARIs Picnic
    name = "MARIs Picnic",
    key = "marispicnic",
    config = {
        extra = {
            hands = 3,
            discards = 3
        }
    },
    loc_txt = {
        ['name'] = 'MARI\'s Picnic',
        ['text'] = {
            [1] = 'Gives {C:blue}3 Hands{} and {C:red}3 Discards{}',
            [2] = 'when sold',
            [3] = '{C:inactive}All it costs is your love!{}'
        }
    },
    pools = { ['SnipersTVAdditions'] = true },
    pos = {
        x = 2,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'TinsCustomJokers',

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint then
                return {
                    func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                        { message = "+" .. tostring(card.ability.extra.hands) .. " Hand", colour = G.C.GREEN })
                G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + card.ability.extra.hands
                    play_sound('SnipersTV_marispicnicsell')
                return true
            end,
                    extra = {
                        func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                            { message = "+" .. tostring(card.ability.extra.discards) .. " Discard", colour = G.C.ORANGE })
                        G.GAME.current_round.discards_left = G.GAME.current_round.discards_left +
                            card.ability.extra.discards
                return true
            end,
                        colour = G.C.ORANGE,
                        extra = {
                            message = "You feel like new!",
                            colour = G.C.WHITE
                        }
                        }
                }
        end
    end,
    credits = {
        art = { "Tinfoilbot65" },
        code = { "Tinfoilbot65" },
        idea = { "Tinfoilbot65" },
    }
}
SMODS.Joker {
    key = 'MafiosoJoker',
	loc_txt = {
        name = 'Mafioso',
		text = {
			'Prevents death',
			'if chips scored is at least',
			'{C:chips}50%{} of required chips',
			'{C:red}Takes money when activated{}',
			'{C:red}and does not work while in debt{}',
            '{C:inactive}We are soldiers, and soldiers don\'t go to hell.{}'
			}
    },
    pools = { ['SnipersTVAdditions'] = true },
	atlas = 'MafiosoJoker',
	rarity = 3,
    cost = 10,
	unlocked = true,
	discovered = true,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,
    pos = { x = 0, y = 0 },
    config = { extra = {
		bankrupt_at = 20
		}
	},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.bankrupt_at } }
	end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt_at
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at
    end,
    calculate = function(self, card, context)
		if context.end_of_round and context.game_over and context.main_eval then 
		if to_big(G.GAME.chips) / to_big(G.GAME.blind.chips) >= to_big(0.50) and to_big(G.GAME.DOLLARS) >= to_big(0) then
        G.E_MANAGER:add_event(Event({
            func = function()
                G.hand_text_area.blind_chips:juice_up()
                G.hand_text_area.game_chips:juice_up()
                play_sound('SnipersTV_youwontlivetoseethenextday')
                ease_dollars(-20)
                return true
                        end
                    }))
            else
            play_sound('SnipersTV_justshutupandragequit')
            return true
            end
        return {
            message = localize('k_saved_ex'),
            saved = 'ph_mafioso',
            colour = G.C.RED
            }
        end
    end,
    credits = {
        art = { "Tinfoilbot65" },
        code = { "Tinfoilbot65" },
        idea = { "Tinfoilbot65" },
    }
}


SMODS.Joker { --Evil Blueprint
    name = "Evil Blueprint",
    key = "evilblueprint",
    config = {
        extra = {
            j_blueprint = 0,
            odds = 5,
            odds2 = 10
        }
    },
    loc_txt = {
        ['name'] = 'Evil Blueprint',
        ['text'] = {
            [1] = 'Copies ability of {C:attention}Joker{} to the left',
            [2] = 'There is a {C:green}#1# in #2#{} chance where it doesn\'t copy',
            [3] = 'After every round, there\'s a {C:green}#1# in #3#{} chance',
            [4] = 'to forgive its sins and turn back into a',
            [5] = 'regular {C:attention}Blueprint{}',
            [6] = '{C:inactive}I\'m feeling evil today...{}'
        }
    },
    pools = { ['SnipersTVAdditions'] = true },
    pos = {
        x = 0,
        y = 0
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'EvilBlueprint',

    loc_vars = function(self, info_queue, card)
    local other_joker
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i - 1] end
            end
        end
        local compatible = other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat
        main_end = (card.area and card.area == G.jokers) and {
            {
                n = G.UIT.C,
                config = { align = "bm", minh = 0.4 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                        nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                        }
                    }
                }
            }
        } or nil
        return {
            main_end = main_end,
            vars = { G.GAME and G.GAME.probabilities.normal or 1, card.ability.extra.odds, card.ability.extra.odds2 }
        }
    end,

	calculate = function(self, card, context)
        local other_joker = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i - 1] end
        end
        if pseudorandom('seed') < G.GAME.probabilities.normal / card.ability.extra.odds then
        else
            local other_joker = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i - 1] end
            end
            return SMODS.blueprint_effect(card, other_joker, context)
        end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if pseudorandom('group_0_822e51db') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        SMODS.calculate_effect({func = function()
						card:start_dissolve()
						return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Forgiven!", colour = G.C.BLUE})
                        SMODS.calculate_effect({func = function()
                        play_sound('SnipersTV_blueprintforgiven')
						local created_joker = false
						if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
							created_joker = true
							G.GAME.joker_buffer = G.GAME.joker_buffer + 1
							G.E_MANAGER:add_event(Event({
								func = function()
                            local joker_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_blueprint')
									joker_card:add_to_deck()
									G.jokers:emplace(joker_card)
									G.GAME.joker_buffer = 0
									return true
                        end
							}))
						end
						if created_joker then
							card_eval_status_text(
								context.blueprint_card or card,
								"extra",
								nil,
								nil,
								nil,
								{ message = localize("k_plus_joker"), colour = G.C.BLUE }
							)
						end
						return true
        end}, card)
			end
		end
	end,
	credits = {
		art = { "Tinfoilbot65" },
		code = { "Tinfoilbot65" },
		idea = { "Tinfoilbot65" },
	},
}
SMODS.Joker {
    name = "Steel Ticket",
    key = "steelticket",
    loc_txt = {
    name = "Steel Ticket",
    text = {
        'Played {C:attention}Steel{} cards earn {X:red,C:white}2x{} when scored',
        '{C:inactive}Man, the steel factory is plagarizing the design',
        '{C:inactive}of the golden factory\'s tickets? So lame dude. - blue'
    }
},
   pools = { ['SnipersTVAdditions'] = true },
    pos = { x = 0, y = 0 },
    atlas = "SteelTicket",
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self,info_queue, card)
             info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        return {{}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, 'm_steel') then
           card = card,
           message == 'X' .. 2,
           colour == G.C.MULT
           return {
            xmult = 2
        }
        end
    end,
        credits = {
        art = { "Tinfoilbot65" },
        code = { "Tinfoilbot65" },
        idea = { "Shan" },
    }
}

SMODS.Joker { -- OMORI
    name = "OMORI",
    key = "omori",
    loc_txt = {
        name = "OMORI",
        text = {
            'Whenever you first run out of hands in a round',
            'adds one more hand',
            '{X:money,C:white}#4#{}',
            '{C:inactive}Your friends will never forgive you.',
        }
    },
    pools = { ['SnipersTVAdditions'] = true },
    atlas = 'OMORIJoker',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        extra = {
            hands_remaining = 0,
            hands = 1,
            active = true,
            text = 'Active!',
        },
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands_remaining, card.ability.extra.hands, card.ability.extra.active, card.ability.extra.text
            },
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left == 0 and card.ability.extra.active == true or context.forcetrigger
        then
            return {
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                        { message = "OMORI didn\'t succumb.", colour = G.C.BLACK })
                    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + card.ability.extra.hands
                    play_sound('SnipersTV_omorisuccumb')
                    card.ability.extra.active = false
                    card.ability.extra.text = localize("k_inactive_ex")
                    return true
                end
            }
        end
        if context.end_of_round and card.ability.extra.active == false and context.main_eval and not context.retrigger_joker and not context.blueprint then
            card.ability.extra.active = true
            card.ability.extra.text = localize("k_active_ex")
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                        { message = "Active!", colour = G.C.RED })
        end
    end,
    credits = {
        art = { "Tinfoilbot65" },
        code = { "Tinfoilbot65" },
        idea = { "Tinfoilbot65" },
    }
}
SMODS.Atlas{
    key = 'controlsystem', 
    path = 'BorealisEngineJoker.png',
	px = 71,
    py = 95
}
SMODS.Joker { -- Control System
    name = "Control System",
    key = "controlsystem",
    config = { extra = { Xmult = 4, type = "Two Pair" } },
    pools = { ['SnipersTVAdditions'] = true },
    loc_txt = {
        ['name'] = 'Control System',
        ['text'] = {
        '{X:mult,C:white}X4{} Mult,', 
        'If played hand contains a:',
        '{C:attention}Two Pair{}.',
        '{C:inactive}solve my puzzles{}'
        }
    },
    pos = { x = 0, y = 0 },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'controlsystem',

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
    end,
	credits = {
		art = { "AstraX2" },
		code = { "bluesnipersguy" },
		idea = { "AstraX2" },
	},
}
SMODS.Joker { -- Parapsychology
    name = "Parapsychologist",
    key = "Parapsychologist",
    pools = { ['SnipersTVAdditions'] = true },
    loc_txt = {
        ['name'] = 'Parapsychologist',
        ['text'] = {
        'All {C:spectral}Spectral{} cards and', 
        '{C:spectral}Spectral Packs{} can',
        'appear in shop and are {C:attention}free{}',
        '{C:inactive}spectral cards are cool - blue{}'
        },
        ['unlock'] = {
        'Discover every',
        '{C:spectral}Spectral{} card',
        },
    },
    pos = { x = 0, y = 0 },
    config = { extra = { spectral_rate = 2, } },
    unlock_condition = { type = 'discover_amount',
        spectral_count = 18 },
    cost = 8,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = false,
    discovered = false,
  add_to_deck = function(self, card, from_debuff)
     G.GAME.spectral_rate = self.config.extra.spectral_rate    
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.spectral_rate = 0
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.I.CARD) do
                    if v.set_cost then v:set_cost() end
                end
                return true
            end
        }))
    end,
    credits = {
		art = { "N/A" },
		code = { "bluesnipersguy" },
		idea = { "bluesnipersguy" },
	},
}
local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    if next(SMODS.find_card("j_SnipersTV_Parapsychologist")) then
        if (self.ability.set == 'Spectral' or (self.ability.set == 'Booster' and self.config.center.kind == 'Spectral')) then self.cost = 0 end
        self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
        self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
    end
end

SMODS.Joker { -- Dr. Robotnik
    name = "Dr. Robotnik",
    key = "drrobotnik",
    loc_txt = {
        name = "Dr. Robotnik",
        text = {
            "Played {C:attention}face cards{}",
            "are turned into {C:attention}Steel Cards{}",
            "{C:inactive}Snooping as usual I see!{}",
        }
    },
    pools = { ['SnipersTVAdditions'] = true },
    atlas = 'DrRobotnikJoker',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local faces = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_face() then
                    faces = faces + 1
                    scored_card:set_ability('m_steel', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if faces > 0 then
                return {
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                        { message = "Steel", colour = G.C.MULT })
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            play_sound('SnipersTV_snooping')
        end
    end,
    credits = {
        art = { "Tinfoilbot65" },
        code = { "Tinfoilbot65" },
        idea = { "Tinfoilbot65" },
    }
}
SMODS.Joker {
    name = "Consumerism",
    key = "consumerism",
    config = { extra = { ConsumerismXmult = 1, ConsumerismXchips = 1, ConsumerismMult = 0, ConsumerismChips = 0 } },
    loc_txt = {
        ['name'] = 'Consumerism',
        ['text'] = {
            'When blind is selected',
            'destroy all {C:attention}Food{} Jokers',
            'gain {C:red}+5 Mult{} and {X:mult,C:white}X2{} Mult',
            'and gain {C:blue}+5 Chips{} and {X:chips,C:white}X2{} Chips',
            '{C:inactive} Current applying: {C:red}+#3# Mult{} and {X:mult,C:white}X#1#{} Mult{}.',
            '{C:inactive} Current applying: {C:blue}+#4# Chips{} and {X:chips,C:white}X#2#{} Chips{}.',
            '{C:inactive}weight gain is bad for you! - blue{}'
        }
    },
    pools = { ['SnipersTVAdditions'] = true },
    pos = {
        x = 0,
        y = 0
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.ConsumerismXmult,
                card.ability.extra.ConsumerismXchips,
                card.ability.extra.ConsumerismChips,
                card.ability.extra.ConsumerismMult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local food_jokers = {
                j_gros_michel = true,
                j_egg = true,
                j_ice_cream = true,
                j_cavendish = true,
                j_turtle_bean = true,
                j_diet_cola = true,
                j_popcorn = true,
                j_ramen = true,
                j_selzer = true,
                j_SnipersTV_marispicnic = true,
            }

            for i = 1, #G.jokers.cards do
                local joker = G.jokers.cards[i]
                local found_jokers = {}
                if table_contains(food_jokers, joker.config.center_key) then
                    found_jokers[#found_jokers + 1] = joker
                end
                local found_joker = pseudorandom_element(found_jokers, 'sniperstvcorp_consumerism')
                if found_joker then
                    found_joker.getting_sliced = true

                    G.E_MANAGER:add_event(Event({
                        func = function()
                            found_joker:start_dissolve({ G.C.RED }, nil, 1.6)
                            return true
                        end
                    }))

                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                        message = "Eaten!", colour = G.C.RED
                    })

                    card.ability.extra.ConsumerismXmult = card.ability.extra.ConsumerismXmult + 2
                    card.ability.extra.ConsumerismXchips = card.ability.extra.ConsumerismXchips + 2
                    card.ability.extra.ConsumerismMult = card.ability.extra.ConsumerismMult + 5
                    card.ability.extra.ConsumerismChips = card.ability.extra.ConsumerismChips + 5
                end
            end
        end
         if context.joker_main then
            return {
                mult = card.ability.extra.ConsumerismMult,
                xmult = card.ability.extra.ConsumerismXmult,
                chips = card.ability.extra.ConsumerismChips,
                xchips = card.ability.extra.ConsumerismXchips
            }
        end
    end,

    credits = {
        art = { "N/A" },
        code = { "bluesnipersguy" },
        idea = { "Shan" }
    }
}

SMODS.Joker { -- Shigesato Itoi
    name = "Shigesato Itoi",
    key = "shigesatoitoi",
    loc_txt = {
        name = "Shigesato Itoi",
        text = {
            "If played hand is {C:attention}Two Pair{}",
            "and the only suit is Hearts,",
            "{C:red}destroy{} a random {C:attention}Joker{} if any exist",
            "and adds varying {X:red,C:white}XMult{}",
            "{C:inactive}(Currently{} {X:red,C:white}X#1#{}{C:inactive}){}",
            "{C:inactive}I'm betting Jimbo solos Giygas. - Tin{}",
        }
    },
    pos = { x = 0, y = 0 },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    pools = { ['SnipersTVAdditions'] = true },
    config = {
        extra = {
            xmult = "1",
            type = "Two Pair",
            odds = "15",
            xmultadd1 = "1982",
            xmultadd2 = "1994",
            xmultadd3 = "2006",
        }
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
        if context.cardarea == G.jokers and context.joker_main then
            if (context.poker_hands[card.ability.extra.type] and (function()
                    local allMatchSuit = true
                    for i, c in ipairs(context.scoring_hand) do
                        if not (c:is_suit("Hearts")) then
                            allMatchSuit = false
                            break
                        end
                    end

                    return allMatchSuit and #context.scoring_hand > 0
                end)()) then
                if pseudorandom('shigesatomother3') < G.GAME.probabilities.normal / card.ability.extra.odds then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd3
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT
                    }
                end
                if pseudorandom('shigesatoearthbound') < G.GAME.probabilities.normal * 10 / card.ability.extra.odds then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd2
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT
                    }
                end
                if pseudorandom('shigesatomother1') < G.GAME.probabilities.normal * 5 / card.ability.extra.odds then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmultadd1
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT
                    }
                end
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and
                    pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil

                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({ G.C.RED }, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                        { message = "Destroyed!", colour = G.C.RED })
                end
            end
        end
    end,
    credits = {
        art = { "N/A" },
        code = { "Tinfoilbot65" },
        idea = { "Masked Man" },
    }
}

SMODS.Rarity:take_ownership("Common", {
	key = "Common",
	loc_txt = {},
	default_weight = 0.7,
    badge_colour = HEX('009dff'),
	get_weight = function(self, weight, object_type)
        local eggs = find_joker('j_SnipersTV_Egg')
		if #eggs > 0 then
			local chance_mod = 0
            for key,egg in ipairs(eggs) do
				chance_mod = chance_mod + egg.ability.extra.BuffedOdds
			end
			chance_mod = 1.0 - math.min(chance_mod, 0.5)
			return weight * chance_mod
		end

		return weight
	end,
})

SMODS.Rarity:take_ownership("Uncommon", {
	key = "Uncommon",
	loc_txt = {},
	default_weight = 0.25,
	badge_colour = HEX("4BC292"),
	get_weight = function(self, weight, object_type)
        local eggs = find_joker('j_SnipersTV_Egg')
		if #eggs > 0 then
			local chance_mod = 0
            for key,egg in ipairs(eggs) do
				chance_mod = chance_mod + egg.ability.extra.BuffedOdds
			end
			chance_mod = 1.0 - math.min(chance_mod, 0.5)
			return weight * chance_mod
		end

		return weight
	end,
})

SMODS.Rarity:take_ownership("Rare", {
	key = "Rare",
	loc_txt = {},
	default_weight = 0.05,
    badge_colour = HEX('fe5f55'),
	get_weight = function(self, weight, object_type)
        local eggs = find_joker('j_SnipersTV_Egg')
		if #eggs > 0 then
			local chance_mod = 0
            for key,egg in ipairs(eggs) do
				chance_mod = chance_mod + egg.ability.extra.BuffedOdds
			end
			chance_mod = 1.0 - math.min(chance_mod, 0.5)
			return weight * chance_mod
		end

		return weight
	end,
})

SMODS.Rarity:take_ownership("Legendary", {
	key = "Legendary",
	loc_txt = {},
	default_weight = 0.0,
	badge_colour = HEX("b26cbb"),
	get_weight = function(self, weight, object_type)
        local eggs = find_joker('j_SnipersTV_Egg')
		if #eggs > 0 then
			local chance_mod = 0
            for key,egg in ipairs(eggs) do
				chance_mod = chance_mod + egg.ability.extra.BuffedOdds
			end
			chance_mod = math.min(chance_mod, 0.5)
			return chance_mod
		end

		return weight
	end,
})

--[[
Yummer
Rarity: Legendary
Uprades EVERY card in deck
Copies it for next 3 rounds,
After the first 3 rounds,
It give 1.5 mult,
gets destroyed after 15 hands.
(Credit to Masked Man)
]]
--[[
[CLASSIFIED]
Rarity: Rare
For each selected blind, gain X0.5mult and increse gain by 2 dollars.
Starts out at 1X and 2 dollars.
Obscures all vital information until sold.
]]