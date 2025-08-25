SMODS.Consumable({
    key = 'rdeath',
    set = 'reversetarot',
    loc_txt = {
        name = "Death?",
        text = {
            "Generates a {C:planet}Planet{} card",
            "for your most and least",
            "played {C:attention}poker hand{}",
            "{C:inactive}(Random if tied){}",
        },
    },

    atlas = 'reversetarots',
    pos = { x = 3, y = 1 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card) end,

    use = function(self, card, area, copier)
        local hands = {}
        local timesplayed = 0
        for _, v in ipairs(G.P_CENTER_POOLS.Planet) do
            local hand = G.GAME.hands[v.config.hand_type]
            if hand.played > timesplayed or #hands == 0 then
                hands = {}
                hands[1] = v.key
                timesplayed = hand.played
            elseif hand.played == timesplayed then
                hands[#hands + 1] = v.key
            end
        end
        SMODS.add_card({ key = pseudorandom_element(hands, pseudoseed('rdeath')), no_edition = true })
        local hands = {}
        local timesplayed = 1000000
        for _, v in ipairs(G.P_CENTER_POOLS.Planet) do
            local hand = G.GAME.hands[v.config.hand_type]
            if hand.played < timesplayed or #hands == 0 then
                hands = {}
                hands[1] = v.key
                timesplayed = hand.played
            elseif hand.played == timesplayed then
                hands[#hands + 1] = v.key
            end
        end
        if #G.consumeables.cards < G.consumeables.config.card_limit then
            SMODS.add_card({ key = pseudorandom_element(hands, pseudoseed('rdeath')), no_edition = true })
        end
    end,

    can_use = function(self, card)
        return true
    end,
})
