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

										$("#diary_authored_on").datetimepicker(
											dateFormat: "yy-mm-dd",
											timeFormat: "HH:mm"
											)

										$("#diary_category_id, #diary_weather_id").addClass("dropdown").selectpicker()

										$(".diary-form").change ->
											changeContents($(".diary-title>a"),$("#diary_title").val())
											changeContents($(".diary-body"),$("#diary_body").val())
											changeContents($(".diary-footer .diary-category"),$(".category .selectpicker").attr("title"))
											changeContents($(".diary-footer .diary-weather"),$(".weather .selectpicker").attr("title"))
											changeContents($(".diary-footer .diary-authored"),$("#diary_authored_on").val())

										changeContents = ($target,val) ->
											val = val.replace(/\r?\n/g, '<br>')
											$target.html(val)