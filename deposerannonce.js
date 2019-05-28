$('#deposerannonceId').on('click', function(e){
    var categories = $('#categorie').val();
    if(categories == 'Choisir :'){
        $('#categoriesError').text('erreur il faut choisir une catégorie ')
        return;
    }
       
    var type = $('input[name=type]').val();
    var offre = $("input[name=type]:checked").val();

    if(!offre){
        $('#typeError').text('il faut choisir le type !')
        return;
    }
    if( type == ''  ){
        $('#typeError').text('il faut choisir le type !')
        return;
    }
    var titre = $('input[name=titre]').val();
    if(titre == ''){
        $('#titreError').text('il faut un titre pour votre annonce ! ')
        return;
    }
    var description = $('textarea[name=description]').val();
    if(description == ''){
        $('#descriptionError').text('Description trop courte ')
        return;
    }
    
   
    var prix = $('input[name=number]').val();
    if(prix == ''){
        $('#prixError').text('il faut entrer un prix')
        return;
    }

    var data = {titre: titre, description: description, type: type,  prix: prix, categories: categories}
    console.log(data)

    $.ajax({
        url:'http://localhost:8082/annonces',
        type:"POST",
        data: JSON.stringify(data),
        contentType:"application/json",
        dataType:"json",
        success: function(response){
            console.log( "Data Loaded: ", response);
            history.pushState({url: "/annoncedetailler.html?id=" + response.id }, "", "annoncedetailler.html?id=" + response.id);
            document.location.reload(true);
            
        },
        error: function(err){
            console.log(err)
        }
    })

})
