// Front-end validation for the email to be sent
function validateMail() {
    // Email validating RegEx (constant)
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/g;

    // Phone number validatiing RegEx
    const phoneRegex = /^([+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s./0-9]*)?$/g;

    // Get the values from all the fields of the forms
    let name = $('#name').val();
    let email = $('#email').val();
    let telephone = $('#telephone').val();
    let message = $('#message').val();
    let isCorrect = true;

    // Check the fields and if they are not correct -> display the error
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

    // If incorrect input do not make the post request
    if (isCorrect) {
        $('form')[0].submit();
    } else{
        // Make the submit button enabled after half a second.
        $('.invalid-feedback').css('display', 'block');
        setTimeout(() =>{
            $('#submit').removeAttr('disabled');
        }, 500);
    }

    return false;
}