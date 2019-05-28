$.ajax({
    url:'http://localhost:8082/annonces',
    type:"GET",
    data: JSON.stringify(data),
    contentType:"application/json",
    dataType:"json",
    success: function(response){
    console.log( "Data Loaded: ", response); 
    document.location.reload(true);           
},
error: function(err){
    console.log(err)
}
})