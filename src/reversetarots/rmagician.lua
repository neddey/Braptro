SMODS.Consumable {
    key = 'rmagician',
    set = 'reversetarot',
    loc_txt = {
        name = "The Magician?",
        text = {
            "{C:green}#1# in 8{} chance to provide ANY edition to said Joker",
            "{C:green}#1# in 8{} chance to duplicate said Joker",
            "{C:inactive}(Must have room){}",
        },
    },
    atlas = 'reversetarots',
    pos = { x = 1, y = 0 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.probabilities.normal } }
    end,

    use = function(self, card, area, copier)
		if pseudorandom(pseudoseed('rmagician')) < G.GAME.probabilities.normal/8 then
		    G.jokers.highlighted[1]:set_edition(poll_edition('rmagician', 1, false, true))
		end
        if pseudorandom(pseudoseed('rmagician')) < G.GAME.probabilities.normal/8 and #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            local copied_joker = copy_card(G.jokers.highlighted[1], nil, nil, nil, false)
            copied_joker:add_to_deck()
            G.jokers:emplace(copied_joker)
		end
    end,

    can_use = function(self, card)
        return #G.jokers.highlighted >= 1
    end,
}
