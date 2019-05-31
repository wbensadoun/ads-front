if(document.cookie != '' && document.cookie != undefined) {
    $('.login').hide();
    $('.inscription').hide();
} else {
    $('.mess').hide();
    $('.depose-ann').hide();
    $('.mes-ann').hide();
    $('.deconnection').hide();
}

$('.deconnection').on('click', function() {
    document.cookie = '';
})