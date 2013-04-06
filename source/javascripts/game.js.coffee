b2Vec2 = Box2D.Common.Math.b2Vec2
b2AABB = Box2D.Collision.b2AABB
b2BodyDef = Box2D.Dynamics.b2BodyDef
b2Body = Box2D.Dynamics.b2Body
b2FixtureDef = Box2D.Dynamics.b2FixtureDef
b2Fixture = Box2D.Dynamics.b2Fixture
b2World = Box2D.Dynamics.b2World
b2MassData = Box2D.Collision.Shapes.b2MassData
b2PolygonShape = Box2D.Collision.Shapes.b2PolygonShape
b2CircleShape = Box2D.Collision.Shapes.b2CircleShape

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

		# Define the size of the world. Simulation will still work
		# if bodies reach the end of the world, but it will be slower.
		margin = 5.0
		worldAABB= new b2AABB
		worldAABB.lowerBound.Set(-margin, -margin)
		worldAABB.upperBound.Set(@mwidth + margin, @mheight + margin)

		# Define the gravity vector.
		gravity = new b2Vec2(0.0, -10.0)

		# Do we want to let bodies sleep?
		doSleep = true

		# Construct a world object, which will hold and simulate the rigid bodies.
		@world = new b2World(worldAABB, gravity, doSleep)

		# @contact = new Contact(@)
		# @world.SetContactListener(@contact)

		# @boundary = new Boundary(@)
		# @world.SetBoundaryListener(@boundary)

		# Define the walls.
		@initWalls()

		# Define the paddle.
		@paddle = new Paddle(@, 1, 0.5)

	initWalls: ->

	gameScreen: (level) ->
		window.shape = new Shape @, {
			kind: 'box',
			params: [5.0, 5.0],
			position: [5, 5],
		}

		shape.draw()
