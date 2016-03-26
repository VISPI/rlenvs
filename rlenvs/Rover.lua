local classic = require 'classic'
local Rover = classic.class('RoverEnv')

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
