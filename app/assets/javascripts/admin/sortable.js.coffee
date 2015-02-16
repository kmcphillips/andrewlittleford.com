$ ->
  $("#image_sortable").sortable
    update: Sortable.updateImages

  $("#links_sortable tbody").sortable
    update: Sortable.updateLinks

  $("#tracks_sortable tbody").sortable
    update: Sortable.updateTracks

  $("#entries_sortable tbody").sortable
    update: Sortable.updateEntries

Sortable =
  updateImages: ->
    data = $(this).sortable('serialize')
    update "/admin/images/sort", data
    $(this).disableSelection()

  updateLinks: ->
    stripeTable(this)

    # I am not sure why this does not work, so we do it manually
    # data = $(this).sortable('serialize')
    data = ""
    $(this).find("tr").each ->
      val = $(this).attr('data-link-id')
      data += "link[]=" + val + "&" if val

    update("/admin/links/sort", data)

    $(this).disableSelection()

  updateTracks: ->
    stripeTable(this)

    # I am not sure why this does not work, so we do it manually
    # data = $(this).sortable('serialize')
    data = ""
    $(this).find("tr").each ->
      val = $(this).attr('data-track-id')
      data += "track[]=" + val + "&" if val

    update("/admin/tracks/sort", data)

    $(this).disableSelection()

  updateEntries: ->
    stripeTable(this)

    # I am not sure why this does not work, so we do it manually
    # data = $(this).sortable('serialize')
    data = ""
    $(this).find("tr").each ->
      val = $(this).attr('data-entry-id')
      data += "entry[]=" + val + "&" if val

    update("/admin/discography_entries/sort", data)

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
