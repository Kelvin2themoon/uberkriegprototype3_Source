/// EndRecording()
if( AVI==1 )
{
    AVI_Close();
    buffer_delete( image_buffer );
    AVI = 0;
}