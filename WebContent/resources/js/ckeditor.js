ClassicEditor 
    .create( document.querySelector('#textbox')) 
    .then( editor => { 
        console.log( editor );
    } ) 
    .catch( error => { 
        console.error( error ); 
    } );
	
