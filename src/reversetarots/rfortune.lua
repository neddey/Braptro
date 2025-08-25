SMODS.Consumable {
    key = 'rfortune',
    set = 'reversetarot',
    loc_txt = {
        name = 'Wheel of Fortune?',
        text = {
            "{C:green}#1# in 4{} chance to add",
            "{C:dark_edition}Negative{} edition",
            "to a random {C:attention}Joker{}",
        },
    },

    atlas = 'reversetarots',
    pos = { x = 0, y = 1 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['e_negative']
        return { vars = { G.GAME.probabilities.normal } }
    end,

    use = function(self, card, area, copier)
        if pseudorandom(pseudoseed('rfortune')) < G.GAME.probabilities.normal/4 then
            local jokers = SMODS.Edition:get_edition_cards(G.jokers, true) --Ignore cards alredy with editions
            if #jokers >= 1 then
                pseudorandom_element(jokers, pseudoseed('rfortune')):set_edition({negative = true}, true)
            end
		end
    end,

    can_use = function(self, card)
        return #G.jokers.cards >= 1
    end,
}
