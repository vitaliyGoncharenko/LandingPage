$(document).ready(function () {

    $(document).on('click', '#add_list_img', function () {
        var parent = $('#tpl-uploaded-imgs').clone().removeAttr('id'),
            input = parent.find('input[type=file]'),
            file = input[0].files[0];
        imgEl = parent.find('.list-img');
        // alert('file - '+file.)
        $('.uploaded-imgs').append(parent);
        $('#add_list_img_res').html('');
        input.trigger('click');
        input.prop('remove_this', true);

    });

    $(document).on('change', '#new_image', function () {
            event.preventDefault();
            if ($('#new_image').val() != '') {
                var file = $(this)[0].files[0];
                var fileName = file.name;
                var parent_form = $(this).parent();
                var parent_div = parent_form.parent();
                parent_div.find('.img_name').val('/resources/uploaded/' + fileName);

                $('form#add_image_form').submit();
                parent_form.removeAttr('id');
            }
        }
    );

    $(document).on('submit', '#add_image_form', function (event) {
        event.preventDefault();
        var form = $(this),
            formData = new FormData(form[0]),
            len = del_imgs.length;
        $.ajax({
            dataType: 'json',
            url: '/home/admin/' + form.attr('action'),
            type: 'POST',
            data: formData,
            cache: false,
            processData: false,
            contentType: false
        })
        return false;
    });

    $(document).on('change', '.list-img-wrap input[type=file]', function () {
        if (window.FileReader != undefined) {
            var input = this,
                parent = $(input).closest('.list-img-wrap'),
                imgEl = parent.find('.list-img');
            var reader = new FileReader();
            reader.onloadstart = function () {
                $('#add_list_img_res').html('Please wait!');
            }
            reader.onload = function () {
                imgEl.attr('style', 'background-image: url("' + reader.result + '")');
                $(window).trigger('resize');
                $('#add_list_img_res').html('');
            };
            if (input.files[0]) {
                reader.readAsDataURL(input.files[0]);
                parent.removeClass('display-none');
            } else {
                set_res($('#add_list_img_res'), 'Image was not uploaded!');
            }
        } else {
            set_res($('#add_list_img_res'), 'Your browser is not supported!');
        }
    });
    $(document).on('click', '.img-list-remove-button', function () {
        event.preventDefault();

        var parent_div = $(this).parent();
        var input_name_file = parent_div.find('.img_name');
        var remove_form = input_name_file.parent();
        var url = '/home/admin/image/remove';
        var msg = remove_form.serialize();
        $.ajax({
            type: 'GET',
            url: url,
            dataType: 'text',
            data: msg,
            success: function (data) {
            },
            error: function (xhr, str) {
            }
        });

        var parent = $(this).closest('.list-img-wrap'),
            img_name;
        if (!parent.is('#tpl-uploaded-imgs')) {
            parent.remove();
            img_name = parent.find(".img_names").val();
            if (img_name != '') {
                del_imgs.push(img_name);
            }
        }
    });

    $(document).on('click', '.file-button', function () {
        $(this).prev().trigger('click');
    });

    $(document).on('submit', '#edit_listing_form', function (event) {
        $('#page_res').html('Please wait!');
        event.preventDefault();
        var form = $(this),
            formData = new FormData(form[0]),
            len = del_imgs.length;
        $('.list-img-wrap').not('#tpl-uploaded-imgs').each(function () {
            if ($(this).hasClass('display-none')) {
                $(this).remove();
            }
        });
        formData.append('garage', $('#garage-chbox').prop('checked') ? '1' : '0');
        formData.append('show_home', $('#show-home-chbox').prop('checked') ? '1' : '0');
        for (var i = 0; i < len; i++) {
            formData.append('del_imgs[]', del_imgs[i]);
        }
        $.ajax({
            dataType: 'json',
            url: '/home/admin/' + form.attr('action'),
            type: 'POST',
            data: formData,
            cache: false,
            processData: false,
            contentType: false
        })
            .done(function (data) {
                if (data.status == '1') {
                    set_res($('#page_res'), data.mess);
                    if (!$('input').is('[name=id]')) {
                        form[0].reset();
                        $('i#del-img').trigger('click');
                        $('.img-list-remove-button').each(function () {
                            $(this).trigger('click');
                        });
                    } else {
                        var i = 0;
                        $('.list-img-wrap .img_names').each(function () {
                            if ($(this).val() == '') {
                                $(this).val(data.data[i++]);
                            }
                        });
                    }
                    del_imgs = [];
                } else {
                    $('#page_res').html(data.mess);
                }
            })
            .fail(function () {
                $('#page_res').html(fail_mess);
            });
        return false;
    })
    $(document).on('change', '.remove_image_form', function (event) {
        alert('1');
        event.preventDefault();
    })


});