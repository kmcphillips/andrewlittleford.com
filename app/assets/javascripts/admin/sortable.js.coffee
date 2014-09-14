$ ->
  $("#image_sortable").sortable
    update: Sortable.updateImages

  $("#sortable_table tbody").sortable
    update: Sortable.updateLinks

Sortable =
  updateImages: ->
    data = $(this).sortable('serialize')
    update "/admin/images/sort", data
    $(this).disableSelection()

  updateLinks: ->
    stripeTable(this)

    # I am not sure why this does not work, so we do it manually
    # data = $("#sortable_table tbody").sortable('serialize')
    data = ""
    $("#sortable_table tbody tr").each ->
      val = $(this).attr('data-link-id')
      data += "link[]=" + val + "&" if val

    update("/admin/links/sort", data)

    $(this).disableSelection()


update = (url, data) ->
  $.ajax
    url: url
    type: "post"
    data: data
    error: -> alert("Error updating sort order. Let me know and I'll fix it!")

stripeTable = (table) ->
  $(table).find("tr").each (index, element) ->
    $element = $(element)
    $element.removeClass("odd even")

    if(index % 2 == 0)
      $element.addClass("odd")
    else
      $element.addClass("even")
