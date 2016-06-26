var MyMessages = (function($) {

  'use strict';

  var options = {
    defaults: {
      message: {
        top_right_corner: '',
        enable_comment: false,
        show_comment_list: false,
        more_comments_btn: false
      },
      comment: {}
    },
    message: {
      map: {},
      translate: function(data) { return data; },
      load: {
        url: '',
        method: 'GET',
        contentType: 'application/x-www-form-urlencoded',
        data: {}
      },
      get: {
        url: '',
        method: 'GET',
        contentType: 'application/x-www-form-urlencoded',
        data: {}
      },
      acknowledge: {
        url: '',
        method: 'POST',
        contentType: 'application/x-www-form-urlencoded',
        data: {}
      },
      offset: undefined
    },
    comment: {
      map: {},
      translate: function(data) { return data; },
      load: {
        url: '',
        method: 'GET',
        contentType: 'application/x-www-form-urlencoded',
        data: {}
      },
      reply: {
        url: '',
        method: 'POST',
        reload_comments: true
      },
      get: {
        url: '',
        method: 'GET',
        contentType: 'application/x-www-form-urlencoded',
        data: {}
      }
    }
  };

  // Templates
  var tpl_message = $('#template-message').html() || '<li class="message__item media{% if notice %} notice{% endif %}" data-id="{{id}}" data-time="{{timestamp}}"{% if anchor %} id="{{anchor}}"{% endif %}>\
  <div class="media-left">\
    {% if author_url %}<a href="{{author_url}}">{% endif %}<img class="img-circle" src="{{avatar_url}}">{% if author_url %}</a>{% endif %}\
  </div>\
  <div class="media-body">\
    <h4 class="media-heading">{% if author_url %}<a href="{{author_url}}">{% endif %}{{author}}{% if author_url %}</a>{% endif %}<small>{{date}}</small></h4>\
    <div class="top-right-corner">\
      {{top_right_corner | safe}}\
    </div>\
    <div class="message__item-content{% if shrink %} shrinked{% endif %}">\
      {% if heading %}<div class="message__item-content__heading">{{heading}}</div>{% endif %}\
      {{message | safe}}\
      <div class="message__item-mask"></div>\
      <a href="#" class="collapse-button"></a>\
    </div>\
    {% if reply_quote %}\
    <div class="reply-quote" data-label="{{reply_quote_label}}">{{reply_quote}}</div>\
    {% endif %}\
    <ul class="message__labels">\
      {% for label in labels %}\
      <li class="label {{label.type}}" data-id="{{label.id}}">{% if label.url %}<a href="{{label.url}}">{% endif %}{{label.name}}{% if label.url %}</a>{% endif %}</li>\
      {% endfor %}\
    </ul>\
    {% if acknowledge %}<button type="button" class="btn btn-primary btn-lg btn-block message__ack-btn">确认收到</button>{% endif %}\
  </div>\
  {% if enable_comment %}\
  <div class="comment-box">\
    <form class="comment-box__form" action="#" method="post" enctype="multipart/form-data">\
      <input type="hidden" name="msgid" value="{{id}}" />\
      <input type="hidden" name="commentid" value="" />\
      <input class="comment-box__file-picker hidden" type="file" accept=".jpg,.jpeg,.png,.gif,.bmp" multiple />\
      <img class="img-circle" src="{{avatar_url}}">\
      <div class="input-group">\
        <div class="input-wrapper">\
          <div class="reply-quote" data-label=""></div>\
          <textarea class="form-control" rows="1" maxlength="255" placeholder="回复{{author}}"></textarea>\
          <button type="button" class="close" aria-label="取消"><span aria-hidden="true">&times;</span></button>\
        </div>\
        <span class="input-group-btn">\
          <button type="button" class="btn btn-default comment-box__image-btn"><i class="fa fa-picture-o"></i></button>\
          <button type="submit" class="btn btn-default comment-box__reply-btn">回复</button>\
        </span>\
      </div>\
      <div class="image-box">\
        <ul></ul>\
        <a href="#" class="add-image"><i class="fa fa-plus"></i></a>\
      </div>\
    </form>\
    <div class="progress-bar"></div>\
    {% if show_comment_list %}\
    <ul class="comment-box__list media-list"></ul>\
    {% if more_comments_btn %}\
    <div class="pagination-wrapper"></div>\
    <a href="#" class="comment-box__show-more">点击查看更多</a>\
    <a href="#" class="comment-box__show-less">点击收起评论列表</a>\
    {% endif %}\
    {% endif %}\
  </div>\
  {% endif %}\
</li>';
  var tpl_comment = $('#template-comment').html() || '<li class="comment-box__item media" data-id="{{id}}" data-time="{{timestamp}}">\
  <div class="media-left">\
    <a href="{{author_url}}"><img class="img-circle" src="{{avatar_url}}"></a><a href="{{author_url}}">{{author}}</a>\
  </div>\
  <div class="media-body">\
    <div class="comment-box__item-main">\
      <div class="reply-name">{% if reply_to %}{% if reply_to.profile_url %}<a href="{{reply_to.profile_url}}">{% endif %}{{reply_to.name}}{% if reply_to.profile_url %}</a>{% endif %}{% endif %}</div>\
      <div class="comment-box__item-content">{{message | safe}}</div>\
    </div>\
    <div class="comment-box__item-toolbox">\
      <span class="time">{{time}}</span>\
      <a href="#" class="reply-link">回复</a>\
    </div>\
  </div>\
</li>';
  if(window.nunjucks) {
    tpl_message = nunjucks.compile(tpl_message);
    tpl_comment = nunjucks.compile(tpl_comment);
  } else {
    tpl_message.__proto__.render =
    tpl_comment.__proto__.render = function() {
      return false;
    }
  }

  function timestamp_to_datetime(timestamp, format) {
    var object;
    format = format || 'YYYY-MM-DD HH:mm:ss';
    if(timestamp > 10000000000) {
      object = moment(timestamp);
    } else {
      object = moment.unix(timestamp);
    }
    return object.format(format);
  }
  window.timestamp_to_datetime = timestamp_to_datetime;

  function timestamp_to_date(timestamp, format) {
    var object;
    format = format || 'YYYY-MM-DD';
    if(timestamp > 10000000000) {
      object = moment(timestamp);
    } else {
      object = moment.unix(timestamp);
    }
    return object.format(format);
  }
  window.timestamp_to_date = timestamp_to_date;

  function access_object_by_path(object, path) {
    path = path.replace(/\[(\w+)\]/g, '.$1');
    path = path.replace(/^\./, '');
    var keys = path.split('.');
    for(var i = 0, n = keys.length; i < n; ++i) {
      var key = keys[i];
      if(key in object) {
        if(object === undefined || object === null) {
          return object;
        }
        object = object[key];
      } else {
        return;
      }
    }
    return object;
  }

  function init_message_load_more() {
    $('.message__load-more').on('click', function(e) {
      e.preventDefault();
      var $btn = $(this).blur();
      if($btn.hasClass('disabled') || $btn.hasClass('loading')) {
        return;
      }
      $btn.addClass('loading');
      var settings = options.message.load;
      var request_payload = $.extend({}, settings.data, {
        offset: options.message.offset
      });
      request(settings, request_payload, function(data) {
        $btn.removeClass('loading');
        var messages = [];
        options.message.offset = data.offset;
        if(!data.object.length) {
          return $btn.addClass('disabled');
        }
        $.each(data.object, function() {
          var params = $.extend({}, options.defaults.message, options.message.translate(this));
          var html = tpl_message.render(params);
          var $message = $(html);
          params.comments = this.complexComments;
          $message.data('data', params);
          if(params.show_comment_list && params.comments) {
            $message.find('.comment-box__list').append($.map(params.comments, function(comment) {
              var params = $.extend({}, options.defaults.comment, options.comment.translate(comment));
              return tpl_comment.render(params);
            }));
          }
          messages.push($message);
        });
        $('ul.message').append(messages);
        var $messages = $('.message__item:not(.img-cover-inited)');
        try {
          $messages.addClass('img-cover-inited');
          bind_lightbox($messages);
        } catch(e) {}
      }, function(error) {
        $btn.removeClass('loading');
      });
    });
  }

  function init_acknowledge_button() {
    $('.message').on('click', '.message__ack-btn', function(e) {
      e.preventDefault();
      var $ack_btn = $(this);
      var $msg_item = $ack_btn.closest('.message__item');
      if($ack_btn.prop('disabled')) {
        return false;
      }
      $ack_btn.text('确认中...').prop('disabled', true);
      var id = $msg_item.data('id');
      var settings = options.message.acknowledge;
      var request_payload = $.extend({}, settings.data, {
        id: id
      });
      request(settings, request_payload, function(data) {
        $ack_btn.addClass('hidden');
        $msg_item.removeClass('notice');
        render_message_item(id);
        alert(data.message);
      }, function(error, jqxhr, textStatus) {
        $ack_btn.text('确认收到').prop('disabled', false);
        alert(error.message || error);
      });
    });
  }

  function init_collapse_button() {
    $('.message').on('click', '.message__item-content .collapse-button', function(e) {
      e.preventDefault();
      var $msg_main = $(this).blur().closest('.message__item-content');
      $msg_main.toggleClass('expanded shrinked');
    });
  }

  function init_image_box() {
    $('.message').on('click', '.comment-box__image-btn', function(e) {
      e.preventDefault();
      var $img_btn = $(this).blur();
      var $msg_item = $img_btn.closest('.message__item');
      var $img_box = $msg_item.find('.image-box');
      $img_box.toggleClass('show');
    });

    $('.message').on('click', '.image-box > .add-image', function(e) {
      e.preventDefault();
      if(typeof FormData == 'undefined') {
        return alert('您的浏览器不支持该功能！请使用 Chrome、Firefox、Edge 或 IE11');
      }
      $(this).closest('.comment-box__form').find('.comment-box__file-picker')[0].click();
    });

    $('.message').on('change', '.comment-box__file-picker', function(e) {
      var $this = $(this);
      var $form = $this.closest('.comment-box__form');
      var $image_box = $form.find('.image-box');
      var $list = $image_box.find('> ul');
      if(this.files.length + $list.find('> li').length > 9) {
        $this.val(null);
        alert('您选择的文件数量已达上限!');
        return false;
      }
      $.each(this.files, function() {
        if($.inArray(this.type, ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/png', 'image/x-png', 'image/gif', 'image/bmp', 'image/x-windows-bmp']) < 0) {
          return alert('文件 ' + this.name + ' 格式不正确');
        } else if(this.size > 10311680) {
          return alert('文件 ' + this.name + ' 的大小超过 5MB!');
        }
        var $file = $('<li><a href="#"><img></a></li>');
        var reader  = new FileReader();
        reader.addEventListener('load', function() {
          $file.find('img').attr('src', reader.result);
          fit_image_to_container($file);
        }, false);
        $file.data('data', this);
        $list.append($file);
        reader.readAsDataURL(this);
      });
      if($list.find('> li').length == 9) {
        $image_box.find('.add-image').addClass('hidden');
      }
    });

    $('.message').on('click', '.image-box > ul a', function(e) {
      e.preventDefault();
      e.stopPropagation();
      var $item = $(this).closest('li');
      var $image_box = $item.closest('.image-box');
      var $form = $image_box.closest('.comment-box__form');
      var $add_button = $image_box.find('.add-image');
      $form.find('.comment-box__file-picker').val(null);
      $item.remove();
      $add_button.removeClass('hidden');
    });

    $(document).on('click', function(e) {
      var $target = $(e.target);
      if($target.is('.comment-box__file-picker')) {
        return;
      }
      var $imgbox = $target.closest('.image-box');
      var $imgbtn = $target.closest('.comment-box__image-btn');
      if(!$imgbox.length && !$imgbtn.length) {
        $('.message__item .image-box.show').removeClass('show');
      }
    });
  }

  function init_comment_input() {
    var lastWhich;
    $('.message').on('keypress', 'textarea', function(e) {
      if(e.which == 13 || e.which == 10 && e.ctrlKey) { // Enter / Ctrl + Enter
        e.preventDefault();
        var content = $.trim($(this).val());
        if(content != '') {
          $(this).closest('.comment-box__form').submit();
        }
      }
    });

    $('.message').on('keydown', 'textarea', function(e) {
      if(e.which == 8) { // Backspace
        if($(this).val() == '') {
          e.preventDefault();
          if(lastWhich != e.which) {
            var $message_item = $(this).closest('.message__item');
            hide_reply_quote($message_item);
          }
        }
      }
      lastWhich = e.which;
      var $this = $(this);
      var paddingBottom = parseInt($this.css('paddingBottom'));
      var paddingTop = parseInt($this.css('paddingTop'));
      $(this).height(0).height(this.scrollHeight - paddingBottom - paddingTop);
    });

    $('.message').on('keyup', 'textarea', function(e) {
      lastWhich = null;
    });
  }

  function init_reply_button() {
    $('.message').on('click', '.comment-box__item-toolbox .reply-link', function(e) {
      e.preventDefault();
      var $comment_item = $(this).closest('.comment-box__item');
      var $message_item = $comment_item.closest('.message__item');
      var $form = $message_item.find('.comment-box__form');
      var $inputbox = $form.find('.input-wrapper');
      var $content = $comment_item.find('.comment-box__item-content').clone();
      var replyto = $.trim($comment_item.find('> .media-left').text());
      $content.find('img').replaceWith('[图片]');
      $content.find('table').replaceWith('[表格]');
      var content = $content.text();
      $inputbox.find('.reply-quote').attr('data-label', replyto ? replyto + '：' : '').text(content);
      $inputbox.addClass('with-reply-quote');
      $inputbox.find('textarea').attr('placeholder', replyto ? '回复' + replyto : '').select();
      $form.find('[name=commentid]').val($comment_item.attr('data-id'));
    });

    $('.message').on('click', '.with-reply-quote .close', function(e) {
      e.preventDefault();
      var $message_item = $(this).closest('.message__item');
      hide_reply_quote($message_item);
    });
  }

  function init_comment_paging() {
    $('.message').on('split-page:success', '.message__item .comment-box', function(event, data) {
      var $container = $(this).find('.comment-box__list').empty();
      if(!data.object.length) {
        $container.append('<li class="text-center text-muted">暂无评论</li>');
        return;
      }
      $container.append($.map(data.object, function(val, i) {
        var params = $.extend({}, options.defaults.comment, options.comment.translate(val));
        var html = tpl_comment.render(params);
        return html;
      }));
      bind_lightbox($container);
    }).on('split-page:error', '.message__item .comment-box', function(event) {
      var $container = $(this).find('.comment-box__list').empty();
      $container.append('<li class="text-center text-muted">加载失败 请稍候再试</li>');
    }).on('click', '.comment-box__show-more', function(event) {
      event.preventDefault();
      var $comment_box = $(this).blur().closest('.comment-box').addClass('with-pagination');
      var initial_comments = $comment_box.data('initial-comments');
      if(!initial_comments) {
        $comment_box.data('initial_comments', $comment_box.find('.comment-box__list').html());
      }
      // TODO
      var settings = options.comment.load;
      var payload = $.extend({}, settings.data, {
        msgid: $comment_box.closest('.message__item').attr('data-id')
      });
      $comment_box.splitpage({
        url: settings.url,
        type: settings.method,
        contentType: 'application/json'
      }, payload);
    }).on('click', '.comment-box__show-less', function(event) {
      event.preventDefault();
      var $comment_box = $(this).blur().closest('.comment-box').removeClass('with-pagination');
      $comment_box.find('.comment-box__list').html($comment_box.data('initial_comments'));
      // TODO
      $comment_box.splitpage('destroy');
    });
  }

  function init_comment_post() {
    $('.message').on('submit', '.comment-box__form', function(e) {
      e.preventDefault();
      var $form = $(this);
      var $textarea = $form.find('textarea');
      var $form_elements = $form.find('button, textarea');
      var $pictures = $form.find('.image-box > ul > li');
      var file_count = 0;
      if($form_elements.prop('disabled')) {
        return false;
      }
      if(!$textarea.val() && !$pictures.length) {
        return $textarea.focus();
      }
      $form_elements.prop('disabled', true);
      var $progress_bar = $form.next('.progress-bar').empty();
      var $progress = $('<div class="progress"></div>').appendTo($progress_bar);
      var formData = new FormData($form[0]);
      formData.append('comment', $.trim($textarea.val()));
      $pictures.each(function() {
        ++file_count;
        formData.append('pictures[]', $(this).data('data'));
      });
      if(file_count) {
        $progress_bar.addClass('is-loading');
      }
      request($.extend({}, options.comment.reply, {
        xhr: function() {
          var xhr = $.ajaxSettings.xhr();
          if(xhr.upload) {
            xhr.upload.addEventListener('progress', function(progress) {
              var percent = progress.loaded / progress.total;
              $progress.width((percent * 100) + '%');
            }, false);
          }
          return xhr;
        },
        cache: false,
        contentType: false,
        processData: false
      }), formData, function(data) {
        $progress.width('100%');
        $progress_bar.removeClass('is-loading');
        $form_elements.prop('disabled', false);
        $textarea.val(null).trigger('keydown');
        $pictures.empty();
        var $message_item = $form.closest('.message__item');
        hide_reply_quote($message_item);
        if(options.comment.reply.reload_comments) {
          render_message_item($message_item.attr('data-id'));
        }
        alert(data.message);
      }, function(error) {
        $progress.width('100%');
        $progress_bar.removeClass('is-loading');
        $form_elements.prop('disabled', false);
        alert(error.message || error);
      });
    });
  }

  function init_image_lightbox() {
    $('body').append('<style type="text/css">\
.image-source-link {\
  color: #98C3D1;\
}\
.mfp-with-zoom .mfp-container,\
.mfp-with-zoom.mfp-bg {\
  opacity: 0;\
  -webkit-backface-visibility: hidden;\
  -webkit-transition: all 0.3s ease-out;\
  -moz-transition: all 0.3s ease-out;\
  -o-transition: all 0.3s ease-out;\
  transition: all 0.3s ease-out;\
}\
.mfp-with-zoom.mfp-ready .mfp-container {\
  opacity: 1;\
}\
.mfp-with-zoom.mfp-ready.mfp-bg {\
  opacity: 0.8;\
}\
.mfp-with-zoom.mfp-removing .mfp-container,\
.mfp-with-zoom.mfp-removing.mfp-bg {\
  opacity: 0;\
}\
</style>');
    if($.magnificPopup) {
      $.extend(true, $.magnificPopup.defaults, {
        tClose: '关闭 (Esc)',
        tLoading: '正在加载...',
        gallery: {
          tPrev: '上一张',
          tNext: '下一张',
          tCounter: '%curr% / %total%'
        },
        image: {
          tError: '<a href="%url%">图片</a>加载失败'
        },
        ajax: {
          tError: '<a href="%url%">内容</a>加载失败'
        }
      });
    }
  }

  function bind_lightbox($container) {
    var options = {
      delegate: '.img-cover',
      type: 'image',
      closeOnContentClick: false,
      closeBtnInside: false,
      mainClass: 'mfp-with-zoom mfp-img-mobile',
      image: {
        verticalFit: true,
        titleSrc: function(item) {
          return '<a class="image-source-link" href="' + item.src + '" target="_blank">原始图片</a>';
        }
      },
      gallery: {
        enabled: true
      },
      zoom: {
        enabled: true,
        duration: 300,
        opener: function(element) {
          return element.find('img');
        }
      }
    };
    $container.find('.message__item-content, .comment-box__item-content').each(function() {
      $(this).magnificPopup(options);
    });
    fit_image_to_container($container.find('.img-cover'));
  }

  function fit_image_to_container($container) {
    $container.find('img').on('load.fit-container', function() {
      var $this = $(this);
      var fillClass = $this.height() > $this.width() ? 'fillwidth' : 'fillheight';
      $this.addClass(fillClass).off('load.fit-container');
    }).each(function() {
      if(this.complete) $(this).load();
    });
  }

  function hide_reply_quote(message_item) {
    var $message_item = $(message_item);
    var $form = $message_item.find('.comment-box__form');
    var $inputbox = $form.find('.input-wrapper');
    if($inputbox.hasClass('with-reply-quote')) {
      var $heading = $message_item.find('.media-heading').clone();
      $heading.find('small').remove();
      $inputbox.removeClass('with-reply-quote');
      $inputbox.find('textarea').attr('placeholder', '回复' + $heading.text()).focus();
      $form.find('[name=commentid]').val(null);
    }
  }

  function render_message_item(id, params, success, fail) {
    if(params) {
      var html = tpl_message.render(params);
      var $item = $('.message__item[data-id=' + id + ']');
      var $message = $(html);
      $message.data('data', params);
      if(params.show_comment_list && params.comments) {
        $message.find('.comment-box__list').append($.map(params.comments, function(comment) {
          var params = $.extend({}, options.defaults.comment, options.comment.translate(comment));
          return tpl_comment.render(params);
        }));
      }
      if($item.length) {
        $item.replaceWith($message);
      } else {
        $('ul.message').append($message);
      }
      $message.addClass('img-cover-inited');
      try {
        bind_lightbox($message);
      } catch(e) {}
      if(success) {
        success.call(null, id);
      }
      return;
    }
    var settings = options.message.get;
    var payload = $.extend({}, settings.data, {
      msgid: id
    });
    request(settings, payload, function(data) {
      if(!data.object) {
        if(fail) fail.call(null);
        return false;
      }
      var params = $.extend({}, options.defaults.message, options.message.translate(data.object));
      params.comments = data.object.complexComments;
      render_message_item(id, params, success);
    }, fail);
  }

  function translate_object(data, map, defaults) {
    var result = $.extend({}, defaults, data);
    $.each(map, function _translate(key, value, object) {
      if(!object) {
        object = result;
      }
      if(typeof value == 'function') {
        object[key] = value.call(null, object);
      } else if(typeof value == 'string') {
        if(value) {
          object[key] = access_object_by_path(object, value);
        } else {
          object[key] = '';
        }
        if(object[key] === undefined) {
          object[key] = value;
        }
      } else if($.isPlainObject(value)) {
        for(var _k in value) {
          if(!value.hasOwnProperty(_k)) continue;
          if(!object[key]) object[key] = {};
          _translate(_k, value[_k], object[key]);
        }
      } else {
        object[key] = value;
      }
    });
    return result;
  }

  function request(options, data, callback, errhandler) {
    if(options.method.toUpperCase() != 'GET' && options.contentType == 'application/json' && $.isPlainObject(data)) {
      data = JSON.stringify(data);
    }
    $.ajax($.extend({}, options, {
      dataType: 'json',
      data: data,
      complete: function(jqXHR, textStatus) {
        if(jqXHR.status != 200 || jqXHR.responseJSON && jqXHR.responseJSON.code != '200') {
          // TODO: advanced error handling
          var error = jqXHR.responseJSON || jqXHR.responseXML || jqXHR.responseText;
          if(typeof error == 'string') {
            try {
              error = JSON.parse(error);
            } catch(e) {}
          }
          console.error(error);
          if(errhandler) {
            errhandler.call(this, error, jqXHR, textStatus);
          }
        }
      },
      success: function(data, textStatus, jqXHR) {
        if(jqXHR.status != 200 || data.code != '200') return;
        callback.apply(this, arguments);
      }
    }));
  }

  return {
    init: function(settings) {
      $.extend(true, options, settings);
      init_message_load_more();
      init_acknowledge_button();
      init_collapse_button();
      init_reply_button();
      init_image_box();
      init_comment_input();
      init_comment_paging();
      init_comment_post();
      init_image_lightbox();

      var matches = location.search.match(/[?&]id=([^&]+)/);
      if(matches && options.message.get.url) {
        var id = matches[1];
        render_message_item(id, null, null, function() {
          $('.message__load-more').removeClass('hidden').trigger('click');
        });
        $('.message__load-more').addClass('hidden');
      } else {
        $('.message__load-more').trigger('click');
      }
    },
    timestamp_to_date: timestamp_to_date,
    timestamp_to_datetime: timestamp_to_datetime,
    render_message_item: render_message_item,
    translate_object: translate_object,
    request: request
  };

})(this.jQuery);
