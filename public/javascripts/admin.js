$(document).ready(function(){
    $("textarea.previewable").keyup($.debounce(500, load_preview));
});

function stripe_table(table)
{
  $(table).find("tr").each(function(index, element) {
    $(element).removeClass("odd even")
    
    if(index % 2 == 0)
      $(element).addClass("odd");
    else
      $(element).addClass("even");
  });
}

function convert_datetime_select(id)
{
    year = 0;
    month = 0;
    day = 0;

    $(id).find("select").each(function(index, select){
        switch(index)
        {
            case 0: // year
                year = $(select).val();
                $(select).hide();
                break;
            case 1: // month
                month = $(select).val();
                $(select).hide();
                break;
            case 2: // day
                day = $(select).val();
                $(select).hide();
                break;
            case 3: // hour
                selected = $(select).val();
                $(select).children().remove()
                for(i = 0; i <= 23; i++)
                {
                    if(i == 0)
                        text = "AM 12"
                    else if(i < 12)
                        text = "AM " + i
                    else if(i == 12)
                        text = "PM 12"
                    else
                        text = "PM " + (i - 12)

                    $(select).append("<option value='" + i + "' " + (selected == i ? "selected='selected'" : "") + ">" + text + "</option>")
                }
                break;
            case 4: // minute
                $(select).find("option").each(function(){
                    if($(this).val() != "00" && $(this).val() != "15" && $(this).val() != "30" && $(this).val() != "45")
                        $(this).remove();
                });
        }
    });

    $(id).prepend("<input type='text' size='10' class='datetime_picker' value='" + year + "/" + month + "/" + day + "' />");
    $(id).find("input[type=text]").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: "yy/mm/dd",
        onClose: function(text) {
            tokens = text.split("/");
            for(i = 0; i <= 2; i++)
            {
                $($(id).find("select")[i]).val(tokens[i].replace(/^[0]/g,""));
            }
        }
    });

}

function load_preview() {
    $.ajax({
        type: 'POST',
        url: '/admin/preview/plain',
        data: {
            body: this.value
        },
        success: function(result) {
            $("#previewable-preview").html(result);
        }
    });
}
