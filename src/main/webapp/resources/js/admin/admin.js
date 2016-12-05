
var fail_mess = 'There was an error, please try again later!';
$(document).ready(function(){

    $(document).on('click','#gallery',function() {
        event.preventDefault();
        $('#welcome_panel').attr('style', 'display: none');
        $('#edit_gallery').attr('style', '');

    });

    //----uses

    $(document).on('blur','form *',function(){
        $(window).trigger('resize');
    })

    $(document).on('click','#glyp-menu',function(){
        $('#admin-nav').stop().slideToggle();
    })

    // $(document).on('click','.link',function(event){
    //     event.preventDefault();
    //     $('#content').html($('#page-loader').html());
    //     var button = $(this);
    //     $.ajax({
    //         dataType: 'html',
    //         type: 'GET',
    //         url: '/admin/'+$(this).attr('href'),
    //         data: (typeof button.data('id') != 'undefined') ? {id: button.data('id')} : {}
    //     })
    //     .done(function(data){
    //         $('#content').html(data);
    //     })
    //     .fail(function(){
    //         $('#content').html('<h4>Error 404! Page not found!</h4>');
    //     })
    //     .always(function(){
    //         $(window).trigger('resize');
    //     })
    //     return false;
    // })

    $(window).resize(function(){
        if($(window).width() >= 975) {
            $('#admin-nav').stop().slideDown(0);
        }
    })

    $(document).on('change','.upload-wrap input[type=file]',function(event){
        var that = $(this);
        var imgEl = $('#pict').fadeIn();
        if(window.FileReader != undefined){
            var reader = new FileReader(),
                that2 = this;
            reader.onloadstart = function(){
                //$('#send-loader').fadeIn();
            }
            reader.onload = function(){
                that.prop('fileName',that2.files[0].name);
                $('.upload-wrap input[name=fileName]').val(that2.files[0].name);
                that.prop('reader',reader.result);
                that.prop('deletedImg',0);
                that.parent().prev().fadeIn();
                imgEl.attr('src',reader.result);
                $(window).trigger('resize');
                //$('#send-loader').fadeOut();
            };
            reader.readAsDataURL(event.target.files[0]);
        }
        else{
            $('.upload-wrap').html('Your browser is not supported!');
        }
    });

    $(document).on('click','i#del-img',function() {
        $('#pict').attr('src', '').fadeOut(0);
        $(this).fadeOut(0);
        var fileInput = $(this).siblings('.upload-inp-wrap').find('input[type=file]');
        $('.upload-wrap input[name=fileName]').val('');
        $('#img-but').wrap('<form>').closest('form').get(0).reset();
        $('#img-but').unwrap();

    });

    // $(document).on('click','#popup_close,#popup_cancel',close_delete);
    //
    // $(document).on('click','#popup_confirm_but', confirm_delete);

    $('#home_link.link').trigger('click');

    /* JQUERY VALIDATION RULES, BEGIN */

    /* rules for phone number */
    // jQuery.validator.addMethod("checkPhone", function(value, element) {
    //         return /(^[0-9]{10}$)|(^[0]{0}$)/.test(value);
    //     }, "This field must contain 10 numbers."
    // );
    //
    // /* only integer */
    // jQuery.validator.addMethod("onlyInt", function(value, element) {
    //         return /^[0-9]*$/.test(value);
    //     }, "This field must contain only numbers."
    // );

    /* JQUERY VALIDATION RULES, END */

});