SMODS.Consumable {
    key = 'rlovers',
    set = 'reversetarot',
    loc_txt = {
        name = 'Lovers?',
        text = {
            "Add a {C:attention}Purple Seal{}",
            "to {C:attention}2{} random",
            "cards in your hand",
        },
    },

    atlas = 'reversetarots',
    pos = { x = 6, y = 0 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS['Purple']
    end,

    use = function(self, card, area, copier)
            for i = 1, 2 do
            local sealable_cards = {}
            for i = 1, #G.hand.cards do
                if not G.hand.cards[i].seal then
                    sealable_cards[#sealable_cards + 1] = G.hand.cards[i]
                end
            end

            local seal_card = pseudorandom_element(sealable_cards, pseudoseed("rlovers"))
            if seal_card then
                seal_card:set_seal('Purple', nil, true)
            end
        end
    end,

    can_use = function(self, card)
        return #G.hand.cards >= 1
    end,
}
