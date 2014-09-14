

Sortable =
  stripeTable: (table) ->
    $(table).find("tr").each (index, element) ->
      $element = $(element)
      $element.removeClass("odd even")

      if(index % 2 == 0)
        $element.addClass("odd");
      else
        $element.addClass("even");
