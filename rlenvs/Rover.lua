local classic = require 'classic'
<<<<<<< HEAD
local Rover = classic.class('RoverEnv')
=======

local Rover, super = classic.class('Rover', env)
>>>>>>> 3d9d029767cbb595d2ce857420f9e389cf9815be

--Constructor
function Rover:_init(opts)
  opts = opts or {}

  --Noise
  self.noise = opts.noise or 0

  --Width and Height of Environment 9square)
  self.size = opts.size or 50
  self.screen = torch.Tensor(1, self.size, self.size):zero()

  --Player State
  self.player = {
<<<<<<< HEAD
    x = math.ceil(self.size / 2),
    width = opts.playerWidth or math.ceil(self.size / 12)
}
  self.grid={}
  self.rowsize=10
  self.colsize=10
  self.maxvalue=1

end

function Rover:start()
    --Generate the map
    for i = 0, self.rowsize-1, 1  do
        self.grid[i] = {} --create the row
            for j = 0, self.colsize-1, 1 do
                self.grid[i][j] = math.random(0,self.maxvalue)
            end
    end
    self:print_grid(grid)
end

-- 1 state returned, of type 'int', of dimensionality 1 x self.size x self.size, between 0 and 1
function Rover:getStateSpec()
  return {'int', {1, self.size, self.size}, {0, 1}}
end

-- 1 action required, of type 'int', of dimensionality 1, between 0 and 2
function Rover:getActionSpec()
  return {'int', 1, {0, 2}}
=======
    x = math.ceil(self.size / 2)
    y = math.ceil(self.size / 2)
    angle = 0
  }
end

function Rover:start()

end

function Rover:getActionSpec()
  return {'float', 1, {0, 1, 2}}
end

function Rover:getRewardSpec()
  return 0,99999999999
end

function Rover:step(action)
  --Reward is 0 by default
  local reward = 0

  --Each action corresponds to {0,1},{1,0},{1,1}
  if action == 1 then --{0,1}
    --compute angle changes here
  elseif action == 2 then --{1,0} + Xdeg
    --compute angle changes here
  elseif action == 3 then
    --compute movement here
end


function Rover:redraw()
  --Generate map during runtime map here
end

function Rover:start()
self.player.x = math.ceil(self.size /2)
self.player.y = math.ceil(self.size/2)

--Generate Initial mappings above
self:redraw()
end


>>>>>>> 3d9d029767cbb595d2ce857420f9e389cf9815be
end

function Rover:print_grid(grid)
    for i = 0, self.rowsize-1, 1 do
        for j = 0, self.colsize-1, 1 do
            local str = " "..self.grid[i][j]
            io.write(str)
        end
        io.write("\n")
    end
end

return Rover
