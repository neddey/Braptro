SMODS.Consumable {
    key = 'rhangedman',
    set = 'reversetarot',
    loc_txt = {
        name = 'Hanged Man?',
        text = {
            'Creates a random {C:spectral}Spectral{} Card',
        },
    },

    atlas = 'reversetarots',
    pos = { x = 2, y = 1 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
    end,

    use = function(self, card, area, copier)
        SMODS.add_card({set = 'Spectral', key_append = 'rhangedman', no_edition = true})
    end,

    can_use = function(self, card)
        return true
    end,
}
