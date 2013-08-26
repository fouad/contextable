$ = jQuery

contextable = (menu) ->
  if not menu?
    throw new Error "Contextable - `menu` must be an object."

  $el = $(this)
  $menu = $('<ul class="contextable-menu"></ul>')

  $el.on 'contextmenu', (ev) ->
    ev.preventDefault()
    ev.stopPropagation()

    # check if right click
    if ev.which is 3
      # prevent duplicate menus
      if $el.data('menu')
        destroyMenu()

      createMenu(ev)
      $el.data 'menu', true

  createMenu = (ev) ->
    for item in menu
      $item = $("<li class='contextable-item'>#{item.html}</li>")
      $item.data 'fn', item.handler
      $item.click (e) ->
        # e is the menu item click event
        # ev is the initial element's click event
        fn = $(e.target).data('fn')
        fn e, ev

      $menu.append($item)

    $menu.css top: ev.pageY, left: ev.pageX

    $("body").append($menu)
    $(document).on 'click', 'html', (e) ->
      destroyMenu()

  destroyMenu = ->
    $menu.remove()
    $menu = $('<ul class="contextable-menu"></ul>')

    $el.data 'menu', false

    $(document).off 'click', 'html'

$.fn.extend
  contextable: contextable
$.fn.contextable = contextable