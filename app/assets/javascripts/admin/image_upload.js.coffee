$ ->
  ImageUpload.initialize()

ImageUpload =
  initialize: (node) ->
    $('[data-modal-button]').on('click', ImageUpload.openPreviousImageModal)
    $('[data-previous-image-id]').on('click', ImageUpload.selectPreviousImage)
    $('[data-clear-image-button]').on('click', ImageUpload.clearImage)

    $('[data-previous-image]').dialog
      autoOpen: false
      modal: true
      height: 500
      width: 700
      title: "Select a previous image"
      buttons:
        Cancel: -> $(this).dialog("close")

  clearImage: ->
    $('[data-clear-image-button]').val('true')
    $('[data-file-field]').val('')
    $('[data-previous-image-field]').val('')
    $('[data-image]').hide()
    false

  openPreviousImageModal: ->
    $('[data-previous-image]').dialog('open')
    false

  selectPreviousImage: ->
    $('[data-previous-image-field]').val($(this).data('previousImageId'))
    $('[data-previous-image]').dialog('close')
    false
