local classic = require 'classic'

local Rover = classic.class('RoverEnv')

--Constructor
function Rover:_init(opts)
  opts = opts or {}

  --Noise
  self.noise = opts.noise or 0

  --Width and Height of Environment 9square)
  self.size = opt.size or 50
  self.screen = torch.Tensor(1, self.size, self.size):zero()

  --Player State
  self.player = {
    x = math.ceil(self.size / 2)
    width = opts.playerWidth or math.ceil(self.size / 12)
  }
end

function Rover:start()
end

end
