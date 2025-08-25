SMODS.Consumable {
    key = 'rhermit',
    set = 'reversetarot',
    loc_txt = {
        name = 'Hermit?',
        text = {
            'Decreases rank of {C:attention}1{}',
            'selected card by {C:attention}1{}',
            'adds a random {C:dark_edition}edition{}',
        },
    },

    atlas = 'reversetarots',
    pos = { x = 9, y = 0 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
    end,

    use = function(self, card, area, copier)
        SMODS.modify_rank(G.hand.highlighted[1], -1)
        G.hand.highlighted[1]:set_edition(poll_edition("rhermit", nil, true, true), true, true)
    end,

    can_use = function(self, card)
        return #G.hand.highlighted == 1
    end,
}
