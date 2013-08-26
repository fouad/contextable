Contextable
===========

Contextable is a minimal context menu replacement.

You can install via Bower.

## Usage

```javascript
  $(".clickable").contextable([{
    html: "<i class='icon-plus-sign'></i> Add Class",
    handler: function(e, ev) {
      $(ev.target).addClass('basic');
    }
  }, {
    html: "<i class='icon-remove-sign'></i> Remove Class",
    handler: function(e, ev) {
      $(ev.target).removeClass('basic');
    }
  }, {
    html: "<i class='icon-move'></i> Free Transform",
    handler: function(e, ev) {
      console.log("transform everything!");
    }
  }]);
```