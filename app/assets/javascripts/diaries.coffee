# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

diaries =
	$(document).on 'ready page:load', ->
									$ ->
										$(".year").click ->
											target = $(this).next(".month")
											target.addClass("active")

											#非表示処理
											$(".month").removeClass("active")
											$(".month:not(.active)").hide()

											target.show("blind", 500)
											return false

