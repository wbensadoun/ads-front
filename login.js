$('#loginId').on('click', function(e){
   
    var login = $('input[name=login]').val();
    if(login == ''){
        $('#loginError').text('erreur il faut entrer un id')
        return;
    }
    

    var mdp = $('input[name=mdp]').val();
    if(mdp == ''){
        $('#mdpError').text('erreur il faut entrer un Mot de passe')
        return;
    }

    var data = { login: login, password: mdp }

    $.ajax({
        url:'http://localhost:8082/login',
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
            console.log(err)
        }
    })

})