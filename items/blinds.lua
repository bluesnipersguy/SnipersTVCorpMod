SMODS.Blind {
    key = "EA",
    loc_txt  =  {
        name = "EA Sports",
        text = {
            "its in the game",
            "Lose $1 per card played",
            "Below $10 all cards are debuffed."
        }
    },
    dollars = 5,
    mult = 2,
    pos = { x = 0, y = 22 },
    boss = { min = 2 },
    boss_colour = HEX("b52d2d"),
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.press_play then
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        for i = 1, #G.play.cards do
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.play.cards[i]:juice_up()
                                    return true
                                end,
                            }))
                            ease_dollars(-1)
                            delay(0.23)
                        end
                        return true
                    end
                }))
                blind.triggered = true
                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = (function()
                        SMODS.juice_up_blind()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.06 * G.SETTINGS.GAMESPEED,
                            blockable = false,
                            blocking = false,
                            func = function()
                                play_sound('tarot2', 0.76, 0.4)
                                return true
                            end
                        }))
                        play_sound('tarot2', 1, 0.4)
                        return true
                    end)
                }))
                delay(0.4)
            end
            if context.debuff_card and context.debuff_card.playing_card and G.GAME.dollars < 10 then
                return { debuff = true }
            end

            if context.after then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for k,v in pairs(G.playing_cards) do 
                            SMODS.recalc_debuff(v)
                        end
                        delay(0.23)
                        return true
                    end
                }))
            end
        end
    end
}
SMODS.Blind {
    key = "EvenSteven",
    loc_txt  =  {
        name = "Even Judgement",
        text = {
            "Even Steven is upset.",
            "All even cards are debuffed."
        }
    },
    dollars = 5,
    mult = 2,
    pos = { x = 0, y = 22 },
    boss = { min = 2 },
    boss_colour = HEX("FA433D"),
    calculate = function(self, card, context)
        if context.debuff_card then local id = context.debuff_card:get_id() 
            if id and id <= 10 and id >= 0 and id % 2 == 0 then 
                return { debuff = true } 
            end 
        end
    end,
    disable = function(self)
        if context.debuff_card then local id = context.debuff_card:get_id() 
            if id and id <= 10 and id >= 0 and id % 2 == 1 then 
                return { debuff = false } 
            end 
        end
    end
}
SMODS.Blind {
key = "EXTRATHICC",
    loc_txt  =  {
        name = "EXTRA THICC",
        text = {
            "EXTRA THICC BLIND",
            "good fucking luck",
        }
    },
    dollars = 5,
    mult = 16,
    pos = { x = 0, y = 9 },
    boss = { min = 2 },
    boss_colour = HEX("8a71e1"),
    disable = function(self)
        G.GAME.blind.chips = G.GAME.blind.chips / 16
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
}
SMODS.Blind {
key = "EXTRATHICC2",
    loc_txt  =  {
        name = "EXTRA THICC^2",
        text = {
            "you are so fucked",
            "good fucking luck",
        }
    },
    dollars = 5,
    mult = 32,
    boss = { showdown = true },
    pos = { x = 0, y = 9 },
    boss_colour = HEX("8a71e1"),
    disable = function(self)
        G.GAME.blind.chips = G.GAME.blind.chips / 16
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
}
SMODS.Blind {
    key = "OddTodd",
    loc_txt  =  {
        name = "An Oddity",
        text = {
            "Odd Todd is being odd.",
            "All odd cards are debuffed."
        }
    },
    dollars = 5,
    mult = 2,
    boss_colour = HEX("0490FB"),
    pos = { x = 0, y = 26 },
    boss = { min = 2 },
    calculate = function(self, card, context)
        if context.debuff_card then local id = context.debuff_card:get_id() 
            if id and id <= 10 and id >= 0 and id % 2 == 1 then 
                return { debuff = true } 
            end 
        end
    end,
    disable = function(self)
        if context.debuff_card then local id = context.debuff_card:get_id() 
            if id and id <= 10 and id >= 0 and id % 2 == 1 then 
                return { debuff = false } 
            end 
        end
    end
}