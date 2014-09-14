$ ->
  $("[data-previewable]").each (index, node) ->
    $node = $(node)
    $node.keyup($.debounce(load_preview, 500))
    load_preview.call($node)

load_preview = ->
  $this = $(this)
  selector = $this.data('previewable')
  target = $(selector)

  $.ajax
    type: 'POST'
    url: '/admin/preview/plain'
    data:
      body: $this.val()
    success: (result) ->
      target.html(result)
