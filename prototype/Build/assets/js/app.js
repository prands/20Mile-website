(function() {

  $(function() {
    var $form, ajax_contact_form, emailRegEx, emptyRegEx, formSubmissionHandler, handlePostSubmission, hash, loadSelectedImage, setUpScrollableGallery;
    $('#hw-nav a').on('click', function(event) {
      event.preventDefault();
      $('#hw-nav').removeClass().addClass('span12').addClass($(this).attr('href'));
      return $('#hw-nav').next().removeClass().addClass('span12').addClass($(this).attr('href'));
    });
    if ($('p.tweet-text').length > 0) {
      $.getJSON("https://api.twitter.com/1/statuses/user_timeline/20milers.json\?count\=1\&include_rts\=1\&callback\=\?", function(data) {
        return $('p.tweet-text').html(data[0].text);
      });
    }
    loadSelectedImage = function() {
      var img, thumb, url, wrap;
      thumb = $(this);
      if (thumb.parent().hasClass('active')) {
        return;
      }
      url = $(this).data('src');
      wrap = $('.modal-body').fadeTo('medium', 0.5);
      img = new Image();
      img.onload = function() {
        wrap.fadeTo('fast', 1);
        return wrap.find('img').attr('src', url);
      };
      img.src = url;
      $('.items img').parent().removeClass('active');
      return $(this).parent().addClass('active');
    };
    setUpScrollableGallery = function() {
      var api;
      api = $('.scrollable').scrollable();
      return $(this).find('.items img').on('click', loadSelectedImage);
    };
    $('.results-modal').on('show', setUpScrollableGallery);
    if (window.location.hash) {
      hash = window.location.hash.substring(1);
      $('#' + hash).modal('show');
    }
    emailRegEx = new RegExp(/^((?!\.)[a-z0-9._%+-]+(?!\.)\w)@[a-z0-9-]+\.[a-z.]{1,5}(?!\.)\w$/i);
    emptyRegEx = new RegExp(/[-_.a-zA-Z0-9]{3,}/);
    $form = $("#contact-form");
    handlePostSubmission = function(data) {
      if (data.success === false) {
        $form.find('label.control-label').removeClass('error');
        return $.each(data.errors, function(field_name, error_message) {
          var $field;
          $field = $('[name=' + field_name + ']');
          $field.next().addClass('error');
          $field.val('');
          return $field.attr('placeholder', error_message);
        });
      } else {
        $form.after("<h1>Thanks for your message, we'll get back to you.</h1>");
        return $form.remove();
      }
    };
    ajax_contact_form = function(form) {
      return $.post(form.attr('action'), form.serialize(), handlePostSubmission);
    };
    formSubmissionHandler = function(evnt) {
      var $f;
      $f = $(this);
      ajax_contact_form($f);
      evnt.preventDefault();
      return false;
    };
    $form.on('submit', formSubmissionHandler);
    return $('.validate-empty').on('blur', function(evnt) {
      var field;
      field = $(this);
      if (emptyRegEx.test(field.val())) {
        field.next().removeClass('error').addClass('completed');
        if (field.hasClass('validate-email')) {
          if (!emailRegEx.test(field.val())) {
            field.next().removeClass('completed').addClass('error');
            field.val('');
            return field.attr('placeholder', 'Not a valid email');
          }
        }
      } else {
        return field.next().removeClass('completed').addClass('error');
      }
    });
  });

}).call(this);
