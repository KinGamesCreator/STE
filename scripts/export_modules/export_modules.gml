// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function load_modules(){
	
	return([{
		name : "General Rhythm System",
		func : export_GRS
	},{
		name : "Furry Night Funkin",
		func : export_FurryNightFunkin
	},{
		name : "Friday Night Maker 1",
		func : export_FNM1
	},{
		name : "OSU!mania",
		func : export_osumania
	},{
		name : "Arduino",
		func : export_arduino
	}
	]);
	
}

function export_GRS(){
	var file_export = get_save_filename("json|*.json","data.json");
	if file_export != ""{
		var temp_save = [[]];
		var temp_save_time = [[]];
		for (var i = 0; i < array_length(global.notes);i++) {
			var aux_count = 0;
			for (var k = 0; k < array_length(global.notes[i]);k++) {
				if (global.notes[i][k] > 0) {
					temp_save[i][aux_count] = k * (60 / (global.data.bpm / 60)) / 4;
					temp_save_time[i][aux_count] = (global.notes[i][k] - 1) * (60 / (global.data.bpm / 60)) / 4;
					aux_count ++;
				}
			}
		}
				
		var temp_export = {
			pistas : temp_save,
			pistas_time : temp_save_time,
			version : global.editor_version
		}
		var temp_file_save = file_text_open_write(file_export);
		file_text_write_string(temp_file_save,json_stringify(temp_export));
		file_text_close(temp_file_save);
	}
}

function export_FurryNightFunkin(){
	var file_export = get_save_filename("csv|*.csv","data.csv");
	if file_export != ""{
		var temp_file_save = file_text_open_write(file_export);
		
		//inicio
		file_text_write_string(temp_file_save,global.name + "," + string(global.data.duration*1000) + "," + string(global.data.bpm) + ",Dad,3");
		
		//transformar notas
		var temp_help_furry = ["A","S","W","D","A","S","W","D"];
		
		for (var k = 0; k < array_length(global.notes[0]);k++) {
			for (var i = 0; i < 8;i++) {
				if (global.notes[i][k] > 0) {
					var temp_save = "";
					file_text_writeln(temp_file_save);
					var temp_save = temp_help_furry[i] + ","; //tipo de nota
					
					temp_save += string(k * (1000 / (global.data.bpm / 60)) / 4) + ",";
					temp_save += string((k+global.notes[i][k]-1) * (1000/(global.data.bpm / 60)) / 4) + ",";
					
					if (i > 3) {
						temp_save += "1";
					} else {
						temp_save += "0";
					}
					
					file_text_write_string(temp_file_save,temp_save);
					
				}
			}
		}
		
		file_text_close(temp_file_save);
	}
}

function export_FNM1(){
	
	var file_export = get_open_filename("lvl file|*.lvl","data.lvl");
	
	if file_export != ""{
		
		#region read
			
			var temp_file_read = file_text_open_read(file_export);
			var temp_saves = [];
			
			for (var i = 0; i < 10; i++) {
				file_text_readln(temp_file_read);
				temp_saves[i] = file_text_read_string(temp_file_read);
			}
			
			file_text_close(temp_file_read);
			
		#endregion
		
		var temp_file_save = file_text_open_write(file_export); //archivo de guardado
		
		#region notas
		var temp_help_fnm1 = ["180","360","540","720","1200","1380","1560","1740"];
		
		//transformar notas
		var temp_save = "";
		for (var k = 0; k < array_length(global.notes[0]);k++) {
			for (var i = 0; i < 8;i++) {
				if (global.notes[i][k] > 0) {
					
					temp_save += string(k * (60 / (global.data.bpm / 60)) / 4 + 180 / real(temp_saves[0])) + ";";
					temp_save += temp_help_fnm1[i] + ";";
					temp_save += string((global.notes[i][k]-1) * (60/(global.data.bpm / 60)) / 4) + ";";
				
					if (i > 3) {
						temp_save += string(i-4) + ";";
					} else {
						temp_save += string(i) + ";";
					}
					
				}
			}
		}
		
		#endregion
		
		#region camaras
		
		temp_saves[8] = "";
		for (var k = 0; k < array_length(global.notes[0]);k++) {
			for (var i = 8; i < 11;i++) {
				if global.notes[i][k] {
					temp_saves[8]+=string(k * (60 / (global.data.bpm / 60)) / 4 + 180 / real(temp_saves[0])) + ";";
					temp_saves[8]+=string(i-8) + ";";
				}
			}
		}
		
		#endregion
		
		file_text_write_string(temp_file_save,temp_save); //Escribir notas
		
		for (var i = 0; i < 10; i++) { //rellenar otros datos.
			file_text_writeln(temp_file_save);
			file_text_write_string(temp_file_save,temp_saves[i]);
		}
		
		file_text_close(temp_file_save);
		
	}
}

