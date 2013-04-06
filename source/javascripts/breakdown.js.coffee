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

$ ->
	papercut '#breakdown', ->

		path = new @Path()

		# Give the stroke a color
		path.strokeColor = 'black'
		start = new @Point(100, 100)

		# Move to start and draw a line from there
		path.moveTo(start)

		# Note that the plus operator on Point objects does not work
		# in JavaScript. Instead, we need to call the add() function:
		path.lineTo start.add([ 200, -50 ])

		# Draw the view now:
		@view.draw()

		rect = new @Path.Rectangle([100, 50], [10, 100])
		rect.strokeColor = 'black'

		@view.onFrame = (event) ->
			# On each frame, rotate the path by 3 degrees:
			rect.rotate(3)

		window.game = new Game
		game.gameScreen(1)
