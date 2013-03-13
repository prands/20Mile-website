$ ->

	$('#hw-nav a').on 'click', (event) ->
		event.preventDefault()
		$('#hw-nav').removeClass().addClass('span12').addClass($(@).attr('href'))
		$('#hw-nav').next().removeClass().addClass('span12').addClass($(@).attr('href'))

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

	if window.location.hash
		hash = window.location.hash.substring 1
		$('#' + hash).modal 'show'