function export_osumania(){
	
	#region file OSU defect
	
	var osu_data = [
		"osu file format v14",
		"",
		"[General]",
		"AudioFilename: music.ogg",
		"AudioLeadIn: 0",
		"PreviewTime: -1",
		"Countdown: 1",
		"SampleSet: Normal",
		"StackLeniency: 0.7",
		"Mode: 3",
		"LetterboxInBreaks: 1",
		"",
		"[Metadata]",
		"Title://NAME++", //13
		"Artist://ARTIST", //14
		"Creator://CREATOR", //15
		"Version://DIFFICULT", //16
		"Source:",
		"Tags:",
		"",
		"[Difficulty]",
		"HPDrainRate:5",
		"CircleSize:4", //22
		"OverallDifficulty:5",
		"SliderMultiplier:1",
		"SliderTickRate:1",
		"",
		"[Events]",
		"//Background and Video events",
		"//Break Periods",
		"//Storyboard Layer 0 (Background)",
		"//Storyboard Layer 1 (Failing)",
		"//Storyboard Layer 2 (Passing)",
		"//Storyboard Layer 3 (Foreground)",
		"//Storyboard Sound Samples",
		"//Background Colour Transformations",
		"",
		"[TimingPoints]",
		"10000,//FPS?++,32,4,0,0,100,1,0", //38
		"",
		"[HitObjects]"
	]
	
	#endregion
	
	var osu_name = global.name;
	var osu_artist = get_string("Artist name:","");
	var osu_creator = get_string("Your username:","");
	var osu_difficult = get_string("Level difficult name:","");
	var osu_k = round(get_integer("nK:\n4K, 5K, 6K, 7K... etc",4));
	var osu_dest = get_save_filename("OSU! level|*.osz",global.name + ".osz");
	
	if (osu_k > 0) and (osu_k < 10) and (osu_dest!="") and (osu_name!="") and (osu_artist!="") and (osu_creator!="") and (osu_difficult!="") {
		
		#region cambiar datos basicos
			osu_data[13] = "Title:" + osu_name;
			osu_data[14] = "Artist:" + osu_artist;
			osu_data[15] = "Creator:" + osu_creator;
			osu_data[16] = "Version:" + osu_difficult;
			osu_data[22] = "CircleSize:" + string(osu_k);
			
			osu_data[38] = "10000," + string_format(1/(global.data.bpm/60/1000),3,2) + ",32,4,0,0,100,1,0"
		#endregion
		
		#region cargar notas
		var osu_priority = array_create(osu_k,0);
		var osu_export_data = [];
		for (var i = 0; i < array_length(global.notes[0]);i++) {
			for (var k = 0; k < 8; k++) {
				if global.notes[k][i] {
					
					var k_intencion = k;
					
					while(k_intencion > (osu_k-1)) {
						k_intencion -= osu_k;
					}
					if osu_priority[k_intencion] = 0 {
						osu_priority[k_intencion] = global.notes[k][i];
						var osu_x, osu_y = 192; // position; y is always 192
				        var osu_time; // in ms
				        var osu_type; // 1: hit note, 128: hold note
				        var osu_hitsound = 0; // hitsound; always 1 for now
				        var osu_sliderEnd; // if note is a hold note; in ms
						
						osu_x = (512 / osu_k/2) + (512 / osu_k) * k_intencion;
						osu_time = round(i * (1000 / (global.data.bpm / 60)) / 4);
						if global.notes[k][i] > 1 {osu_type=128} else {osu_type=1}//TYPE
						osu_sliderEnd = round((i+global.notes[k][i]-1) * (1000/(global.data.bpm / 60)) / 4);
						
						if (osu_type = 1) {
							osu_export_data[array_length(osu_export_data)] = string(osu_x) + "," + string(osu_y) + "," + string(osu_time) + "," + string(osu_type) + "," + string(osu_hitsound) + ",0:0:0:0";
				            //console.log(`${x},${y},${time},${type},${hitsound},0:0:0:0`);
				        } else {
							osu_export_data[array_length(osu_export_data)] = string(osu_x) + "," + string(osu_y) + "," + string(osu_time) + "," + string(osu_type) + "," + string(osu_hitsound) + "," + string(osu_sliderEnd) +",0:0:0:0";
				            //console.log(`${x},${y},${time},${type},${hitsound},${sliderEnd}:0:0:0:0`);
				        }
					}
				}
			}
			for (var k = 0; k < osu_k;k++) {
				if (osu_priority[k] > 0) {
					osu_priority[k]--;
				}
			}
		}
		#endregion
		
		var osu_temp_save = file_text_open_write(global.name+".osu");
		
		for (var i = 0; i < array_length(osu_data); i++) {
			file_text_write_string(osu_temp_save,osu_data[i]);
			file_text_writeln(osu_temp_save);
		}
		
		for (var i = 0; i < array_length(osu_export_data); i++) {
			file_text_write_string(osu_temp_save,osu_export_data[i]);
			file_text_writeln(osu_temp_save);
		}
		
		file_text_close(osu_temp_save);
		
		var temp_zip = zip_create();
		
		zip_add_file(temp_zip,"music.ogg","proyects/" + global.name + "/music.ogg");
		zip_add_file(temp_zip,global.name+".osu",global.name+".osu");
		zip_save(temp_zip,osu_dest);
		zip_destroy(temp_zip);
		file_delete(global.name+".osu");
		
	} else {
		show_message("ERROR: no data.")
	}
	
}

