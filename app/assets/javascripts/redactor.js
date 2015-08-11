
window.init_redactor = function(){
  $.Redactor.prototype.underline = function()
  {
      return {
          init: function()
          {
              var button = this.button.addAfter('italic', 'underline', 'Underline');
              this.button.addCallback(button, this.underline.format);
          },
          format: function()
          {
              this.inline.format('u');
          }
      };
  };

  var csrf_token = $('meta[name=csrf-token]').attr('content');
  var csrf_param = $('meta[name=csrf-param]').attr('content');
  var params;
  if (csrf_param !== undefined && csrf_token !== undefined) {
    params = csrf_param + "=" + encodeURIComponent(csrf_token);
  }

  $('.redactor-fancy').redactor({
    "buttons": ['formatting',
                'bold',
                'italic',
                'underline',
                'fontsize',
                'fontcolor',
                'changefontfamily',
                'fullscreen',
                'textdirection',
                'clips',
                'outdent',
                'indent',
                'orderedlist',
                'unorderedlist',
                'link',
                'alignment',
                'horizontalrule'],
    "plugins": ['fontsize',
                'fontcolor',
                'fontfamily',
                'fullscreen',
                'textdirection',
                'clips',
                'underline']
  });
}

$(document).on( 'ready page:load', window.init_redactor );
