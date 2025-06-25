SMODS.Atlas{
    key = 'ForestDeck',
    path = 'ForestDeck.png', 
    px = 69,
    py = 93,
}
SMODS.Back({
    key = "ForestDeck",
    loc_txt = {
        name = "Forest Deck",
        text = {
            "Start with 2 Jokers,",
            "a {C:eternal}Eternal,{} {C:negative}Negative{}",
            "{C:legendary}Legendary{} {C:green}Forest{} Joker",
            "and a {C:blue}Blueprint{} Joker",
            "{C:attention}+1{} Joker Slot",
        }
    },

    config = { hands = 0, discards = 0, jokerspace = 1},
    atlas = 'ForestDeck',
    pos = { x = 0, y = 0 },
    order = 1,
    unlocked = true,

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local card = SMODS.create_card{
                        set = 'Joker',
                        key = 'j_SnipersTV_ForestJoker',
                        edition = 'e_negative',
                        sticker = 's_eternal',
                        area = G.jokers
                    }
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    local card = SMODS.create_card{
                        set = 'Joker',
                        key = 'j_blueprint',
                        area = G.jokers
                    }
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    return true
                end
            end,
        }))
    end,

    check_for_unlock = function(self, args)
        unlock_card(self)
    end,
})
SMODS.Atlas{
    key = 'DarkDeck',
    path = 'DarkDeck.png', 
    px = 69,
    py = 93,
}
SMODS.Back({
    key = "DarkDeck",
    loc_txt = {
        name = "Gentleman Deck",
        text = {
            "Start with a",
            "{C:legendary} Legendary{} {C:red} Harold{} Joker"
        },
    },

    config = { hands = 0, discards = 0,},
    atlas = 'DarkDeck',
    pos = { x = 0, y = 0 },
    order = 1,
    unlocked = true,

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local card = SMODS.create_card{
                        set = 'Joker',
                        key = 'j_SnipersTV_DarkJoker',
                        area = G.jokers
                    }
                    card:add_to_deck()
                    G.jokers:emplace(card)
                    return true
                end
            end,
        }))
    end,

    check_for_unlock = function(self, args)
        unlock_card(self)
    end,
})
--[[
NEXT DECK!
Hoarders Deck!
A Combination of Red, Black, Blue, Green, and Yellow Deck.
Benefits:
+1 hand
+1 Discard
Start with 10$
1 extra Joker Slot
2 Dollars per left hand
1 dollar per left discard.
]]
--[[
NEXT NEXT DECK!
Bonkers Deck!
A Combination of Magic, Nebula, Zodiac, Ghost, Anaglyph, Abandonded, Erratic, and Plasma.
Benefits:
too long to write rn
]]