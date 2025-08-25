SMODS.Consumable({
    key = 'rmoon',
    set = 'reversetarot',
    loc_txt = {
        name = "Moon?",
        text = {
            "Gives a random {C:attention}enhancement{}",
            "to every {C:hearts}heart{} in hand",
            "rerolls {C:attention}enhancements{} for",
            "already {C:attention}enhanced{} cards.",
        },
    },

    atlas = 'reversetarots',
    pos = { x = 8, y = 1 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card) end,

    use = function(self, card, area, copier)
        local heartcards = {}
        for i = 1, #G.hand.cards do
            if G.hand.cards[i]:is_suit('Hearts') then
                heartcards[#heartcards + 1] = G.hand.cards[i]
            end
        end

        if #heartcards >= 1 then
            for i = 1, #heartcards do
                heartcards[i]:set_ability(G.P_CENTERS[SMODS.poll_enhancement({guaranteed = 'true', type_key = 'rmoon'})])
            end
        end
    end,

    can_use = function(self, card)
        return #G.hand.cards >= 1
    end,
})
