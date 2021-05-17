socket = argument0;
b_buffer = buffer_load("outgoing.snd");
network_send_packet(socket,b_buffer,buffer_get_size(b_buffer));
buffer_delete(b_buffer);
