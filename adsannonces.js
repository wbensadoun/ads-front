$.ajax({
    url:'http://localhost:8082/annonces',
    type:"GET",
    contentType:"application/json",
    dataType:"json",
    success: function(response){
        console.log(response)
        var li  = function(annonce) {
            return `
                <li>
                    <div class="row annonce-container">
                        <div class="nophoto col-md-3">
                        </div>
                        <div class="annonce-detail col-md-6 ">
                            <div>
                            <h3>` + annonce.titre + `</h3>
                            <h4>` + annonce.prix +`</h4>
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

        response = response.sort(function(a1, a2) {
            return ('' +  a1.categories).localeCompare(a2.categories);
        });

        response.forEach(function(annonce) {
            $('#annoncesId').append(li(annonce))
        })
    },
    error: function(err){
        console.log(err)
    }
})