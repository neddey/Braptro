SMODS.Consumable {
    key = 'rtower',
    set = 'reversetarot',
    loc_txt = {
        name = 'Tower?',
        text = {
            "Add a {C:attention}Blue Seal{}",
            "to a random",
            "cards in your hand",
        },
    },

    atlas = 'reversetarots',
    pos = { x = 6, y = 1 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS['Blue']
    end,

    use = function(self, card, area, copier)
            local sealable_cards = {}
            for i = 1, #G.hand.cards do
                if not G.hand.cards[i].seal then
                    sealable_cards[#sealable_cards + 1] = G.hand.cards[i]
                end
            end

            if sealable_cards then
                pseudorandom_element(sealable_cards, pseudoseed("rtower")):set_seal('Blue', nil, true)
            end
    end,

    can_use = function(self, card)
        return #G.hand.cards >= 1
    end,
}
