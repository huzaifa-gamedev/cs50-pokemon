-- StatsMenuState is a class that inherits from BaseState
StatsMenuState = Class{__includes = BaseState}

-- Constructor function for StatsMenuState
function StatsMenuState:init(pokemon, stats, onClose)
    -- Store the passed pokemon object
    self.pokemon = pokemon
    
    -- Store the new stats
    self.newHP = stats.newHP
    self.newAtt = stats.newAtt
    self.newDef = stats.newDef
    self.newSpd = stats.newSpd

    -- Calculate the old stats by subtracting the new stats from current stats
    self.befHP = self.pokemon.HP - self.newHP
    self.befAtt = self.pokemon.attack - self.newAtt
    self.befDef = self.pokemon.defense - self.newDef
    self.befSpd = self.pokemon.speed - self.newSpd

    -- Store the onClose callback function or default to an empty function
    self.onClose = onClose or function() end
    
    -- Initialize the stats menu with the calculated stats
    self.statsMenu = Menu {
        x = 0,
        y = VIRTUAL_HEIGHT - 64,
        width = VIRTUAL_WIDTH,
        height = 64,
        showCursor = false,
        font = gFonts['small'],
        items = {
            -- Menu item for HP
            {
                text = 'HP: ' .. self.befHP .. ' + ' .. self.newHP .. ' = ' .. self.pokemon.HP,
                onSelect = function()
                    self:close() -- Close menu on select
                end
            },
            -- Menu item for Attack
            {
                text = 'Attack: ' .. self.befAtt .. ' + ' .. self.newAtt .. ' = ' .. self.pokemon.attack,
                onSelect = function()
                    self:close() -- Close menu on select
                end
            },
            -- Menu item for Defense
            {
                text = 'Defense: ' .. self.befDef .. ' + ' .. self.newDef .. ' = ' .. self.pokemon.defense,
                onSelect = function()
                    self:close() -- Close menu on select
                end
            },
            -- Menu item for Speed
            {
                text = 'Speed: ' .. self.befSpd .. ' + ' .. self.newSpd .. ' = ' .. self.pokemon.speed,
                onSelect = function()
                    self:close() -- Close menu on select
                end
            }
        }
    }
end

-- Function to close the stats menu and call the onClose callback
function StatsMenuState:close()
    gStateStack:pop() -- Pop the current state from the state stack
    self.onClose() -- Call the onClose callback function
end

-- Update function for the stats menu state
function StatsMenuState:update(dt)
    self.statsMenu:update(dt) -- Update the stats menu
end

-- Render function for the stats menu state
function StatsMenuState:render()
    self.statsMenu:render() -- Render the stats menu
end