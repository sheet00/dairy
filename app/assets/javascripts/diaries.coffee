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

										$(".diary-form #browse").click ->
											$('#image_file').trigger('click')

										$('.diary-form #image_file').change ->
											$('#dummy_file').val($(this).val())
											$('#remove,#upload').show()

										$(".diary-form #remove").click ->
											$('#image_file').val(null)
											$('#dummy_file').val(null)
											$('#remove,#upload').hide()

										$(".diary-form #upload").click ->
											$form = $("#image-upload-form")
											fd = new FormData($form[0])
											$.ajax
											  type: 'POST'
											  url: $form.attr("action")
											  contentType: false
											  processData: false
											  data: fd
											  success: (data,status,xhr) ->
												showImage(data.file_name)

											  error: (xhr,status,error) ->
												alert status

										showImage = (file_name) ->
											$image_tag = $("<body>")
											$img = $("<img>",{class: "img-thumbnail img-responsive", src: "/img/#{file_name}"})
											$image_tag.append($img)

											$form = $("#diary_body")
											text = $form.val()
											text = text + "\n" + $image_tag.html() + "\n"
											$form.val(text)
											$(".diary-form").trigger("change")
											$(".diary-form #remove").trigger("click")
