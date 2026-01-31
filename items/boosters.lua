--[[SMODS.Atlas{
    key = 'boosteratlas',
    path = 'boosteratlas.png',
    px = 71,
    py = 96,
}
--]]

SMODS.Sound({
    key = "music_shopping", 
    path = "shopping.ogg",
    pitch = 1,
    volume = 1,
    select_music_track = function()
		return G.STATE == G.STATES.SMODS_BOOSTER_OPENED and G.pack_cards 
        and SMODS.OPENED_BOOSTER and SMODS.OPENED_BOOSTER.config.center.kind == 'SnipersTVPack' and 2
	end,
})

-- Booster Pack 1
SMODS.Booster{
    key = 'booster_sniperstv',
    -- atlas = 'boosteratlas', 
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_txt= {
        name = 'Chaos Pack',
        text = { "Pick {C:attention}#1#{} card out",
                "{C:attention}#2#{} hand-selected jokers!", },
        group_name = "Chaos Pack",
    },
    
    draw_hand = false,
    config = {
        extra = 2,
        choose = 1, 
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,

    weight = 1,
    cost = 5,
    kind = "SnipersTVPack",
    ease_background_colour = function(self)
		ease_background_colour({ new_colour = HEX("0094FF"), special_colour = HEX("FFFFFF"), contrast = 1.2 })
	end,
    create_card = function(self, card, i)
        return SMODS.create_card({
            set = "SnipersTVAdditions",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
        })
    end,
    select_card = 'jokers',

    in_pool = function() return true end
}
SMODS.Booster{
    key = 'booster_sniperstvII',
    -- atlas = 'boosteratlas', 
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_txt= {
        name = 'Chaos Pack II: Electric Boogaloo',
        text = { "Pick {C:attention}#1#{} card out",
                "{C:attention}#2#{} hand-selected jokers!", },
        group_name = "Chaos Pack II",
    },
    
    draw_hand = false,
    config = {
        extra = 4,
        choose = 1, 
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,

    weight = 1,
    cost = 5,
    kind = "SnipersTVPack",
    ease_background_colour = function(self)
		ease_background_colour({ new_colour = HEX("0094FF"), special_colour = HEX("FFFFFF"), contrast = 1.2 })
	end,
    create_card = function(self, card, i)
        return SMODS.create_card({
            set = "SnipersTVAdditions",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
        })
    end,
    select_card = 'jokers',

    in_pool = function() return true end
}
SMODS.Booster{
    key = 'booster_sniperstvIII',
    -- atlas = 'boosteratlas', 
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_txt= {
        name = 'Chaos Pack III: Mega Edition',
        text = { "Pick {C:attention}#1#{} cards out",
                "{C:attention}#2#{} hand-selected jokers!", },
        group_name = "Chaos Pack III",
    },
    
    draw_hand = false,
    config = {
        extra = 5,
        choose = 2, 
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,

    weight = 1,
    cost = 5,
    kind = "SnipersTVPack",
    ease_background_colour = function(self)
		ease_background_colour({ new_colour = HEX("0094FF"), special_colour = HEX("FFFFFF"), contrast = 1.2 })
	end,
    create_card = function(self, card, i)
        return SMODS.create_card({
            set = "SnipersTVAdditions",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
        })
    end,
    select_card = 'jokers',

    in_pool = function() return true end
}