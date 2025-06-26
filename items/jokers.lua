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
        text = {'For each {C:blue}Blueprint{} and {C:red}Brainstorm{} equipped,',
                'retrigger all {C:blue}Blueprint{} and {C:red}Brainstorm{} Jokers an extra time.',
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
        return { vars = {center.ability.extra.ForestRetriggers} }
    end,
    check_for_unlock = function(self)
        unlock_card(self)
    end,
    add_to_deck = function (self, card, from_debuff)
        self:calculate_retrigs(card)
    end,
    calculate_retrigs = function(self, card)
        local count = 0
        for _, j in ipairs(G.jokers.cards) do
            local name = j.ability and j.ability.name
            if name == "Blueprint" or name == "Brainstorm" then
                count = count + 1
            end
        end
        card.ability.extra.ForestRetriggers = count
    end,
    calculate = function(self, card, context)
        if context.retrigger_joker_check and not context.retrigger_joker then
            local name = context.other_card.ability and context.other_card.ability.name
            if name == "Blueprint" or name == "Brainstorm" then
                return {
                    repetitions = card.ability.extra.ForestRetriggers,
                    message = "There ya go! :3c"
                }
            end
        end
        if context.card_added then
            local name = context.card.ability and context.card.ability.name
            if name == "Blueprint" or name == "Brainstorm" then
                card.ability.extra.ForestRetriggers = card.ability.extra.ForestRetriggers + 1
                return {
                    message = "Welcome :3c"
                }
            end
        end
        if context.selling_card then
            local name = context.card.ability and context.card.ability.name
            if name == "Blueprint" or name == "Brainstorm" then
                card.ability.extra.ForestRetriggers = card.ability.extra.ForestRetriggers - 1
                return {
                    message = "Rest in peace 3:"
                }
            end
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
                 'For each {C:attention}consectutive{}',
                 '{C:red}discarded{} {C:attention}face{} card,',
                 'that is not a {C:attention}Queen{}.',
                 'This joker gains {X:mult,C:white}X0.25{} Mult{}.',
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
SMODS.Joker{
    key = 'Egg',
    loc_txt= {
        name = 'Egg',
        text = { '{C:red}Rare{} Jokers are much more common in shop.',
                '{C:legendary}Legendary{} jokers can also appear in shop as well.',
                '{C:inactive}These damn script kiddies. - blue',
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
    check_for_unlock = function(self)
        unlock_card(self)
    end,
}
--[[
Landscape
Rarity: Rare
Joker starts at x1 mult, every face card played will add 0.5 mult to joker, 
Every non face card played subtracts 0.5 mult. 
Every face card discarded permanently adds 20 chips to card.
Retrigger both once if both are held.
(Credit to Masked Man)
]]
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