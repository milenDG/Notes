function validateMail() {
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/g;
    const phoneRegex = /^([+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s./0-9]*)?$/g;

    let name = $('#name').val();
    let email = $('#email').val();
    let telephone = $('#telephone').val();
    let message = $('#message').val();
    let isCorrect = true;

    if (!name) {
        $('#name-error').text('Name must not be empty!');
        isCorrect = false;
    } else {
        $('#name-error').text('');
    }

    if (!email.match(emailRegex)) {
        $('#email-error').text('Incorrect email!');
        isCorrect = false;
    } else {
        $('#email-error').text('');
    }

    if (!telephone.match(phoneRegex)) {
        $('#telephone-error').text('Incorrect telephone!');
        isCorrect = false;
    } else {
        $('#telephone-error').text('');
    }

    if (!message) {
        $('#message-error').text('Message must not be empty!');
        isCorrect = false;
    } else {
        $('#message-error').text('');
    }

    if (isCorrect) {
        $('form')[0].submit();
    } else{
        $('.invalid-feedback').css('display', 'block');
        setTimeout(() =>{
            $('#submit').removeAttr('disabled');
        }, 500);
    }

    return false;
}