/// StartRecording()

// We can't start recording in fullscreen mode as it needs to open a dialog
// for you to pick the CODEC. Once it's created, you COULD swap to fullscreen mode
if( !window_get_fullscreen() )
{
    if( AVI==0 )
    {
        AVI = 1;
        
        var ww = surface_get_width(application_surface);
        var hh = surface_get_height(application_surface);
        
        // Start recording
        //AVI_Create("grab.avi",ww,hh,30);
        AVI_Create ("F: ubergrab.avi", 768, 432, 60);
        image_buffer = buffer_create( ww*hh*4, buffer_fixed,1);
    }   
}
