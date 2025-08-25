SMODS.Back {
    key = 'enchanted',
    loc_txt = {
        name = 'Enchantment Deck',
        text = {
            'Start run with',
            '{C:dark_edition,T:v_hone}Hone{} and {C:dark_edition,T:v_glow_up}Glow Up{}',
            '{C:mult}-1{} Discards',
        }
    },
    atlas = 'decks',
    pos = {x = 1, y = 0},
    config = {
        discards = -1,
        enchanted = true,
        vouchers = {
            'v_hone',
            'v_glow_up',
        }
    },

    loc_vars = function(self)
        return { vars = self.config.discards }
    end,
}
