$ ->
  $("#image_sortable").sortable
    update: Sortable.updateImages

  $("#sortable_table tbody").sortable
    update: Sortable.updateLinks

Sortable =
  stripeTable: (table) ->
    $(table).find("tr").each (index, element) ->
      $element = $(element)
      $element.removeClass("odd even")

      if(index % 2 == 0)
        $element.addClass("odd")
      else
        $element.addClass("even")

  updateImages: ->
    data =
    $.ajax
      url: "/admin/images/sort"
      type: "post"
      data: data
      error: -> alert("Error updating images. Let me know and I'll fix it!")

    $(this).disableSelection()

  updateLinks: ->
    Sortable.stripeTable(this)

    # I am not sure why this does not work, so we do it manually
    # data = $("#sortable_table tbody").sortable('serialize')
    data = ""

    $("#sortable_table tbody tr").each ->
      val = $(this).attr('data-link-id')
      data += "link[]=" + val + "&" if val

     $.ajax
      url: "/admin/links/sort"
      type: "post"
      data: data
      error: -> alert("Error updating images. Let me know and I'll fix it!")

    $(this).disableSelection()
