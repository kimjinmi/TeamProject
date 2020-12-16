var myEditor;

ClassicEditor 
    .create( document.querySelector('#bcontent'), {
		ckfinder: {
	        uploadUrl: "/teamproject/blog/upload"
	    }

	}) 
    .then( editor => { 
        console.log( editor );
		myEditor = editor;
    } ) 
    .catch( err => { 
        console.error( err.stack ); 
    } );
