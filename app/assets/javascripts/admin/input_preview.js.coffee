$ ->
  $("[data-previewable]").each (index, node) ->
    $node = $(node)
    $node.keyup($.debounce(loadPreview, 500))
    loadPreview.call($node)

loadPreview = ->
  $this = $(this)
  selector = $this.data('previewable')
  target = $(selector)

  $.post '/admin/preview/plain', { body: $this.val() }
  .done (result) -> target.html(result)
