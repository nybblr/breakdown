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

window.Shape = class Shape
	# Objects queued for state changes
	@destroyed: []
	@dynamics:  []

	@updatePending: ->
		for [world, body] in @destroyed
			world.DestroyBody(body)

		for [body, density] in @dynamics
			for shape in body.shapeList
				shape.SetDensity(density)

			body.SetMassFromShapes()
			body.WakeUp()

		@destroyed = []
		@dynamics  = []

	constructor: (@game, { body, color, kind, position, params, density, friction, restitution, pointer }) ->
		# Defaults
		body        ?= null
		color       ?= paper.Color(0,0,0)
		kind        ?= 'box'
		position    ?= new paper.Point(0,0)
		density     ?= 1.0
		friction    ?= 0.3
		restitution ?= 1.0
		pointer     ?= self

		if not body
			# Define the dynamic body. We set its position and call the body factory.
			bodyDef = new b2BodyDef
			bodyDef.position.Set(position...)
			bodyNew = game.world.CreateBody(bodyDef)

			# Define another shape for our dynamic body.
			shapeDef = None

			if kind is "box"
				shapeDef = b2PolygonDef()
				shapeDef.SetAsBox(params...)
			else if kind is "polygon"
				shapeDef = b2PolygonDef()
				shapeDef.setVertices(params)
			else if kind is "line"
				shapeDef = b2PolygonDef()
				shapeDef.setVertices(params)
			else if kind is "circle"
				shapeDef = b2CircleDef()
				shapeDef.radius = params

			# Set the density to be non-zero, so it will be dynamic.
			shapeDef.density = density

			# Override the default friction.
			shapeDef.friction = friction

			# Set the restitution constant for bounce
			shapeDef.restitution = restitution

			# Add the shape to the body.
			shape = bodyNew.CreateShape(shapeDef)

			# Set the pointer for quick access (events).
			shape.SetUserData(pointer)
			bodyNew.SetUserData(pointer)

			# Now tell the dynamic body to compute it's mass properties base on its shape.
			bodyNew.SetMassFromShapes()

			@body = bodyNew

		else
			@body = body

	destroy: (self, now=false) ->
		@constructor.destroyed.push [@game.world, @body]
		@body = null

		@constructor.updatePending() if now

	density: (value) ->
		@constructor.dynamics.push [@body, value]
