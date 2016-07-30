/// GrabFrame()

// copy application_layer into the buffer...
if( AVI==1 )
{
    if( fast_mode ){
        AVI_AddWindow( window_handle() );
    }else{
        buffer_get_surface(image_buffer, application_surface, 0, 0, 0 );
        var b = buffer_get_address(image_buffer);
        AVI_AddFrame(b);
    }    
}
