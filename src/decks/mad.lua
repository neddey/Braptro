SMODS.Back {
    key = 'mad',
    loc_txt = {
        name = 'Mad Deck',
        text = {
            'Start run with',
            'Two{C:spectral,E:2} Black Hole {},',
            '{C:attention}-1{} Hand Size, ',
            '{C:chips}-1{} Hands,{C:mult}-1{} Discards',
        }
    },
    atlas = 'decks',
    pos = {x = 4, y = 0},
    config = {
        discards = -1,
        hands = -1,
        hand_size = -1,
        madd = true,
        consumables = {
            'c_black_hole',
            'c_black_hole',
        }
    },

    loc_vars = function(self)
        return { vars = self.config.discards, self.config.hands, self.config.hand_size }
    end
}
