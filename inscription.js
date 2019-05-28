$('#inscriptionId').on('click', function(e){
    console.log('azerty')

    var pseudo = $('input[name=pseudo]').val();
    if(pseudo == ''){
        $('#pseudoError').text('entrer un pseudo ')
        return;
    }
    var email = $('input[name=email]').val();
    if(email == ''){
        $('#emailError').text(' il faut entrer un email !')
        return;
    }  
    var password = $('input[name=password]').val();
    if(password == ''){
        $('#mdpError').text('erreur il faut entrer un Mot de passe')
        return;
    }

    var passwordconfirmed = $('input[name=passwordconfirmed]').val();
    if(passwordconfirmed == ''){
        $('#mdpconfirmError').text('erreur il faut confirmer le Mot de passe')
        return;
    }
    if(passwordconfirmed != password){
        $('#mdpconfirmError').text('les deux mots de passe sont différents')
        return;
    }

    var data = { login: pseudo, email: email, password: password, passwordconfirmed: passwordconfirmed }

    $.ajax({
        url:'http://localhost:8082/users',
        type:"POST",
        data: JSON.stringify(data),
        contentType:"application/json",
        dataType:"json",
        success: function(response){
            console.log( "Data Loaded: ", response); 
            history.pushState({url: "/adsindex.html"}, "", "adsindex.html");
            document.location.reload(true);
            
        },
        error: function(err){
            $('#pseudoError').text('ce pseudo existe déjà')
        }
    })

})