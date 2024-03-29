/**
 * 利用label辅助点击file框
 * 可完美解决在ie中的“访问限制”问题（即必须是用户点击才能进行文件上传）
 * 仅对class为custom-file-input应用
 */
$.customFileInput = function() {
    $('input[type=file].custom-file-input').each(function(i,elem){
        var $input = $(this);

        if(!$input.prop("id")) {
            $input.prop("id", "file_" + i);
        }
        var btnTitle = "上传图片...";
        if ($input.prop('title')) {
            btnTitle = $input.prop('title');
        }
        $input.wrap("<div class='file-input'></div>");

        var $btn = $('<a class="btn"><label for="' + $input.prop("id") + '">' + btnTitle + '</label></a>');
        $input.before($btn);
        $input.addClass("file-input-opacity");

        $input.change(function() {
            $btn.next('.name').remove();
            $btn.after('<span class="name">'+$(this).val()+'</span>');
        });

    });
};
$(function() {
    $.customFileInput();
    //修正firefox label不能触发输入框点击
    if(navigator.userAgent.indexOf("Firefox") > 0) {
        $(document).on('click', 'label', function(e) {
            if(e.currentTarget === this && e.target.nodeName !== 'INPUT') {
                $(this.control).click();
            }
        });
    }

});