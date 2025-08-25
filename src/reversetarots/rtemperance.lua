SMODS.Consumable {
    key = 'rtemperance',
    set = 'reversetarot',
    loc_txt = {
        name = 'Temperance?',
        text = {
            'Permanently adds {C:chips}+25{} Chips',
            'to {C:attention}3{} selected cards',
        },
    },

    atlas = 'reversetarots',
    pos = { x = 4, y = 1 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.hand.highlighted do
            G.hand.highlighted[i].ability.perma_bonus = G.hand.highlighted[i].ability.perma_bonus + 25
        end
    end,

    can_use = function(self, card)
        return #G.hand.highlighted >= 1 and #G.hand.highlighted <= 3
    end,
}
