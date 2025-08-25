SMODS.Consumable {
    key = 'rheirophant',
    set = 'reversetarot',
    loc_txt = {
        name = 'The Heirophant?',
        text = {
            'Increases sell value',
            'of all Jokers by {C:money}$5{}',
        },
    },

    atlas = 'reversetarots',
    pos = { x = 5, y = 0 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
    end,

    use = function(self, card, area, copier)
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i].sell_cost = G.jokers.cards[i].sell_cost + 5
        end
    end,

    can_use = function(self, card)
        return #G.jokers.cards >= 1
    end,
}
