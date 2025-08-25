SMODS.Consumable({
    key = 'remperor',
    set = 'reversetarot',
    loc_txt = {
        name = "The Emperor?",
        text = {
            "Destroys {C:attention}2{} selected cards",
            "Destroys {C:attention}2{} more random cards",
        },
    },

    atlas = 'reversetarots',
    pos = { x = 4, y = 0 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card) end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            SMODS.destroy_cards(G.hand.highlighted[i])
        end

        for i = 1, math.min(2, #G.hand.cards) do
            local destructable_cards = {}
            for i = 1, #G.hand.cards do
                if not G.hand.cards[i].getting_sliced then
                    destructable_cards[#destructable_cards + 1] = G.hand.cards[i]
                end
            end

            local card_to_destroy = pseudorandom_element(destructable_cards, pseudoseed('remperor'))

            card_to_destroy.getting_sliced = true
            SMODS.destroy_cards(card_to_destroy)

        end
    end,

    can_use = function(self, card)
        return #G.hand.highlighted >= 1 and #G.hand.highlighted <= 2
    end,
})
