SMODS.Consumable {
    key = 'rhighpriestess',
    set = 'reversetarot',
    loc_txt = {
        name = "The High Priestess?",
        text = {
            "Select {C:attention3{} cards",
            "Converts all {C:attention}3{} cards into",
            "one of the random cards selected.",
        },
    },

    atlas = 'reversetarots',
    pos = { x = 2, y = 0 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
    end,

    use = function(self, card, area, copier)
        local rand_card = pseudorandom_element(G.hand.highlighted, pseudoseed('rhighpriestess'))
        for i = 1, #G.hand.highlighted do
            copy_card(rand_card, G.hand.highlighted[i])
        end
    end,

    can_use = function(self, card)
        return #G.hand.highlighted > 0 and #G.hand.highlighted <= 3
    end,
}
