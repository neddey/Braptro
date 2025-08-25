SMODS.Consumable({
    key = 'rstrength',
    set = 'reversetarot',
    loc_txt = {
        name = 'Strength?',
        text = {
            "Creates a {C:attention}Coupon tag{}",
        },
    },

    atlas = 'reversetarots',
    pos = { x = 1, y = 1 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'tag_coupon', set = 'Tag' }
    end,

    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            func = function()
                add_tag(Tag('tag_coupon'))
                play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                return true
            end,
        }))
    end,

    can_use = function(self, card)
        return true
    end,
})
