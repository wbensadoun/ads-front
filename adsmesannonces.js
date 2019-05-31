var annonces = [];
$.ajax({
    url: 'http://localhost:8082/my-annonces/' + document.cookie,
    type: "GET",
    contentType: "application/json",
    dataType: "json",
    success: function (response) {
        annonces = response;
        console.log("Data Loaded: ", response);
        buildAnnonces(response);
    },
    error: function (err) {
        console.log(err)
    }
})

function buildAnnonces(lesAnnonces) {
    var li = function (annonce) {
        return `
            <li>
                <div class="row annonce-container">
                    <div class="nophoto col-md-3" value=` + annonce.id + `>
                    </div>
                    <div class="annonce-detail col-md-6 ">
                        <div>
                        <h3>` + annonce.titre + `</h3>
                        <h4>` + annonce.prix + `</h4>
                        </div>
                        <div>
                        <p> ` + annonce.categories + ` </p>
                        <p>` + annonce.dateCreation + `</p>
                        </div>
                    </div>
                </div>
               
            </li>
        `;
    }

    lesAnnonces = lesAnnonces.sort(function (a1, a2) {
        return ('' + a1.categories).localeCompare(a2.categories);
    });

    lesAnnonces.forEach(function (annonce) {
        $('#annoncesId').append(li(annonce))
    })
    $('.nophoto').on('click', function() {
        var id = $(this).attr('value');
        history.pushState({url: "/annoncedetailler.html?id=" + id }, "", "annoncedetailler.html?id=" + id);
        document.location.reload(true);
    })
}

$('.btn-research').on('click', function(e) {
    e.preventDefault();
    $('#annoncesId').empty();
    var query = $('.input-research').val() || '';
    var result = annonces.filter(function(annonce){
        return annonce.titre.toUpperCase().indexOf(query.toUpperCase()) >= 0;
    });
    buildAnnonces(result);
})

