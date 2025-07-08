SMODS.Atlas({
	key = "ForestDeck",
	path = "ForestDeck.png",
	px = 69,
	py = 93,
})
SMODS.Atlas({
	key = "OyasumiDeck",
	path = "OyasumiDeck.png",
	px = 69,
	py = 93,
})

SMODS.Back({
	key = "ForestDeck",
	loc_txt = {
		name = "Forest Deck",
		text = {
			"Start with 2 Jokers,",
			"a {C:inactive}Negative,{} {C:legendary}Legendary{} {C:green}Forest{} Joker",
			"and a {C:red}Rare{} {C:blue}Blueprint{} Joker",
			"{C:attention}+1{} Joker Slot",
		},
	},

	config = { joker_slot = 1 },
	atlas = "ForestDeck",
	pos = { x = 0, y = 0 },
	order = 1,
	unlocked = true,

	apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = SMODS.create_card({
						set = "Joker",
						key = "j_SnipersTV_ForestJoker",
						edition = "e_negative",
						area = G.jokers,
					})
					card:add_to_deck()
					G.jokers:emplace(card)
					local card = SMODS.create_card({
						set = "Joker",
						key = "j_blueprint",
						area = G.jokers,
					})
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
SMODS.Atlas({
	key = "DarkDeck",
	path = "DarkDeck.png",
	px = 69,
	py = 93,
})

SMODS.Back({
	key = "DarkDeck",
	loc_txt = {
		name = "Gentleman Deck",
		text = {
			"Start with 2 Jokers,",
			"a {C:legendary}Legendary{} {C:red}Harold{} Joker,",
			"a {C:red}Rare DNA{} Joker,",
			"and 2 {C:attention}copies{} of Death.",
		},
	},
	atlas = "DarkDeck",
	pos = { x = 0, y = 0 },
	config = { consumables = { "c_death", "c_death" } },
	order = 1,
	unlocked = true,

	apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = SMODS.create_card({
						set = "Joker",
						key = "j_SnipersTV_DarkJoker",
						area = G.jokers,
					})
					card:add_to_deck()
					G.jokers:emplace(card)
					local card = SMODS.create_card({
						set = "Joker",
						key = "j_dna",
						area = G.jokers,
					})
					card:add_to_deck()
					G.jokers:emplace(card)
					return true
				end
			end,
		}))
	end,
})
SMODS.Back({
	key = "EggDeck",
	loc_txt = {
		name = "RNGJesus Deck",
		text = {
			"Start with a",
			"{C:rare} Rare{} {C:red}Egg (illudethis){} Joker",
		},
	},
	pos = { x = 0, y = 0 },
	order = 1,
	unlocked = true,

	apply = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				if G.jokers then
					local card = SMODS.create_card({
						set = "Joker",
						key = "j_SnipersTV_Egg",
						area = G.jokers,
					})
					card:add_to_deck()
					G.jokers:emplace(card)
					return true
				end
			end,
		}))
	end,
})
SMODS.Back({
	key = "HoarderDeck",
	loc_txt = {
		name = "Hoarders Deck",
		text = {
			"A combination of:",
			"The {C:red}Red{},{C:blue}Blue{},{C:attention}Yellow{},{C:green}Green{}, and {C:black}Black{} Decks.",
			"{C:blue}+1{} Hand, {C:red}+1{} Discard, {C:attention}+1{} Joker Slot.",
			"Start with {C:attention}$10{}.",
			"{C:attention}$2{} dollars per {C:blue}hand{} left.",
			"{C:attention}$1{} per {C:blue}discard{} left.",
		},
	},

	config = { hands = 1, discards = 1, dollars = 10, extra_hand_bonus = 2, extra_discard_bonus = 1, joker_slot = 1 },
	pos = { x = 0, y = 0 },
	order = 1,
	unlocked = true,
	check_for_unlock = function(self, args)
		unlock_card(self)
	end,
})
SMODS.Back({
	key = "Utopia Deck",
	loc_txt = {
		name = "Utopia Deck",
		text = {
			"Start run with",
			"no {C:attention}Aces{} & {C:attention}Number{} Cards",
			"{C:inactive}what? it's just reverse abandoned - blue",
		},
	},
	apply = function()
		G.E_MANAGER:add_event(Event({
			func = function()
				for i = #G.playing_cards, 1, -1 do
					local card = G.playing_cards[i]
					if not card:is_face() then
						card:remove()
					end
				end
				return true
			end,
		}))
	end,

	pos = { x = 0, y = 0 },
	order = 1,
	unlocked = true,
	check_for_unlock = function(self, args)
		unlock_card(self)
	end,
})

SMODS.Back({
    key = "OyasumiDeck",
    loc_txt = {
        name = "Oyasumi Deck",
        text = {
            "Start with {C:attention}MARIs Picnic{}",
            "and only have Spades in your deck",
        },
    },

	atlas = "OyasumiDeck",
    order = 1,
    unlocked = true,

    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    local card = SMODS.create_card({
                        set = "Joker",
                        key = "j_tinsdumb_marispicnic",
                        area = G.jokers,
                    })
                    card:add_to_deck()
                    G.jokers:emplace(card)
                end
                for k, v in pairs(G.playing_cards) do
                        if not v:is_suit("Spades") then
                            v:start_dissolve()
                        end
                    end
                return true
            end}))
    end,

    check_for_unlock = function(self, args)
        unlock_card(self)
    end,
})

--[[ 
NEXT DECK!
Bonkers Deck!
A Combination of Magic, Nebula, Zodiac, Ghost, Anaglyph, Abandonded, Erratic, and Plasma.
Benefits:
too long to write rn
(Credit to MaskedMan)
]]
--[[
NEXT NEXT DECK!
Moneymaxxing Deck!
Start with 1 Goated Temperance
and A negative Gift Card.
(Credit to WPawnToE4)
]]
