var Publish = (function($) {

  'use strict';

  var $modal_data_lost_dialog = $('#modal-publish-data-lost');
  var $modal_active = null;

  function init_selector() {
    $('.publish--selector .publish__button-list').on('click', 'li > a', function(e) {
      e.preventDefault();
      var type = $(this).attr('data-type');
      load_modal(type);
    });
  }

  function init_data_lost_dialog() {
    $modal_data_lost_dialog.on('click', 'button', function() {
      $modal_data_lost_dialog.modal('hide');
      var confirmed = !$(this).hasClass('btn-default');
      if(confirmed) {
        $modal_active.data('confirmed', true);
        $modal_active.modal('hide');
      }
    });
  }

  function load_modal(type) {
    var id = 'modal-publish-' + type;
    var $modal = $('#' + id);
    if($modal.length) {
      return $modal.modal('show');
    }
    $modal = $('#modal-publish-template').clone().attr('id', id).addClass('publish--' + type).appendTo('body');
    $modal.find('.modal-title').text('发布' + $('.publish--selector [data-type=' + type + '] .publish__desc').text());
    $modal.on('show.bs.modal', function() {
      $('#modal-publish').modal('hide');
    });
    $modal.on('hide.bs.modal', function(e) {
      $modal_active = $(this);
      if($modal_active.data('unsaved')) {
        if($modal_active.data('confirmed')) {
          e.preventDefault();
          $modal_data_lost_dialog.modal('show');
        } else {
          $modal_active.data('unsaved', false);
          $modal_active.data('confirmed', false);
        }
      }
    });
    $modal.find('.modal-body').load('/publish/modal/' + type, function(response, status, xhr) {
      if(status == 'error') {
        $modal.remove();
        return alert('加载失败');
      }
      $modal.modal('show');
    });
  }

  init_selector();
  init_data_lost_dialog();

  return {};

})(jQuery);
