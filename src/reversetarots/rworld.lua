SMODS.Consumable({
    key = 'rworld',
    set = 'reversetarot',
    loc_txt = {
        name = "The World?",
        text = {
            "Gives a random {C:attention}enhancement{}",
            "to every {C:diamonds}diamond{} in hand",
            "rerolls {C:attention}enhancements{} for",
            "already {C:attention}enhanced{} cards.",
        },
    },

    atlas = 'reversetarots',
    pos = { x = 1, y = 2 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card) end,

    use = function(self, card, area, copier)
        local diamondcards = {}
        for i = 1, #G.hand.cards do
            if G.hand.cards[i]:is_suit('Diamonds') then
                diamondcards[#diamondcards + 1] = G.hand.cards[i]
            end
        end

        if #diamondcards >= 1 then
            for i = 1, #diamondcards do
                diamondcards[i]:set_ability(G.P_CENTERS[SMODS.poll_enhancement({guaranteed = 'true', type_key = 'rstar'})])
            end
        end
    end,

    can_use = function(self, card)
        return #G.hand.cards >= 1
    end,
})
