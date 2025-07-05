SMODS.Atlas{
    key = 'ForestJoker',
    path = 'ForestJoker.png',
    px = 69,
    py = 96,
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
    pools = { ['SnipersTVAdditions'] = true },
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
    config = { extra = { ForestRetriggers = 0, } },
    loc_vars = function(self, info_queue, center)
        return { vars = {#G.jokers.cards} }
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    calculate = function(self, card, context)
        if context.retrigger_joker_check then
            local name = context.other_card.ability and context.other_card.ability.name
            return {
                repetitions = #G.jokers.cards,
                message = "There ya go! :3c"
            }
        end
        if context.card_added then
            local name = context.card.ability and context.card.ability.name
            card.ability.extra.ForestRetriggers = card.ability.extra.ForestRetriggers + 1
            return {
                message = "Welcome :3c"
            }
        end
        if context.selling_card then
            local name = context.card.ability and context.card.ability.name
            card.ability.extra.ForestRetriggers = card.ability.extra.ForestRetriggers - 1
            return {
                message = "Rest in peace 3:"
            }
        end
    end,
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
    pools = { ['SnipersTVAdditions'] = true },
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
    pools = { ['SnipersTVAdditions'] = true },
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
        text = { '{C:red}Rare{} Jokers are much more common in shop.',
                '{C:legendary}Legendary{} jokers can also appear in shop as well.',
                '{C:inactive}These damn script kiddies. - blue',
            }
    },
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
}

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
        text = { 'For each scored {C:attention}face{} card, gain {X:mult,C:white}X0.50{} Mult{}, if discarded, gain {C:blue}20 Chips{}.',
                 'For each scored non-{C:attention}face{} card, lose {X:mult,C:white}X0.50{} Mult{}, if discarded, lose {C:blue}20 Chips{}.',
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
    end
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
            "Turns all played {C:attention}Kings{} and {C:attention}Jacks{}",
            "into {C:attention}Queens{}.",
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
    end
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
            '{C:inactive}IS THAT {C:legendary}SOURCHAOSCANDY{} FROM THE HIT SERVICE TWITCH? - blue{}'
        }
    },
    pools = { ["SnipersTVAdditions"] = true },
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
                if not scored_card:get_id() == 12 then    
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
    end
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
}

SMODS.Rarity:take_ownership("Common", {
    key = "Common",
    loc_txt = {},
    default_weight = 0.7,
    badge_colour = HEX('009dff'),
    get_weight = function(self, weight, object_type)
        if #find_joker('j_SnipersTV_Egg') > 0 then
            return 0.55
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
        if #find_joker('j_SnipersTV_Egg') > 0 then
            return 0.15
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
        if #find_joker('j_SnipersTV_Egg') > 0 then
            return 0.25
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
        if #find_joker('j_SnipersTV_Egg') > 0 then
            return 0.05
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
--[[
Goated Temperance
For each dollar in all combined Joker sell value.
This Joker gains X1.1 mult.
(Excluding Egg)
(Credit to WPawnToE4)
]]
--[[
Shigesato Itoi Joker: 
If played hand contains a two pair that has ONLY hearts, 
It destroys all jokers but has a 
1/10 to add X1982 mult, 
1/5 chance to Add x1994 Mult,
1/15 chance to add X2006 mult
(Credit to Masked Man)
]]
--[[
fat ahh joker
if there's a food joker in your joker slots
destroy it
gain 
2x mult 
5 mult 
2x chips
5 chips
(Credit to Shan)
]]
--[[
Steel Ticket
Each scored steel card gives 2X mult.
(kinda goated)
(Credit to Shan)
]]