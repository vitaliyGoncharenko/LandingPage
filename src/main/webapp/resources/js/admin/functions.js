function set_res(el,mess,duration) {
    var mess = mess || 'Data was saved!',
        duration = duration || 10000;
    el.html(mess);
    setTimeout(function(){
        if (el.html() == mess) {
            el.html('');
        }
    },duration);
}

function show_delete(callback) {
    $('#res_delete_confirm').html('');
    $('#popup_confirm_but').prop('disabled',false);
    $('#popup_confirm').stop().fadeIn(300,function(){
        $(window.top.document).find('#frm_iframe').css({
            'position':'fixed',
            'top': 0
        });
    });
    if (typeof callback == 'function') {
        show_delete.callback = callback;
    }
}

function block_confirm() {
    $('#popup_confirm_but').prop('disabled',true);
}

function confirm_delete() {
    if (typeof show_delete.callback == 'function') {
        show_delete.callback();
    } else {
        console.warn('"show_delete.callback" is not a function!');
    }
}

function close_delete() {
    $('#popup_confirm').stop().fadeOut(300);
    $(window.top.document).find('#frm_iframe').css({
        'position':'relative'
    });
}