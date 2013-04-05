#= require ./lib/jquery
#= require ./lib/modernizr
#= require ./lib/box2dweb
#= require ./helpers
#
#= require_self
#
#= require game

window.papercut = (element, func) ->
	canvas = $(element).get(0)
	paper.setup(canvas)
	func.call(paper)
