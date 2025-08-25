SMODS.Consumable {
    key = 'rfool',
    set = 'reversetarot',

    loc_txt = {
        name = 'The Fool?',
        text = {
            'Destroys a random Joker,',
            'creates a random joker of',
            'a higher rarity.',
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
		local joker = pseudorandom_element(G.jokers.cards, pseudoseed("rfool"))
        local rarity = joker.config.center.rarity
        SMODS.destroy_cards(joker)
        if rarity == 1 then
            SMODS.add_card({set = 'Joker', rarity = 'Uncommon'})
        elseif rarity == 2 then
            SMODS.add_card({set = 'Joker', rarity = 'Rare'})
        elseif rarity == 3 then
            SMODS.add_card({set = 'Joker', rarity = 'Legendary'})
        elseif rarity == 4 then
            SMODS.add_card({set = 'Joker', rarity = 'Legendary'})
    end
    end,

    can_use = function(self, card)
        return #G.jokers.cards >= 1
    end,
}
