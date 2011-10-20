jQuery(function($) {
  $('a.completar_tarea').live('ajax:success', function(xhr, data) {
    $(this).parents('tr:first').replaceWith(data);
  });

  $('#tarea_auto_responsable').autocomplete({
    source: '/responsables/autocompletar.js'
  });
});