function export_arduino(){
	var temp_export_ard = [ //inicio
		"int pins[] = {",
		"int notes[] = {",
		"int step = 0;",
		"void setup(){",
	];
	
	var help_arduino = [];
	
	help_arduino[array_length(help_arduino)] = get_integer("Ingrese un pin del arduino",13);
	temp_export_ard[0] += string(help_arduino[array_length(help_arduino) - 1]);
	repeat(array_length(global.notes)-1) {
		help_arduino[array_length(help_arduino)] = get_integer("Ingrese un pin del arduino",13);
		temp_export_ard[0] += "," + string(help_arduino[array_length(help_arduino) - 1]);
	} temp_export_ard[0] += "};"
	
	
	for (var k = 0; k < array_length(global.notes[0]);k++) {
		for (var i = 0; i < array_length(global.notes);i++) {
			if (global.notes[i][k] > 0) {
				
				if temp_export_ard[1] != "int notes[] = {" {
					temp_export_ard[1] += ","
				}
				
				temp_export_ard[1] += string(round(k * (1000 / (global.data.bpm / 60)) / 4)) + ",";
				
				temp_export_ard[1] += string(i) + ",";
				
				temp_export_ard[1] += string(round((global.notes[i][k]-1) * (1000/(global.data.bpm / 60)) / 4));
				
			}
		}
	}
	
	for (var i = 0; i < array_length(global.notes);i++) {
		temp_export_ard[array_length(temp_export_ard)] = "pinMode(pins[" + string(i) + "],OUTPUT);";
	}
	
	var temp_rapido = get_save_filename("archivo txt|*.txt","arduino.txt");
	
	for (var i = 0; i < array_length(temp_export_ard); i++) {
		file_text_write_string(temp_rapido,temp_export_ard);
		file_text_writeln(temp_rapido);
	}
	
	file_text_close(temp_rapido);
	
}