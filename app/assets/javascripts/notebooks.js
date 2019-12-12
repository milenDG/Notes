// When all contents of the html have been loaded by the browser.
$(document).ready(() => {
    // Make all notebooks equal in size.
    let maxNotebookHeight = Number.MIN_VALUE;

    // All notebooks
    let $notebooks = $('.notebook');

    // Foreach notebook set the maxHeight
    $notebooks.each((index, element) => {
        maxNotebookHeight = Math.max(element.offsetHeight, maxNotebookHeight);
    });

    // Change the notebook css to correct the sizes.
    $notebooks.css("height", maxNotebookHeight);


    // If only one notebook then display on whole screen in middle.
    if($notebooks.length == 1){
        $('.notebook-holder')
            .removeClass('col-xl-6')
            .addClass('col-xl-8');

    }
});