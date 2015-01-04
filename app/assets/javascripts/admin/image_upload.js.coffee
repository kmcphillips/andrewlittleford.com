$ ->
  ImageUpload.initialize()

window.ImageUpload =
  initialize: (node) ->
    $('[data-modal-button]').on('click', ImageUpload.openPreviousImageModal)
    $('[data-previous-image-id]').on('click', ImageUpload.selectPreviousImage)
    $('[data-clear-image-button]').on('click', ImageUpload.clearImage)
    $('[data-file-field]').on('change', ImageUpload.fileChange)

    $('[data-previous-image]').dialog
      autoOpen: false
      modal: true
      height: 500
      width: 700
      title: "Select a previous image"
      buttons:
        Cancel: -> $(this).dialog("close")

  clearImage: ->
    ImageUpload.resetUpload()
    ImageUpload.resetPrevious()
    $('[data-clear-image-field]').val('true')

    false

  openPreviousImageModal: ->
    $('[data-previous-image]').dialog('open')

    false

  selectPreviousImage: ->
    id = $(this).data('previousImageId')
    src = $(this).data('previousImageThumb')

    $('[data-previous-image-field]').val(id)
    $('[data-previous-image]').dialog('close')

    $('[data-image]').attr('src', src)
    $('[data-image]').show()

    ImageUpload.resetUpload()
    ImageUpload.resetClear()

    false

  fileChange: ->
    if $(this).val()
      ImageUpload.resetClear()
      ImageUpload.resetPrevious()

  resetUpload: ->
    $('[data-file-field]').val('')

  resetPrevious: ->
    $('[data-previous-image-field]').val('')
    $('[data-image]').hide()

  resetClear: ->
    $('[data-clear-image-field]').val('')

  inspect: ->
    """
Previous image field : #{ $('[data-previous-image-field]').val() }
Clear image field    : #{ $('[data-clear-image-field]').val() }
File input field     : #{ $('[data-file-field]').val() }
    """
