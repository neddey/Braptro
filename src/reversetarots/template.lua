SMODS.Consumable {
    key = '',
    set = 'reversetarot',
    loc_txt = {
        name = '',
        text = {
            '',
        },
    },

    atlas = 'reversetarots',
    pos = { x = 0, y = 0 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
    end,

    use = function(self, card, area, copier)
    end,

    can_use = function(self, card)
    end,
}
