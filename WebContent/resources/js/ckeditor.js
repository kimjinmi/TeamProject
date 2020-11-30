var myEditor;

ClassicEditor 
    .create( document.querySelector('#bcontent'), {
	ckfinder: {
        uploadUrl: '/blog/fileupload' 
		// '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json'
    }
}) 
    .then( editor => { 
        console.log( editor );
		myEditor = editor;
    } ) 
    .catch( err => { 
        console.error( err.stack ); 
    } );