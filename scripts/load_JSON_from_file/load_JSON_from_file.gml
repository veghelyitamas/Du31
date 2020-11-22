function load_JSON_from_file(filename){
	var buffer	= buffer_load(filename);
	var str		= buffer_read(buffer,buffer_string);
	buffer_delete(buffer);
	
	var json = json_decode(str);
	return json;
}