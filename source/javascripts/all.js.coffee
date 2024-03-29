#= require ./lib/jquery
#= require ./lib/modernizr
#= require ./lib/box2dweb
#= require ./helpers
#
#= require_self
#
#= require breakdown
#= require game
#= require shape
#= require paddle

window.papercut = (element, func) ->
	canvas = $(element).get(0)
	paper.setup(canvas)
	func.call(paper)

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

