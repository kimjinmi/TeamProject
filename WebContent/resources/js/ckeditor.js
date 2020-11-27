ClassicEditor 
    .create( document.querySelector('#bcontent')) 
    .then( editor => { 
        console.log( editor );
    } ) 
    .catch( error => { 
        console.error( error ); 
    } );
	
