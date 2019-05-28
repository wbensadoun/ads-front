var url = window.location.href;
if(url.indexOf('?') >=0) {
    var arguments = url.split('?')[1].split('=');
    var id = arguments[1];
    
    if(id) {
        $.ajax({
            url:'http://localhost:8082/annonces/' + id,
            type:"GET",
            contentType:"application/json",
            dataType:"json",
            success: function(response){
                console.log(response);
                var divs = function(annonce) {
                    return `
                    <div class="detail-container">
                        <div class="annonce-detailler col-md-6 ">
                            <div>
                                <h3>` + annonce.titre + `</h3>
                                <h4>`+ annonce.prix + `</h4>
                            </div>
                            <div>
                                <p>` + annonce.categories + `</p>
                                <p>` + annonce.dateCreation + `</p>
                            </div>
                    </div>
                    </div>
                        <div class="detail-description container">
                        <h3>Description</h3>
                        <p> ` + annonce.description + ` </p>
                    </div>
                    `;
                }
                $('#annonceId').append(divs(response));
            },
            error: function(err){
                console.log(err)
            }
        })
    }
}
