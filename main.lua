SMODS.Back{
    name = "Vagabonded Deck",
    key = "vagabonded",
    pos = {x = 1, y = 3},
    config = {only_one_rank = "4"},
    loc_txt = {
        name ="Vagabonded Deck",
        text={
            "Start with {C:money}$-20{} and",
            "earn no {C:attention}Interest{}, but all",
            "{C:tarot}Tarot{} cards and packs",
            "are free."
        },
    },
    apply = function(self)
        G.GAME.interest_cap = 0
        
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.dollar = -20 -- not sure why this needs to be in an event but it does
                
                return true
            end
        }))

        local set_cost_old = Card.set_cost

        function Card:set_cost()
            set_cost_old(self)

            if self.ability.set == "Tarot" or (self.ability.set == "Booster" and self.ability.name:find("Arcana")) then
                self.cost = 0
            end
        end
    end
}