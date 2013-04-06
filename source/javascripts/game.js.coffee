window.Game = class Game
	constructor: ->
		# --- constants ---
		@ppm = 20.0 # pixels per meter
		@grid = 1.0 / 1.5 # grid cell size in world coords
		@fps = 60
		@iterations = 10
		@warp = 0.75 # simulation speed ratio
		@timeStep = 1.0 / @fps
		@width = 640
		@height = 480

		@mwidth = @width / @ppm
		@mheight = @height / @ppm
		@gwidth = @mwidth / @grid
		@gheight = @mheight / @grid

		@awards = {
			obliterate: 5
			blast: 2
			keyskillz: 1
			boundless: 1
		}

		@shapes = []
		@blocks = []
		@walls = []
		@levels = []
		@lives = 5
		@points = 0

		@isRunning = true

		# Define the walls.
		@initWalls()

		# Define the paddle.
		@paddle = new Paddle(@, 1, 0.5)

	initWalls: ->
