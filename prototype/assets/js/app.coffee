$ ->

	#-----------------------------------
	# Home Page Widget "rotation" events
	#-----------------------------------
	$('#hw-nav a').on 'click', (event) ->
		event.preventDefault()
		$('#hw-nav').removeClass().addClass('span12').addClass($(@).attr('href'))
		$('#hw-nav').next().removeClass().addClass('span12').addClass($(@).attr('href'))

		

	#--------------------------------------------------------
	# Result's page modal with jquerytools scrollable gallery
	#--------------------------------------------------------
	loadSelectedImage = ()->
		thumb = $(@)
		return if thumb.parent().hasClass('active')
		url = $(@).data('src')
		wrap = $('.modal-body').fadeTo('medium', 0.5)
		img = new Image()
		
		img.onload = ()->
			wrap.fadeTo('fast', 1)
			wrap.find('img').attr('src', url)

		img.src = url

		$('.items img').parent().removeClass('active')
		$(@).parent().addClass('active')

	setUpScrollableGallery = ()->
		api = $('.scrollable').scrollable()
		$(@).find('.items img').on 'click', loadSelectedImage
			

	$('.results-modal').on 'show', setUpScrollableGallery

	#------------------------------------------
	# Pop the team member based on the url hash
	#------------------------------------------
	if window.location.hash
		hash = window.location.hash.substring 1
		$('#' + hash).modal 'show'





	#-----------------------------------------------
	# Ajax validates the contact form on server side
	#-----------------------------------------------

	# regex
	emailRegEx = new RegExp(/^((?!\.)[a-z0-9._%+-]+(?!\.)\w)@[a-z0-9-]+\.[a-z.]{2,5}(?!\.)\w$/i)
	emptyRegEx = new RegExp(/[-_.a-zA-Z0-9]{3,}/)

	$form = $("#contact-form")

	handlePostSubmission = (data) ->
		if data.success == false
			$form.find('label.control-label').removeClass('error')
			$.each data.errors, (field_name, error_message)->
				$field = $('[name=' + field_name + ']')
				$field.next().addClass('error')
				$field.val('')
				$field.attr 'placeholder', error_message
		else
			$form.remove()
			# TODO: add thank you message here

	ajax_contact_form = ( form )->
		$.post form.attr('action'), form.serialize(), handlePostSubmission

	formSubmissionHandler = (evnt)->
		$f = $(@)
		ajax_contact_form( $f )
		evnt.preventDefault()
		return false

	$form.on 'submit', formSubmissionHandler

	# Field client side validation
	$('.validate-empty').on 'blur', (evnt)->
		field = $(@)
		if emptyRegEx.test field.val()
			field.next().removeClass('error').addClass('completed')
			if field.hasClass('validate-email')
				if not emailRegEx.test field.val()
					field.next().removeClass('completed').addClass('error')
					field.val('')
					field.attr 'placeholder', 'Not a valid email'
		else
			field.next().removeClass('completed').addClass('error')


		









