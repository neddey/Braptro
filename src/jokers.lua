SMODS.Atlas {
    key = 'jokers',
    path = 'jokers.png',
    px = 71,
    py = 95,
}

-- Common
SMODS.load_file('src/jokers/freeparking.lua')()
SMODS.load_file('src/jokers/sandcastle.lua')()
SMODS.load_file('src/jokers/seniorjoker.lua')()

-- Uncommon
SMODS.load_file('src/jokers/eggcarton.lua')()
SMODS.load_file('src/jokers/lastlaugh.lua')()

-- Rare
SMODS.load_file('src/jokers/gbbug.lua')()
SMODS.load_file('src/jokers/slotmachine.lua')()

-- Legendary
SMODS.load_file('src/jokers/jevil.lua')()
