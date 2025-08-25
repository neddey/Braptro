SMODS.Consumable({
    key = 'rchariot',
    set = 'reversetarot',
    loc_txt = {
        name = "Chariot?",
        text = {
            "Enhances {C:attention}2{} selected cards",
            "into a {C:attention}Glass Card{}",
            "destroys {C:attention}2{} more random cards",
        },
    },

    atlas = 'reversetarots',
    pos = { x = 7, y = 0 },
    --config = { mod_conv = 'm_glass' },
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_glass']
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_glass'])
        end
        for i = 1, math.min(2, #G.hand.cards - #G.hand.highlighted) do
            local destructable_cards = {}
            for i = 1, #G.hand.cards do
                if not G.hand.cards[i].highlighted and not G.hand.cards[i].getting_sliced then
                    destructable_cards[#destructable_cards + 1] = G.hand.cards[i]
                end
            end

            local card_to_destroy = pseudorandom_element(destructable_cards, pseudoseed('rchariot'))

            card_to_destroy.getting_sliced = true
            SMODS.destroy_cards(card_to_destroy)
        end
    end,

    can_use = function(self, card)
        return #G.hand.highlighted >= 1 and #G.hand.highlighted <= 2
    end,
})
