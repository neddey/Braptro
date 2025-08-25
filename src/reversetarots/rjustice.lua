SMODS.Consumable({
    key = 'rjustice',
    set = 'reversetarot',
    loc_txt = {
        name = "Justice?",
        text = {
            "Enhances 3 random cards",
            "into {C:attention}Stone Cards{}",
            "gives each a random {C:dark_edition}edition{}",
        },
    },

    atlas = 'reversetarots',
    pos = { x = 8, y = 0 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_stone']
    end,

    use = function(self, card, area, copier)
        for i = 1, math.min(3, #G.hand.cards) do
            local cards = {}
            for i = 1, #G.hand.cards do
                if G.hand.cards[i].config.center_key ~= 'm_stone' then
                    cards[#cards + 1] = G.hand.cards[i]
                end
            end

            local card = pseudorandom_element(cards, pseudoseed('rjustice'))
            if card then
                card:set_ability(G.P_CENTERS['m_stone'])
                card:set_edition(poll_edition('rjustice', nil, true, true), true, true)
            end
        end
    end,

    can_use = function(self, card)
        return #G.hand.cards >= 1
    end,
})
