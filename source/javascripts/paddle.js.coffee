window.Paddle = class Paddle
	constructor: (@game, height, @angle) ->
		@position = new paper.Point(10, height)
		@color = new paper.Color(197,147,83)
	draw: ->
