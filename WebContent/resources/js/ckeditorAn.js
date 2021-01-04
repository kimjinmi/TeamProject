var myEditor;

ClassicEditor 
    .create( document.querySelector('#acontent'), {
		ckfinder: {
	        uploadUrl: "/teamproject/announce/upload"
	    }
	}) 
    .then( editor => { 
        console.log( editor );
		myEditor = editor;
    } ) 
    .catch( err => { 
        console.error( err.stack ); 
    } );
 
