// http://locutus.io/php/strings/htmlspecialchars/
function htmlspecialchars(string, quoteStyle, charset, doubleEncode) {
  var optTemp = 0;
  var i = 0;
  var noquotes = false;
  if(typeof quoteStyle === 'undefined' || quoteStyle === null) {
    quoteStyle = 2;
  }
  string = string || '';
  string = string.toString();
  if(doubleEncode !== false) {
    string = string.replace(/&/g, '&amp;');
  }
  string = string.replace(/</g, '&lt;').replace(/>/g, '&gt;');
  var OPTS = {
    'ENT_NOQUOTES': 0,
    'ENT_HTML_QUOTE_SINGLE': 1,
    'ENT_HTML_QUOTE_DOUBLE': 2,
    'ENT_COMPAT': 2,
    'ENT_QUOTES': 3,
    'ENT_IGNORE': 4
  };
  if(quoteStyle === 0) {
    noquotes = true;
  }
  if(typeof quoteStyle !== 'number') {
    quoteStyle = [].concat(quoteStyle);
    for (i = 0; i < quoteStyle.length; i++) {
      if(OPTS[quoteStyle[i]] === 0) {
        noquotes = true;
      } else if(OPTS[quoteStyle[i]]) {
        optTemp = optTemp | OPTS[quoteStyle[i]];
      }
    }
    quoteStyle = optTemp;
  }
  if(quoteStyle & OPTS.ENT_HTML_QUOTE_SINGLE) {
    string = string.replace(/'/g, '&#039;');
  }
  if(!noquotes) {
    string = string.replace(/"/g, '&quot;');
  }
  return string;
}

function nl2br(str, isXhtml) {
  var breakTag = (isXhtml || typeof isXhtml === 'undefined') ? '<br ' + '/>' : '<br>';
  return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
}

function strip_tags(input, allowed) {
  allowed = (((allowed || '') + '').toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join('');
  var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi;
  var commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
  return input.replace(commentsAndPhpTags, '').replace(tags, function($0, $1) {
    return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0 : '';
  });
}

function ltrim(str, charlist) {
  charlist = !charlist ? ' \\s\u00A0' : (charlist + '').replace(/([\[\]\(\)\.\?\/\*\{\}\+\$\^:])/g, '$1');
  var re = new RegExp('^[' + charlist + ']+', 'g');
  return (str + '').replace(re, '');
}

function rtrim(str, charlist) {
  charlist = !charlist ? ' \\s\u00A0' : (charlist + '').replace(/([\[\]\(\)\.\?\/\*\{\}\+\$\^:])/g, '\\$1');
  var re = new RegExp('[' + charlist + ']+$', 'g');
  return (str + '').replace(re, '');
}
