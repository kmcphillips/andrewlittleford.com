$ ->
  $("#image_sortable").sortable
    update: Sortable.updateImages


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
    $.ajax
      url: "/admin/images/sort"
      type: "post"
      data: $(this).sortable('serialize')
      error: -> alert("Error updating images. Let me know and I'll fix it!")

    $(this).disableSelection()
