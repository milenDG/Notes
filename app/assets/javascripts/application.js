// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require bootstrap-sprockets
//= require cookiealert
//= require jquery_ujs
//= require_tree .

$(document).ready(() => {
    //Show cookie notice.
    showCookieNotice();

    // Remove alerts after 2 seconds
    window.setTimeout(function() {
        $(".alert").fadeTo(500, 0).slideUp(500, function(){
            $(this).remove();
        });
    }, 2000);

    //Set current navigation link on header
    $('ul li[controller=' + location.pathname.split("/")[1] + '] a')[0].classList.add('active')
})

function validateForm() {
    let title = $('#title').val();
    let content = $('#content').val();
    let isCorrect = true;

    if (!title) {
        $('#title-error').text('Title must not be empty!');
        isCorrect = false;
    } else {
        $('#title-error').text('');
    }

    if(!content ) {
        $('#content-error').text('Content must not be empty!');
        isCorrect = false;
    } else {
        $('#content-error').text('');
    }

    if (isCorrect) {
        $('form')[0].submit();
    } else{
        $('.invalid-feedback').css('display', 'block');
        setTimeout(() =>{
            $('#submit').removeAttr('disabled');
        }, 500);
    }

    return isCorrect;
}




