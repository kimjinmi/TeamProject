var myEditor;

ClassicEditor 
    .create( document.querySelector('#bcontent')) 
    .then( editor => { 
        console.log( editor );
		myEditor = editor;
    } ) 
    .catch( err => { 
        console.error( err.stack ); 
    } );
	
