SMODS.Back {
    key = 'trickster',
    loc_txt = {
        name = 'Trickster Deck',
        text = {
            'Start run with {C:enhanced,T:v_magic_trick}Magic trick{},',
            '{C:enhanced,T:v_illusion}Illusion{}, and {C:enhanced,T:v_directors_cut}Directors Cut{}',
            'The cards of the first hand',
            'of every round are',
            '{C:attention,E:1}destroyed{} after scoring',
        }
    },
    atlas = 'decks',
    pos = {x = 0, y = 0},
    config = {
        trickster = true,
        vouchers = {
            'v_magic_trick',
            'v_illusion',
            'v_directors_cut',
        }
    },

    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and G.GAME.current_round.hands_played == 0 then
            return { remove = true }
        end
    end,
}
