$(document).on 'click', '[data-link-preview]', ->
  selector = $(this).data('link-preview')
  link = $(selector).val()

  if(!link.match(/^http(s)?:\/\/.+/))
    alert("URL must begin with 'http://' or 'https://'")
  else
    window.open(link)

  false
