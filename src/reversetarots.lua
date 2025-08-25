SMODS.Atlas {
    key = 'reversetarots',
    path = 'reversedtarots.png',
    px = 71,
    py = 95,
}

SMODS.ConsumableType {
    key = 'reversetarot',
    primary_colour = HEX('D9468B'),
    secondary_colour = HEX('C94080'),
    --default = 'c_vremade_fool',

    loc_txt = {
        name = 'Reverse Tarots',
        collection = 'Reverse Tarots',
        undiscovered = {
 			name = 'Undis',
 			text = { 'Undis' },
 		},
    },
    collection_rows = { 5, 6 },
    shop_rate = 0,
}

SMODS.Booster:take_ownership_by_kind('Arcana', {
        create_card = function(self, card, i)
            local _card
            local tarot_poll = pseudorandom(pseudoseed('retar'))
            if tarot_poll > 1 - 0.1 then
                sendInfoMessage("revtar")
                _card = SMODS.create_card({
                    set = 'reversetarot',
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = false,
                    key_append = "ar3",
                })
            elseif G.GAME.used_vouchers.v_omen_glob and tarot_poll > 1 - 0.3 then
                _card = SMODS.create_card({
                    set = 'Spectral',
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "ar2"
                })
            else
                _card = SMODS.create_card({
                    set = 'Tarot',
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = false,
                    key_append = "ar1",
                })
            end
            return _card
        end,
    },
    true
)

SMODS.load_file('src/reversetarots/rfool.lua')()
SMODS.load_file('src/reversetarots/rmagician.lua')()
SMODS.load_file('src/reversetarots/rhighpriestess.lua')()
SMODS.load_file('src/reversetarots/rempress.lua')()
SMODS.load_file('src/reversetarots/remperor.lua')()
SMODS.load_file('src/reversetarots/rheirophant.lua')()
SMODS.load_file('src/reversetarots/rlovers.lua')()
SMODS.load_file('src/reversetarots/rchariot.lua')()
SMODS.load_file('src/reversetarots/rjustice.lua')()
SMODS.load_file('src/reversetarots/rhermit.lua')()
SMODS.load_file('src/reversetarots/rfortune.lua')()
SMODS.load_file('src/reversetarots/rstrength.lua')()
SMODS.load_file('src/reversetarots/rhangedman.lua')()
SMODS.load_file('src/reversetarots/rdeath.lua')()
SMODS.load_file('src/reversetarots/rtemperance.lua')()
SMODS.load_file('src/reversetarots/rdevil.lua')()
SMODS.load_file('src/reversetarots/rtower.lua')()
SMODS.load_file('src/reversetarots/rstar.lua')()
SMODS.load_file('src/reversetarots/rmoon.lua')()
SMODS.load_file('src/reversetarots/rsun.lua')()
SMODS.load_file('src/reversetarots/rjudgement.lua')()
SMODS.load_file('src/reversetarots/rworld.lua')()
