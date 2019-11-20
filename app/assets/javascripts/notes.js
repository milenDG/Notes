$(document).ready(() => {
    // Make all notes equal in size.
    let maxNoteHeight = Number.MIN_VALUE;

    // All notes
    let $notes = $('.note');

    // Foreach note set the maxHeight
    $notes.each((index, element) => {
        maxNoteHeight = Math.max(element.offsetHeight, maxNoteHeight);
    });

    // Change the note css to correct the sizes.
    $notes.css("height", maxNoteHeight);


    // If only one notebook then display on whole screen in middle.
    if($notes.length == 1){
        $('.note-holder')
            .removeClass('col-xl-6')
            .addClass('col-xl-8');

    }
});