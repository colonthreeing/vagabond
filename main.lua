_RELEASE_MODE = false

local set_cost_old = Card.set_cost

function Card:set_cost()
    set_cost_old(self)

    if type(G.GAME.selected_back_key) == "nil" then return end
    if (G.GAME.selected_back_key.key == "b_vaga_vagabonded") and (self.ability.set == "Tarot" or (self.ability.set == "Booster" and self.ability.name:find("Arcana"))) then
        self.cost = 0
    end
end


SMODS.Atlas {
    key = "Vagabond",
    path = "Vagabond.png",

    px = 71,
    py = 95
}


SMODS.Back {
    name = "Vagabonded Deck",
    key = "vagabonded",
    pos = {x = 0, y = 0},
    atlas = "Vagabond",
    loc_txt = {
        name ="Vagabonded Deck",
        text={
            "Earn no {C:attention}Interest{}, but all",
            "{C:tarot}Tarot{} cards and packs",
            "are free."
        },
    },
    apply = function(self)
        G.GAME.interest_cap = 0
    end
}