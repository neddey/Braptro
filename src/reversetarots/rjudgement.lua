SMODS.Consumable {
    key = 'rjudgement',
    set = 'reversetarot',
    loc_txt = {
        name = "Judgement?",
        text = {
            "Creates 2 {C:dark_edition}Negative{} copies",
            "of the last used {C:tarot}Tarot{} or {C:planet}Planet{} Card",
            "{s:0.8,C:tarot}The Fool{s:0.8} and {s:0.8,C:tarot}Reversed Fool{s:0.8} excluded{}",
        },
    },

    atlas = 'reversetarots',
    pos = { x = 0, y = 2 },
    --config = {},
    unlocked = true,
    discovered = true,
    --no_collection,

    loc_vars = function(self, info_queue, card)
        -- This vanilla variable only checks for vanilla Tarots and Planets, you would have to keep track on your own for any custom consumables
        -- Get the details of the last used taror or planet card
        local fool_c = G.P_CENTERS[G.GAME.last_tarot_planet] or nil

        -- If we have used a tarot or planet card we set last_tarot_planet to the name of the card, otherwise if we have not used a tarot or planet card we set it to none
        local last_tarot_planet = fool_c and localize { type = 'name_text', key = fool_c.key, set = fool_c.set } or localize('k_none')
        -- If we haven't used a tarot or the last tarot used was the fool set color to red, else set it to green
        local colour = (not fool_c or fool_c.name == 'The Fool') and G.C.RED or G.C.GREEN

        -- Not sure what this is?
        if not (not fool_c or fool_c.name == 'The Fool') then
            info_queue[#info_queue + 1] = fool_c
        end

        local main_end = {
            {n = G.UIT.C, config = { align = "bm", padding = 0.02 }, nodes = {
                    {n = G.UIT.C, config = { align = "m", colour = colour, r = 0.05, padding = 0.05 }, nodes = {
                            { n = G.UIT.T, config = { text = ' ' .. last_tarot_planet .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.3, shadow = true } },
                        }}
                }}
        }

        -- last_tarot_planet is what displays the details of the card to the side, main_end displays the name at the bottom of the decripition
        return { vars = { last_tarot_planet }, main_end = main_end }
    end,

    use = function(self, card, area, copier)
        for i = 1, 2 do
            SMODS.add_card({key = G.GAME.last_tarot_planet, edition = 'e_negative'})
        end
    end,

    can_use = function(self, card)
        return G.GAME.last_tarot_planet and G.GAME.last_tarot_planet ~= 'c_fool'
    end,
}
