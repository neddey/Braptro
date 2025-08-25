SMODS.Consumable {
    key = 'rdevil',
    set = 'reversetarot',
    loc_txt = {
        name = 'Devil?',
        text = {
            'Creates a copy of a',
            'selected card',
            'enhances the copied card',
            'into a {C:attention}Mult card{}',
        },
    },

    atlas = 'reversetarots',
    pos = { x = 5, y = 1 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_mult']
    end,

    use = function(self, card, area, copier)
        local copy = copy_card(G.hand.highlighted[1])
        copy:add_to_deck()
        G.hand.highlighted[1].area:emplace(copy)
        copy:set_ability(G.P_CENTERS['m_mult'])
    end,

    can_use = function(self, card)
        return #G.hand.highlighted == 1
    end,
}
