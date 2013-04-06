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
