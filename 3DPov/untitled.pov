//POVRay-File created by 3d41.ulp v20110101
///home/sefa/Dropbox/Projeler/Eagle Cizimleri/MSP430F5xExpBoard_sade/untitled.brd
//4/23/12 8:49 PM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 215;
#local cam_z = -114;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 19;
#local lgt1_pos_y = 28;
#local lgt1_pos_z = 26;
#local lgt1_intense = 0.735714;
#local lgt2_pos_x = -19;
#local lgt2_pos_y = 28;
#local lgt2_pos_z = 26;
#local lgt2_intense = 0.735714;
#local lgt3_pos_x = 19;
#local lgt3_pos_y = 28;
#local lgt3_pos_z = -18;
#local lgt3_intense = 0.735714;
#local lgt4_pos_x = -19;
#local lgt4_pos_y = 28;
#local lgt4_pos_z = -18;
#local lgt4_intense = 0.735714;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 50.000000;
#declare pcb_y_size = 50.000000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(535);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-25.000000,0,-25.000000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro UNTITLED(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><50.000000,0.000000>
<50.000000,0.000000><50.000000,50.000000>
<50.000000,50.000000><0.000000,50.000000>
<0.000000,50.000000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
cylinder{<2.250000,0.095000,2.250000><2.250000,-1.595000,2.250000>1.270000 texture{col_hls}}
cylinder{<2.250000,0.095000,47.750000><2.250000,-1.595000,47.750000>1.270000 texture{col_hls}}
cylinder{<47.750000,0.095000,2.250000><47.750000,-1.595000,2.250000>1.270000 texture{col_hls}}
cylinder{<47.750000,0.095000,47.750000><47.750000,-1.595000,47.750000>1.270000 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
//Parts without Macro (e.g. SMD Solderjumper)				Test point ACLK TPB1,27
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<42.445000,0.000000,43.425000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C1 2.2nF 0805
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<23.000000,-1.500000,27.000000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C2 0.1uF 0805
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<21.500000,-1.500000,27.000000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C3 10uF 0805
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<22.250000,-1.500000,19.000000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C4 0.1uF 0805
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<20.750000,-1.500000,19.000000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C5 10uF 0805
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<20.500000,-1.500000,23.000000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C6 4.7uF 0805
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<20.500000,-1.500000,24.500000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C7 0.1uF 0805
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<6.500000,0.000000,22.500000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C8 -- 0805
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<6.500000,0.000000,24.750000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C9 -- 0805
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<29.500000,-1.500000,27.000000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C10 4.7uF 0805
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<26.500000,-1.500000,27.000000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C11 220nF 0805
#ifndef(pack_C12) #declare global_pack_C12=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<28.000000,-1.500000,27.000000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C12 220nF 0805
#ifndef(pack_C13) #declare global_pack_C13=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<9.000000,0.000000,27.250000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C13 -- 0805
#ifndef(pack_C14) #declare global_pack_C14=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<27.000000,-1.500000,23.250000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C14 0.1uF 0805
#ifndef(pack_C15) #declare global_pack_C15=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<23.750000,-1.500000,34.000000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C15 -- 0805
#ifndef(pack_C16) #declare global_pack_C16=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<26.500000,-1.500000,34.000000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C16 -- 0805
#ifndef(pack_C17) #declare global_pack_C17=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<24.500000,-1.500000,27.000000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C17 4.7nF 0805
#ifndef(pack_C18) #declare global_pack_C18=yes; object {CAP_SMD_CHIP_0805()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<7.000000,0.000000,27.250000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C18 -- 0805
#ifndef(pack_C19) #declare global_pack_C19=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<23.750000,-1.500000,19.000000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C19 470nF 0805
#ifndef(pack_C24) #declare global_pack_C24=yes; object {CAP_SMD_CHIP_0805()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<27.000000,-1.500000,21.750000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C24 10uF 0805
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_2X1J(2,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-135.000000,0> rotate<0,0,0> translate<41.425000,0.000000,38.030000>}#end		//Jumper 2,54mm Grid 2Pin 1Row (jumper.lib) JP1  JP1
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_1X8()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<2.250000,0.000000,26.250000>}#end		//Header 2,54mm Grid 8Pin 1Row (jumper.lib) JP2 GPIO 1X08
#ifndef(pack_JP3) #declare global_pack_JP3=yes; object {CON_PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<16.625000,0.000000,42.750000>}#end		//Header 2,54mm Grid 3Pin 1Row (jumper.lib) JP3  1X03
#ifndef(pack_JP4) #declare global_pack_JP4=yes; object {CON_PH_1X6()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<31.500000,0.000000,47.750000>}#end		//Header 2,54mm Grid 6Pin 1Row (jumper.lib) JP4  1X06
#ifndef(pack_JP5) #declare global_pack_JP5=yes; object {CON_PH_1X8()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<23.750000,0.000000,2.250000>}#end		//Header 2,54mm Grid 8Pin 1Row (jumper.lib) JP5 GPIO 1X08
#ifndef(pack_JP6) #declare global_pack_JP6=yes; object {CON_PH_1X8()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<44.000000,0.000000,2.250000>}#end		//Header 2,54mm Grid 8Pin 1Row (jumper.lib) JP6 GPIO 1X08
#ifndef(pack_JP7) #declare global_pack_JP7=yes; object {CON_PH_1X8()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<47.750000,0.000000,23.750000>}#end		//Header 2,54mm Grid 8Pin 1Row (jumper.lib) JP7 GPIO 1X08
#ifndef(pack_JP8) #declare global_pack_JP8=yes; object {CON_PH_1X8()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<47.750000,0.000000,44.000000>}#end		//Header 2,54mm Grid 8Pin 1Row (jumper.lib) JP8 GPIO 1X08
#ifndef(pack_JP9) #declare global_pack_JP9=yes; object {CON_PH_1X4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<6.000000,0.000000,47.750000>}#end		//Header 2,54mm Grid 4Pin 1Row (jumper.lib) JP9  1X04
#ifndef(pack_JP10) #declare global_pack_JP10=yes; object {CON_PH_1X8()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<2.250000,0.000000,6.000000>}#end		//Header 2,54mm Grid 8Pin 1Row (jumper.lib) JP10 GPIO 1X08
#ifndef(pack_LED1) #declare global_pack_LED1=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<18.000000,0.000000,5.500000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 LED1  CHIPLED_0805
#ifndef(pack_LED2) #declare global_pack_LED2=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<20.000000,0.000000,5.500000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 LED2  CHIPLED_0805
#ifndef(pack_LED3) #declare global_pack_LED3=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<22.000000,0.000000,5.500000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 LED3  CHIPLED_0805
#ifndef(pack_LED4) #declare global_pack_LED4=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<28.000000,0.000000,5.500000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 LED4  CHIPLED_0805
#ifndef(pack_LED5) #declare global_pack_LED5=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<24.000000,0.000000,5.500000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 LED5  CHIPLED_0805
#ifndef(pack_LED6) #declare global_pack_LED6=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<26.000000,0.000000,5.500000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 LED6  CHIPLED_0805
#ifndef(pack_LED7) #declare global_pack_LED7=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<32.250000,0.000000,40.855000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 LED7  CHIPLED_0805
#ifndef(pack_LED8) #declare global_pack_LED8=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<30.000000,0.000000,5.500000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 LED8  CHIPLED_0805
#ifndef(pack_LED9) #declare global_pack_LED9=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<32.000000,0.000000,5.500000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 LED9  CHIPLED_0805
#ifndef(pack_LED10) #declare global_pack_LED10=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<16.280000,0.000000,40.700000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 LED10  CHIPLED_0805
#ifndef(pack_Q2) #declare global_pack_Q2=yes; object {SPC_XTAL_5MM("8MHz",3,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<25.250000,0.000000,35.500000>}#end		//Quarz 4,9MM Q2 8MHz HC49U-V
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0805("300",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<25.500000,-1.500000,44.500000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R1 30R M0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0805("473",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<38.065000,0.000000,45.150000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R2 47K M0805
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0805("300",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<23.500000,-1.500000,44.500000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R3 30R M0805
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("105",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-225.000000,0> rotate<0,0,0> translate<34.250000,0.000000,36.000000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R4 1M M0805
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("142",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-225.000000,0> rotate<0,0,0> translate<32.750000,0.000000,37.500000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R5 1.4K M0805
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<28.000000,0.000000,8.750000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R6 470R R0603
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<24.000000,0.000000,8.750000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R7 470R R0603
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<26.000000,0.000000,8.750000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R8 470R R0603
#ifndef(pack_R10) #declare global_pack_R10=yes; object {RES_SMD_CHIP_0603("101",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-135.000000,0> rotate<0,0,0> translate<32.350000,0.000000,30.740000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R10 100R R0603
#ifndef(pack_R11) #declare global_pack_R11=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<30.000000,0.000000,8.750000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R11 470R R0603
#ifndef(pack_R12) #declare global_pack_R12=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<32.000000,0.000000,8.750000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R12 470R R0603
#ifndef(pack_R13) #declare global_pack_R13=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<22.000000,0.000000,8.750000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R13 470R R0603
#ifndef(pack_R15) #declare global_pack_R15=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<18.000000,0.000000,8.750000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R15 470R R0603
#ifndef(pack_R16) #declare global_pack_R16=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<20.000000,0.000000,8.750000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R16 470R R0603
#ifndef(pack_R19) #declare global_pack_R19=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<10.500000,-1.500000,10.250000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R19 10K M0805
#ifndef(pack_R20) #declare global_pack_R20=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<10.500000,-1.500000,14.000000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R20 10K M0805
#ifndef(pack_R21) #declare global_pack_R21=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-45.000000,0> rotate<0,0,0> translate<31.350000,0.000000,38.655000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R21 470R R0603
#ifndef(pack_R22) #declare global_pack_R22=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<16.380000,0.000000,39.170000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R22 470R R0603
#ifndef(pack_R23) #declare global_pack_R23=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<43.250000,0.000000,20.000000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R23 10K M0805
#ifndef(pack_R24) #declare global_pack_R24=yes; object {RES_SMD_CHIP_0805("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<43.250000,0.000000,17.500000>translate<0,0.035000,0> }#end		//SMD Resistor 0805 R24 10K M0805
//Parts without Macro (e.g. SMD Solderjumper)				Test point SMCLK TPB1,27
#ifndef(pack_U_1) #declare global_pack_U_1=yes; object {QFP_TQFP_100_050MM("F66XX---PZ100","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<23.750000,0.000000,22.750000>translate<0,0.035000,0> }#end		//TQFP-100 U$1 F66XX---PZ100 PZ100
//Parts without Macro (e.g. SMD Solderjumper)				Test point VREF+ TPB1,27
//Parts without Macro (e.g. SMD Solderjumper)				Test point VREF- TPB1,27
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<18.350000,0.000000,12.055000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.445000,0.000000,42.525000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<42.445000,0.000000,44.325000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<23.000000,-1.537000,26.100000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<23.000000,-1.537000,27.900000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.500000,-1.537000,27.900000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.500000,-1.537000,26.100000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.250000,-1.537000,19.900000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.250000,-1.537000,18.100000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.750000,-1.537000,18.100000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<20.750000,-1.537000,19.900000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.600000,-1.537000,23.000000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.400000,-1.537000,23.000000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<19.600000,-1.537000,24.500000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<21.400000,-1.537000,24.500000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.400000,0.000000,22.500000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.600000,0.000000,22.500000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<7.400000,0.000000,24.750000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<5.600000,0.000000,24.750000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<29.500000,-1.537000,27.900000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<29.500000,-1.537000,26.100000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.500000,-1.537000,27.900000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.500000,-1.537000,26.100000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.000000,-1.537000,27.900000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.000000,-1.537000,26.100000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<9.000000,0.000000,28.150000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<9.000000,0.000000,26.350000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.900000,-1.537000,23.250000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<26.100000,-1.537000,23.250000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.650000,-1.537000,34.000000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.850000,-1.537000,34.000000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.600000,-1.537000,34.000000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.400000,-1.537000,34.000000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<24.500000,-1.537000,27.900000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<24.500000,-1.537000,26.100000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<7.000000,0.000000,28.150000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<7.000000,0.000000,26.350000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.750000,-1.537000,19.900000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.750000,-1.537000,18.100000>}
object{TOOLS_PCB_SMD(1.397000,2.590800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<18.250200,0.000000,37.020000>}
object{TOOLS_PCB_SMD(1.397000,2.590800,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.049800,0.000000,37.020000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.100000,-1.537000,21.750000>}
object{TOOLS_PCB_SMD(0.800000,1.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.900000,-1.537000,21.750000>}
object{TOOLS_PCB_SMD(1.397000,1.701800,0.037000,0) rotate<0,-225.000000,0> texture{col_pds} translate<33.994209,0.000000,32.780131>}
object{TOOLS_PCB_SMD(1.397000,1.701800,0.037000,0) rotate<0,-225.000000,0> texture{col_pds} translate<36.329075,0.000000,35.079075>}
#ifndef(global_pack_H1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.556000,2.540000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<2.250000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_H2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.556000,2.540000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_H3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.556000,2.540000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,47.750000> texture{col_thl}}
#ifndef(global_pack_H4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.556000,2.540000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<2.250000,0,47.750000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,3+global_tmp,100) rotate<0,-135.000000,0>translate<42.323025,0,38.928025> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,3+global_tmp,100) rotate<0,-135.000000,0>translate<40.526972,0,37.131972> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,26.250000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,28.790000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,31.330000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,33.870000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,36.410000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,38.950000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,41.490000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,44.030000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<16.625000,0,42.750000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<16.625000,0,45.290000> texture{col_thl}}
#ifndef(global_pack_JP3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<16.625000,0,47.830000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<31.500000,0,47.750000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<34.040000,0,47.750000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<36.580000,0,47.750000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<39.120000,0,47.750000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<41.660000,0,47.750000> texture{col_thl}}
#ifndef(global_pack_JP4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.200000,0,47.750000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<23.750000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<21.210000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<18.670000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.130000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<13.590000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<11.050000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<8.510000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<5.970000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<44.000000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<41.460000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<38.920000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<36.380000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<33.840000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<31.300000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<28.760000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<26.220000,0,2.250000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,23.750000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,21.210000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,18.670000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,16.130000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,13.590000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,11.050000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,8.510000> texture{col_thl}}
#ifndef(global_pack_JP7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,5.970000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,44.000000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,41.460000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,38.920000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,36.380000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,33.840000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,31.300000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,28.760000> texture{col_thl}}
#ifndef(global_pack_JP8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<47.750000,0,26.220000> texture{col_thl}}
#ifndef(global_pack_JP9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<6.000000,0,47.750000> texture{col_thl}}
#ifndef(global_pack_JP9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<8.540000,0,47.750000> texture{col_thl}}
#ifndef(global_pack_JP9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<11.080000,0,47.750000> texture{col_thl}}
#ifndef(global_pack_JP9) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<13.620000,0,47.750000> texture{col_thl}}
#ifndef(global_pack_JP10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,0+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,6.000000> texture{col_thl}}
#ifndef(global_pack_JP10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,8.540000> texture{col_thl}}
#ifndef(global_pack_JP10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,11.080000> texture{col_thl}}
#ifndef(global_pack_JP10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,13.620000> texture{col_thl}}
#ifndef(global_pack_JP10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,16.160000> texture{col_thl}}
#ifndef(global_pack_JP10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,18.700000> texture{col_thl}}
#ifndef(global_pack_JP10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,21.240000> texture{col_thl}}
#ifndef(global_pack_JP10) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.879600,1.016000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<2.250000,0,23.780000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.750000,-1.537000,26.250000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.750000,-1.537000,28.250000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.000000,0.000000,6.550000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.000000,0.000000,4.450000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.000000,0.000000,6.550000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.000000,0.000000,4.450000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.000000,0.000000,6.550000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.000000,0.000000,4.450000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.000000,0.000000,6.550000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.000000,0.000000,4.450000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.000000,0.000000,6.550000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.000000,0.000000,4.450000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<26.000000,0.000000,6.550000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<26.000000,0.000000,4.450000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<33.300000,0.000000,40.855000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.200000,0.000000,40.855000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.000000,0.000000,6.550000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<30.000000,0.000000,4.450000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.000000,0.000000,6.550000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<32.000000,0.000000,4.450000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.230000,0.000000,40.700000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<17.330000,0.000000,40.700000>}
object{TOOLS_PCB_SMD(2.000000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<35.190000,0.000000,42.290000>}
object{TOOLS_PCB_SMD(2.000000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<40.590000,0.000000,42.290000>}
object{TOOLS_PCB_SMD(2.000000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.200000,0.000000,10.250000>}
object{TOOLS_PCB_SMD(2.000000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<9.800000,0.000000,10.250000>}
object{TOOLS_PCB_SMD(2.000000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.200000,0.000000,14.000000>}
object{TOOLS_PCB_SMD(2.000000,1.600000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<9.800000,0.000000,14.000000>}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<8.550000,0,22.290000> texture{col_thl}}
#ifndef(global_pack_Q1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<8.550000,0,24.830000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<27.663000,0,35.500000> texture{col_thl}}
#ifndef(global_pack_Q2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<22.837000,0,35.500000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.500000,-1.537000,43.550000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.500000,-1.537000,45.450000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<37.115000,0.000000,45.150000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<39.015000,0.000000,45.150000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<23.500000,-1.537000,43.550000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<23.500000,-1.537000,45.450000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-225.000000,0> texture{col_pds} translate<34.921750,0.000000,36.671750>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-225.000000,0> texture{col_pds} translate<33.578247,0.000000,35.328247>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-225.000000,0> texture{col_pds} translate<33.421750,0.000000,38.171750>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-225.000000,0> texture{col_pds} translate<32.078247,0.000000,36.828247>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.000000,0.000000,9.600000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<28.000000,0.000000,7.900000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<24.000000,0.000000,9.600000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<24.000000,0.000000,7.900000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.000000,0.000000,9.600000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.000000,0.000000,7.900000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-135.000000,0> texture{col_pds} translate<32.951041,0.000000,30.138956>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-135.000000,0> texture{col_pds} translate<31.748956,0.000000,31.341041>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<30.000000,0.000000,9.600000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<30.000000,0.000000,7.900000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<32.000000,0.000000,9.600000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<32.000000,0.000000,7.900000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.000000,0.000000,9.600000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.000000,0.000000,7.900000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.000000,0.000000,9.600000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<18.000000,0.000000,7.900000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.000000,0.000000,9.600000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.000000,0.000000,7.900000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<9.550000,-1.537000,10.250000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.450000,-1.537000,10.250000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<9.550000,-1.537000,14.000000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<11.450000,-1.537000,14.000000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-45.000000,0> texture{col_pds} translate<30.748956,0.000000,38.053956>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-45.000000,0> texture{col_pds} translate<31.951041,0.000000,39.256041>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.230000,0.000000,39.170000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.530000,0.000000,39.170000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<42.300000,0.000000,20.000000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<44.200000,0.000000,20.000000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<42.300000,0.000000,17.500000>}
object{TOOLS_PCB_SMD(1.300000,1.600000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<44.200000,0.000000,17.500000>}
object{TOOLS_PCB_SMD(0.635000,1.270000,0.037000,0) rotate<0,-45.000000,0> texture{col_pds} translate<34.431800,0.000000,30.681800>}
object{TOOLS_PCB_SMD(0.635000,1.270000,0.037000,0) rotate<0,-45.000000,0> texture{col_pds} translate<35.068197,0.000000,31.318197>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<27.750000,0.000000,12.625000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,28.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,28.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,27.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,27.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,26.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,26.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,25.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,25.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,24.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,24.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,23.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,23.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,22.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,22.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,21.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,21.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,20.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,20.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,19.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,19.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,18.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,18.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,17.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,17.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<15.950000,0.000000,16.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.250000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.250000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.250000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.250000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.250000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.250000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.250000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.250000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<26.250000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<26.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.250000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.250000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.250000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.750000,0.000000,14.950000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,16.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,17.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,17.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,18.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,18.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,19.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,19.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,20.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,20.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,21.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,21.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,22.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,22.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,23.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,23.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,24.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,24.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,25.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,25.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,26.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,26.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,27.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,27.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,28.250000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.550000,0.000000,28.750000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<29.250000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<28.250000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<27.250000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<26.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<26.250000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<25.250000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<24.250000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.250000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.250000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.250000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<20.250000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<19.250000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<18.250000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(0.300000,1.400000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.750000,0.000000,30.550000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<11.500000,0.000000,26.000000>}
object{TOOLS_PCB_SMD(1.270000,1.270000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<11.500000,0.000000,24.000000>}
object{TOOLS_PCB_SMD(2.500000,0.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<24.500000,0.000000,41.500000>}
object{TOOLS_PCB_SMD(2.500000,0.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<25.300000,0.000000,41.500000>}
object{TOOLS_PCB_SMD(2.500000,0.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<22.900000,0.000000,41.500000>}
object{TOOLS_PCB_SMD(2.500000,0.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<23.700000,0.000000,41.500000>}
object{TOOLS_PCB_SMD(2.500000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<29.000000,0.000000,47.000000>}
object{TOOLS_PCB_SMD(2.500000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<29.000000,0.000000,41.500000>}
object{TOOLS_PCB_SMD(2.500000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.000000,0.000000,47.000000>}
object{TOOLS_PCB_SMD(2.500000,2.000000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.000000,0.000000,41.500000>}
object{TOOLS_PCB_SMD(2.500000,0.500000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.100000,0.000000,41.500000>}
//Pads/Vias
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<18.000000,0,23.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<25.000000,0,39.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<23.750000,0,39.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<25.500000,0,28.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<19.500000,0,20.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<28.500000,0,24.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<22.500000,0,25.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<32.250000,0,32.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<30.500000,0,30.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<36.625000,0,36.875000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<13.000000,0,7.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<33.750000,0,15.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<15.750000,0,30.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<22.250000,0,38.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<39.750000,0,34.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<44.000000,0,42.625000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<39.000000,0,38.875000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<4.375000,0,45.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<28.500000,0,33.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<30.250000,0,33.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<34.625000,0,38.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<21.750000,0,16.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<17.500000,0,28.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<18.250000,0,27.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<18.000000,0,26.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<17.750000,0,25.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<24.000000,0,16.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<25.000000,0,17.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<26.000000,0,17.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<27.000000,0,17.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<28.000000,0,17.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<29.000000,0,16.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<28.750000,0,12.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<29.625000,0,12.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<30.375000,0,11.625000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<30.000000,0,16.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<29.500000,0,17.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<29.750000,0,18.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<24.500000,0,28.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<8.000000,0,10.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<8.000000,0,14.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<19.750000,0,33.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<29.500000,0,21.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<33.500000,0,42.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<32.750000,0,44.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<20.750000,0,33.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<29.500000,0,20.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<32.375000,0,42.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<30.875000,0,45.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<26.750000,0,28.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<40.750000,0,20.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<41.250000,0,17.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<23.250000,0,28.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<18.250000,0,18.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<29.750000,0,23.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<20.250000,0,17.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<28.000000,0,20.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<18.750000,0,35.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<27.750000,0,28.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<27.000000,0,32.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<36.750000,0,31.250000> texture{col_thl}}
object{TOOLS_PCB_VIA(0.704800,0.400000,1,16,1,0) translate<29.250000,0,28.750000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,31.330000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.080000,0.000000,30.500000>}
box{<0,0,-0.127000><1.173797,0.035000,0.127000> rotate<0,44.997030,0> translate<2.250000,0.000000,31.330000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,21.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.240000,0.000000,20.250000>}
box{<0,0,-0.127000><1.400071,0.035000,0.127000> rotate<0,44.997030,0> translate<2.250000,0.000000,21.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,18.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.300000,0.000000,19.750000>}
box{<0,0,-0.127000><1.484924,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.250000,0.000000,18.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,28.790000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.460000,0.000000,30.000000>}
box{<0,0,-0.127000><1.711198,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.250000,0.000000,28.790000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,-1.535000,8.540000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.960000,-1.535000,10.250000>}
box{<0,0,-0.127000><2.418305,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.250000,-1.535000,8.540000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,11.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.250000,0.000000,13.080000>}
box{<0,0,-0.127000><2.828427,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.250000,0.000000,11.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.250000,0.000000,14.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.250000,0.000000,13.080000>}
box{<0,0,-0.127000><1.170000,0.035000,0.127000> rotate<0,-90.000000,0> translate<4.250000,0.000000,13.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,33.870000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.120000,0.000000,31.000000>}
box{<0,0,-0.127000><4.058793,0.035000,0.127000> rotate<0,44.997030,0> translate<2.250000,0.000000,33.870000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,8.540000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.250000,0.000000,11.540000>}
box{<0,0,-0.127000><4.242641,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.250000,0.000000,8.540000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.250000,0.000000,13.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.250000,0.000000,11.540000>}
box{<0,0,-0.127000><2.210000,0.035000,0.127000> rotate<0,-90.000000,0> translate<5.250000,0.000000,11.540000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,23.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.280000,0.000000,20.750000>}
box{<0,0,-0.127000><4.285067,0.035000,0.127000> rotate<0,44.997030,0> translate<2.250000,0.000000,23.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,16.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.340000,0.000000,19.250000>}
box{<0,0,-0.127000><4.369920,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.250000,0.000000,16.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,26.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.500000,0.000000,29.500000>}
box{<0,0,-0.127000><4.596194,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.250000,0.000000,26.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.600000,0.000000,22.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.600000,0.000000,24.750000>}
box{<0,0,-0.127000><2.250000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.600000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.970000,-1.535000,2.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.970000,-1.535000,2.250000>}
box{<0,0,-0.127000><0.470000,0.035000,0.127000> rotate<0,-90.000000,0> translate<5.970000,-1.535000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.000000,-1.535000,33.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.000000,-1.535000,47.750000>}
box{<0,0,-0.127000><14.000000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.000000,-1.535000,47.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.250000,0.000000,10.000000>}
box{<0,0,-0.127000><5.656854,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.250000,0.000000,6.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.250000,0.000000,13.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.250000,0.000000,10.000000>}
box{<0,0,-0.127000><3.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<6.250000,0.000000,10.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,36.410000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.410000,0.000000,32.250000>}
box{<0,0,-0.127000><5.883128,0.035000,0.127000> rotate<0,44.997030,0> translate<2.250000,0.000000,36.410000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.600000,0.000000,22.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.850000,0.000000,21.250000>}
box{<0,0,-0.127000><1.767767,0.035000,0.127000> rotate<0,44.997030,0> translate<5.600000,0.000000,22.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.250000,0.000000,13.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.000000,0.000000,14.000000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.250000,0.000000,13.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.600000,0.000000,24.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.000000,0.000000,26.150000>}
box{<0,0,-0.127000><1.979899,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.600000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.000000,0.000000,26.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.000000,0.000000,26.350000>}
box{<0,0,-0.127000><0.200000,0.035000,0.127000> rotate<0,90.000000,0> translate<7.000000,0.000000,26.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.970000,-1.535000,2.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.250000,-1.535000,4.000000>}
box{<0,0,-0.127000><1.810193,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.970000,-1.535000,2.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,13.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.380000,0.000000,18.750000>}
box{<0,0,-0.127000><7.254916,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.250000,0.000000,13.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.000000,0.000000,28.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.850000,0.000000,29.000000>}
box{<0,0,-0.127000><1.202082,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.000000,0.000000,28.150000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.960000,-1.535000,10.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.000000,-1.535000,10.250000>}
box{<0,0,-0.127000><4.040000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.960000,-1.535000,10.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.000000,-1.535000,10.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.000000,-1.535000,10.750000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.000000,-1.535000,10.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.000000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.000000,0.000000,14.000000>}
box{<0,0,-0.127000><1.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.000000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.250000,0.000000,14.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.250000,0.000000,18.250000>}
box{<0,0,-0.127000><5.656854,0.035000,0.127000> rotate<0,-44.997030,0> translate<4.250000,0.000000,14.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,38.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.450000,0.000000,32.750000>}
box{<0,0,-0.127000><8.768124,0.035000,0.127000> rotate<0,44.997030,0> translate<2.250000,0.000000,38.950000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.400000,0.000000,22.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.470000,0.000000,22.500000>}
box{<0,0,-0.127000><1.070000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.400000,0.000000,22.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.400000,0.000000,24.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.470000,0.000000,24.750000>}
box{<0,0,-0.127000><1.070000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.400000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.000000,0.000000,10.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.500000,0.000000,10.250000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<8.000000,0.000000,10.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.510000,-1.535000,2.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.510000,-1.535000,2.250000>}
box{<0,0,-0.127000><0.260000,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.510000,-1.535000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.540000,-1.535000,32.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.540000,-1.535000,47.750000>}
box{<0,0,-0.127000><15.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.540000,-1.535000,47.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.470000,0.000000,22.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.550000,0.000000,22.420000>}
box{<0,0,-0.127000><0.113137,0.035000,0.127000> rotate<0,44.997030,0> translate<8.470000,0.000000,22.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.550000,0.000000,22.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.550000,0.000000,22.420000>}
box{<0,0,-0.127000><0.130000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.550000,0.000000,22.420000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.470000,0.000000,24.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.550000,0.000000,24.830000>}
box{<0,0,-0.127000><0.113137,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.470000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.550000,0.000000,22.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.590000,0.000000,22.250000>}
box{<0,0,-0.127000><0.056569,0.035000,0.127000> rotate<0,44.997030,0> translate<8.550000,0.000000,22.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.250000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.000000,-1.535000,4.000000>}
box{<0,0,-0.127000><1.750000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.250000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.000000,0.000000,26.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.000000,0.000000,26.350000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.000000,0.000000,26.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.000000,0.000000,28.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.000000,0.000000,28.250000>}
box{<0,0,-0.127000><0.100000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.000000,0.000000,28.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.250000,0.000000,13.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.250000,0.000000,17.750000>}
box{<0,0,-0.127000><5.656854,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.250000,0.000000,13.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.000000,0.000000,28.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.250000,0.000000,28.250000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.000000,0.000000,28.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.000000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.500000,-1.535000,4.500000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.000000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.000000,-1.535000,10.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.550000,-1.535000,10.250000>}
box{<0,0,-0.127000><1.550000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.000000,-1.535000,10.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.000000,-1.535000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.550000,-1.535000,14.000000>}
box{<0,0,-0.127000><1.550000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.000000,-1.535000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.500000,0.000000,10.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.800000,0.000000,10.250000>}
box{<0,0,-0.127000><1.300000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.500000,0.000000,10.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.000000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.800000,0.000000,14.000000>}
box{<0,0,-0.127000><1.800000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.000000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.550000,0.000000,13.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.800000,0.000000,14.000000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.550000,0.000000,13.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.510000,-1.535000,2.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.000000,-1.535000,4.000000>}
box{<0,0,-0.127000><2.107178,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.510000,-1.535000,2.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.850000,0.000000,21.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.000000,0.000000,21.250000>}
box{<0,0,-0.127000><3.150000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.850000,0.000000,21.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.250000,0.000000,28.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.000000,0.000000,27.500000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<9.250000,0.000000,28.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.000000,0.000000,25.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.000000,0.000000,27.500000>}
box{<0,0,-0.127000><2.250000,0.035000,0.127000> rotate<0,90.000000,0> translate<10.000000,0.000000,27.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.850000,0.000000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.000000,0.000000,29.000000>}
box{<0,0,-0.127000><2.150000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.850000,0.000000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.000000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.250000,0.000000,17.250000>}
box{<0,0,-0.127000><4.596194,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.000000,0.000000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.500000,0.000000,29.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.250000,0.000000,29.500000>}
box{<0,0,-0.127000><4.750000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.500000,0.000000,29.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,41.490000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.490000,0.000000,33.250000>}
box{<0,0,-0.127000><11.653120,0.035000,0.127000> rotate<0,44.997030,0> translate<2.250000,0.000000,41.490000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.000000,0.000000,21.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.500000,0.000000,21.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.000000,0.000000,21.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.460000,0.000000,30.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.500000,0.000000,30.000000>}
box{<0,0,-0.127000><7.040000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.460000,0.000000,30.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.550000,0.000000,24.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.630000,0.000000,22.750000>}
box{<0,0,-0.127000><2.941564,0.035000,0.127000> rotate<0,44.997030,0> translate<8.550000,0.000000,24.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.500000,-1.535000,4.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.750000,-1.535000,4.500000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.500000,-1.535000,4.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.000000,0.000000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.750000,0.000000,28.250000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<10.000000,0.000000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.750000,0.000000,26.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.750000,0.000000,28.250000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,90.000000,0> translate<10.750000,0.000000,28.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.080000,0.000000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.750000,0.000000,30.500000>}
box{<0,0,-0.127000><7.670000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.080000,0.000000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.120000,0.000000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.000000,0.000000,31.000000>}
box{<0,0,-0.127000><5.880000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.120000,0.000000,31.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.050000,-1.535000,2.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.050000,-1.535000,2.250000>}
box{<0,0,-0.127000><0.550000,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.050000,-1.535000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.080000,-1.535000,30.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.080000,-1.535000,47.750000>}
box{<0,0,-0.127000><17.080000,0.035000,0.127000> rotate<0,90.000000,0> translate<11.080000,-1.535000,47.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.000000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.250000,-1.535000,4.000000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.000000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.750000,-1.535000,4.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.250000,-1.535000,5.000000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.750000,-1.535000,4.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.000000,0.000000,25.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.250000,0.000000,24.000000>}
box{<0,0,-0.127000><1.767767,0.035000,0.127000> rotate<0,44.997030,0> translate<10.000000,0.000000,25.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.450000,-1.535000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.450000,-1.535000,10.250000>}
box{<0,0,-0.127000><3.750000,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.450000,-1.535000,10.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.250000,0.000000,24.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.500000,0.000000,24.000000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.250000,0.000000,24.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.750000,0.000000,26.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.500000,0.000000,26.000000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<10.750000,0.000000,26.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.250000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.750000,-1.535000,4.500000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.250000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.050000,-1.535000,2.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.250000,-1.535000,4.000000>}
box{<0,0,-0.127000><1.697056,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.050000,-1.535000,2.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.250000,-1.535000,5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.500000,-1.535000,5.000000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.250000,-1.535000,5.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.250000,0.000000,29.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.500000,0.000000,27.250000>}
box{<0,0,-0.127000><3.181981,0.035000,0.127000> rotate<0,44.997030,0> translate<10.250000,0.000000,29.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.250000,0.000000,44.030000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.530000,0.000000,33.750000>}
box{<0,0,-0.127000><14.538115,0.035000,0.127000> rotate<0,44.997030,0> translate<2.250000,0.000000,44.030000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.500000,0.000000,24.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.650000,0.000000,24.000000>}
box{<0,0,-0.127000><1.150000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.500000,0.000000,24.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.500000,0.000000,26.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.750000,0.000000,24.750000>}
box{<0,0,-0.127000><1.767767,0.035000,0.127000> rotate<0,44.997030,0> translate<11.500000,0.000000,26.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.500000,0.000000,30.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.750000,0.000000,27.750000>}
box{<0,0,-0.127000><3.181981,0.035000,0.127000> rotate<0,44.997030,0> translate<10.500000,0.000000,30.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.650000,0.000000,24.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.900000,0.000000,24.250000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.650000,0.000000,24.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.750000,-1.535000,4.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.000000,-1.535000,4.500000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.750000,-1.535000,4.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.750000,0.000000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.000000,0.000000,28.250000>}
box{<0,0,-0.127000><3.181981,0.035000,0.127000> rotate<0,44.997030,0> translate<10.750000,0.000000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.000000,0.000000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.250000,0.000000,28.750000>}
box{<0,0,-0.127000><3.181981,0.035000,0.127000> rotate<0,44.997030,0> translate<11.000000,0.000000,31.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.250000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.500000,-1.535000,4.000000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.250000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.590000,-1.535000,3.090000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.590000,-1.535000,2.250000>}
box{<0,0,-0.127000><0.840000,0.035000,0.127000> rotate<0,-90.000000,0> translate<13.590000,-1.535000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.620000,-1.535000,29.380000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.620000,-1.535000,47.750000>}
box{<0,0,-0.127000><18.370000,0.035000,0.127000> rotate<0,90.000000,0> translate<13.620000,-1.535000,47.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.000000,0.000000,39.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.000000,0.000000,42.250000>}
box{<0,0,-0.127000><2.500000,0.035000,0.127000> rotate<0,90.000000,0> translate<14.000000,0.000000,42.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.080000,-1.535000,30.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.500000,-1.535000,27.250000>}
box{<0,0,-0.127000><4.836610,0.035000,0.127000> rotate<0,44.997030,0> translate<11.080000,-1.535000,30.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.000000,0.000000,39.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.500000,0.000000,39.250000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<14.000000,0.000000,39.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.000000,-1.535000,33.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.750000,-1.535000,25.000000>}
box{<0,0,-0.127000><12.374369,0.035000,0.127000> rotate<0,44.997030,0> translate<6.000000,-1.535000,33.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.540000,-1.535000,32.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.750000,-1.535000,26.000000>}
box{<0,0,-0.127000><8.782266,0.035000,0.127000> rotate<0,44.997030,0> translate<8.540000,-1.535000,32.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.500000,0.000000,16.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.000000,0.000000,16.750000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.500000,0.000000,16.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.000000,0.000000,14.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.000000,0.000000,16.750000>}
box{<0,0,-0.127000><2.550000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.000000,0.000000,16.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.620000,-1.535000,29.380000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.000000,-1.535000,28.000000>}
box{<0,0,-0.127000><1.951615,0.035000,0.127000> rotate<0,44.997030,0> translate<13.620000,-1.535000,29.380000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.000000,0.000000,37.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.000000,0.000000,36.569800>}
box{<0,0,-0.127000><0.430200,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.000000,0.000000,36.569800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.000000,0.000000,37.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.049800,0.000000,37.020000>}
box{<0,0,-0.127000><0.053666,0.035000,0.127000> rotate<0,-21.879268,0> translate<15.000000,0.000000,37.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.049800,0.000000,38.689800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.049800,0.000000,37.020000>}
box{<0,0,-0.127000><1.669800,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.049800,0.000000,37.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.200000,0.000000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.200000,0.000000,10.250000>}
box{<0,0,-0.127000><3.750000,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.200000,0.000000,10.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.000000,0.000000,14.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.200000,0.000000,14.000000>}
box{<0,0,-0.127000><0.282843,0.035000,0.127000> rotate<0,44.997030,0> translate<15.000000,0.000000,14.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.500000,0.000000,39.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.450000,0.000000,39.250000>}
box{<0,0,-0.127000><0.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.500000,0.000000,39.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.049800,0.000000,38.689800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.530000,0.000000,39.170000>}
box{<0,0,-0.127000><0.679105,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.049800,0.000000,38.689800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.450000,0.000000,39.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.530000,0.000000,39.170000>}
box{<0,0,-0.127000><0.113137,0.035000,0.127000> rotate<0,44.997030,0> translate<15.450000,0.000000,39.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.250000,0.000000,21.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.750000,0.000000,21.250000>}
box{<0,0,-0.127000><2.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.250000,0.000000,21.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.250000,0.000000,23.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.750000,0.000000,23.250000>}
box{<0,0,-0.127000><2.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.250000,0.000000,23.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.250000,0.000000,23.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.750000,0.000000,23.750000>}
box{<0,0,-0.127000><2.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.250000,0.000000,23.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.000000,0.000000,16.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,16.750000>}
box{<0,0,-0.127000><0.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.000000,0.000000,16.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.250000,0.000000,17.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,17.250000>}
box{<0,0,-0.127000><5.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.250000,0.000000,17.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.250000,0.000000,17.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,17.750000>}
box{<0,0,-0.127000><6.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.250000,0.000000,17.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.250000,0.000000,18.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,18.250000>}
box{<0,0,-0.127000><7.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.250000,0.000000,18.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.380000,0.000000,18.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,18.750000>}
box{<0,0,-0.127000><8.570000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.380000,0.000000,18.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.340000,0.000000,19.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,19.250000>}
box{<0,0,-0.127000><10.610000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.340000,0.000000,19.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.300000,0.000000,19.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,19.750000>}
box{<0,0,-0.127000><12.650000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.300000,0.000000,19.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.240000,0.000000,20.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,20.250000>}
box{<0,0,-0.127000><12.710000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.240000,0.000000,20.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.280000,0.000000,20.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,20.750000>}
box{<0,0,-0.127000><10.670000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.280000,0.000000,20.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.500000,0.000000,21.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,21.750000>}
box{<0,0,-0.127000><5.450000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.500000,0.000000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.590000,0.000000,22.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,22.250000>}
box{<0,0,-0.127000><7.360000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.590000,0.000000,22.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.630000,0.000000,22.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,22.750000>}
box{<0,0,-0.127000><5.320000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.630000,0.000000,22.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.900000,0.000000,24.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,24.250000>}
box{<0,0,-0.127000><3.050000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.900000,0.000000,24.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.750000,0.000000,24.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,24.750000>}
box{<0,0,-0.127000><3.200000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.750000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.000000,0.000000,25.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,25.250000>}
box{<0,0,-0.127000><2.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.000000,0.000000,25.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.000000,0.000000,25.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,25.750000>}
box{<0,0,-0.127000><2.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.000000,0.000000,25.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.000000,0.000000,26.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,26.250000>}
box{<0,0,-0.127000><2.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.000000,0.000000,26.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.000000,0.000000,26.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,26.750000>}
box{<0,0,-0.127000><2.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.000000,0.000000,26.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.500000,0.000000,27.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,27.250000>}
box{<0,0,-0.127000><3.450000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.500000,0.000000,27.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.750000,0.000000,27.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,27.750000>}
box{<0,0,-0.127000><3.200000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.750000,0.000000,27.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.000000,0.000000,28.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,28.250000>}
box{<0,0,-0.127000><2.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.000000,0.000000,28.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.250000,0.000000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,28.750000>}
box{<0,0,-0.127000><2.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.250000,0.000000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.130000,-1.535000,2.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.130000,-1.535000,4.630000>}
box{<0,0,-0.127000><2.380000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.130000,-1.535000,4.630000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.230000,0.000000,40.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.660000,0.000000,42.130000>}
box{<0,0,-0.127000><2.022325,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.230000,0.000000,40.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.625000,0.000000,42.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.660000,0.000000,42.715000>}
box{<0,0,-0.127000><0.049497,0.035000,0.127000> rotate<0,44.997030,0> translate<16.625000,0.000000,42.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.660000,0.000000,42.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.660000,0.000000,42.715000>}
box{<0,0,-0.127000><0.585000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.660000,0.000000,42.715000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.000000,0.000000,42.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.660000,0.000000,44.910000>}
box{<0,0,-0.127000><3.761808,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.000000,0.000000,42.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.750000,0.000000,12.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.750000,0.000000,5.750000>}
box{<0,0,-0.127000><6.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.750000,0.000000,5.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,26.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.750000,0.000000,26.750000>}
box{<0,0,-0.127000><0.800000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.950000,0.000000,26.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,16.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.000000,0.000000,16.750000>}
box{<0,0,-0.127000><1.050000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.950000,0.000000,16.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,23.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.000000,0.000000,23.250000>}
box{<0,0,-0.127000><1.050000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.950000,0.000000,23.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,26.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.250000,0.000000,26.250000>}
box{<0,0,-0.127000><1.300000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.950000,0.000000,26.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.750000,0.000000,26.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.250000,0.000000,27.250000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.750000,0.000000,26.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.250000,0.000000,27.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.250000,0.000000,27.250000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.250000,0.000000,27.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.410000,0.000000,32.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.250000,0.000000,32.250000>}
box{<0,0,-0.127000><10.840000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.410000,0.000000,32.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.000000,0.000000,36.569800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.319800,0.000000,34.250000>}
box{<0,0,-0.127000><3.280693,0.035000,0.127000> rotate<0,44.997030,0> translate<15.000000,0.000000,36.569800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.230000,0.000000,39.170000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.330000,0.000000,39.270000>}
box{<0,0,-0.127000><0.141421,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.230000,0.000000,39.170000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.330000,0.000000,39.270000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.330000,0.000000,40.700000>}
box{<0,0,-0.127000><1.430000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.330000,0.000000,40.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.450000,-1.535000,14.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.450000,-1.535000,20.000000>}
box{<0,0,-0.127000><8.485281,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.450000,-1.535000,14.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.625000,0.000000,42.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.480000,0.000000,42.750000>}
box{<0,0,-0.203200><0.855000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.625000,0.000000,42.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.480000,0.000000,42.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.490000,0.000000,42.760000>}
box{<0,0,-0.127000><0.014142,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.480000,0.000000,42.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,21.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500000,0.000000,21.750000>}
box{<0,0,-0.127000><1.550000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.950000,0.000000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500000,0.000000,22.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500000,0.000000,21.750000>}
box{<0,0,-0.127000><1.000000,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.500000,0.000000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.000000,0.000000,23.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500000,0.000000,22.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<17.000000,0.000000,23.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,25.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500000,0.000000,25.250000>}
box{<0,0,-0.127000><1.550000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.950000,0.000000,25.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.000000,-1.535000,28.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500000,-1.535000,28.000000>}
box{<0,0,-0.127000><2.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.000000,-1.535000,28.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.250000,0.000000,27.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500000,0.000000,28.000000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.250000,0.000000,27.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.450000,0.000000,32.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500000,0.000000,32.750000>}
box{<0,0,-0.127000><9.050000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.450000,0.000000,32.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.750000,0.000000,12.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,13.000000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.750000,0.000000,12.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,13.000000>}
box{<0,0,-0.127000><1.950000,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.750000,0.000000,13.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,16.250000>}
box{<0,0,-0.127000><1.300000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.750000,0.000000,16.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500000,0.000000,21.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,21.750000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.500000,0.000000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.750000,-1.535000,25.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,-1.535000,25.000000>}
box{<0,0,-0.127000><3.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.750000,-1.535000,25.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500000,0.000000,25.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,25.000000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,44.997030,0> translate<17.500000,0.000000,25.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,25.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,25.750000>}
box{<0,0,-0.127000><1.800000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.950000,0.000000,25.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.250000,0.000000,32.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,31.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<17.250000,0.000000,32.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,31.750000>}
box{<0,0,-0.127000><1.200000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.750000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.490000,0.000000,33.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,33.250000>}
box{<0,0,-0.127000><7.260000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.490000,0.000000,33.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.750000,0.000000,5.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.000000,0.000000,4.450000>}
box{<0,0,-0.127000><1.803469,0.035000,0.127000> rotate<0,46.120259,0> translate<16.750000,0.000000,5.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.000000,0.000000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.000000,0.000000,6.550000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.000000,0.000000,6.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.950000,0.000000,23.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.000000,0.000000,23.750000>}
box{<0,0,-0.127000><2.050000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.950000,0.000000,23.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.750000,-1.535000,26.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.000000,-1.535000,26.000000>}
box{<0,0,-0.127000><3.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.750000,-1.535000,26.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,25.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.000000,0.000000,26.000000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.750000,0.000000,25.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.530000,0.000000,33.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.000000,0.000000,33.750000>}
box{<0,0,-0.127000><5.470000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.530000,0.000000,33.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,14.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,13.500000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.250000,0.000000,13.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,16.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,14.950000>}
box{<0,0,-0.127000><1.050000,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.250000,0.000000,14.950000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.000000,0.000000,16.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,18.000000>}
box{<0,0,-0.127000><1.767767,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.000000,0.000000,16.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.500000,-1.535000,27.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,-1.535000,27.250000>}
box{<0,0,-0.127000><3.750000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.500000,-1.535000,27.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.250000,0.000000,26.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,27.250000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.250000,0.000000,26.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.500000,0.000000,32.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,32.000000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<17.500000,0.000000,32.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,32.000000>}
box{<0,0,-0.127000><1.450000,0.035000,0.127000> rotate<0,90.000000,0> translate<18.250000,0.000000,32.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,37.270200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,36.000000>}
box{<0,0,-0.127000><1.270200,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.250000,0.000000,36.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.490000,0.000000,42.760000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.250000,0.000000,42.000000>}
box{<0,0,-0.203200><1.074802,0.035000,0.203200> rotate<0,44.997030,0> translate<17.490000,0.000000,42.760000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.250000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.250000,0.000000,42.000000>}
box{<0,0,-0.203200><6.500000,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.250000,0.000000,42.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,37.270200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250200,0.000000,37.020000>}
box{<0,0,-0.127000><0.250200,0.035000,0.127000> rotate<0,89.948263,0> translate<18.250000,0.000000,37.270200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.000000,0.000000,9.600000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.350000,0.000000,9.950000>}
box{<0,0,-0.127000><0.494975,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.000000,0.000000,9.600000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.350000,0.000000,12.055000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.350000,0.000000,9.950000>}
box{<0,0,-0.127000><2.105000,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.350000,0.000000,9.950000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,-1.535000,18.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.350000,-1.535000,18.100000>}
box{<0,0,-0.127000><0.141421,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.250000,-1.535000,18.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250200,0.000000,37.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.500000,0.000000,37.269800>}
box{<0,0,-0.127000><0.353271,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.250200,0.000000,37.020000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.250000,0.000000,42.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.500000,0.000000,41.750000>}
box{<0,0,-0.203200><0.353553,0.035000,0.203200> rotate<0,44.997030,0> translate<18.250000,0.000000,42.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.500000,0.000000,37.269800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.500000,0.000000,41.750000>}
box{<0,0,-0.203200><4.480200,0.035000,0.203200> rotate<0,90.000000,0> translate<18.500000,0.000000,41.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.670000,-1.535000,6.170000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.670000,-1.535000,2.250000>}
box{<0,0,-0.127000><3.920000,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.670000,-1.535000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.750000,0.000000,14.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.750000,0.000000,13.500000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.750000,0.000000,13.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,16.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.750000,0.000000,16.500000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.250000,0.000000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.000000,-1.535000,23.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.750000,-1.535000,23.000000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<18.000000,-1.535000,23.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,33.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.750000,0.000000,32.250000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,44.997030,0> translate<17.750000,0.000000,33.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.750000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.750000,0.000000,32.250000>}
box{<0,0,-0.127000><1.700000,0.035000,0.127000> rotate<0,90.000000,0> translate<18.750000,0.000000,32.250000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.750000,-1.535000,35.250000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.750000,-1.535000,33.000000>}
box{<0,0,-0.203200><2.250000,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.750000,-1.535000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.750000,0.000000,36.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.750000,0.000000,35.250000>}
box{<0,0,-0.203200><0.750000,0.035000,0.203200> rotate<0,-90.000000,0> translate<18.750000,0.000000,35.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.250000,0.000000,36.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.750000,0.000000,36.000000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.250000,0.000000,36.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.000000,0.000000,9.600000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.900000,0.000000,10.500000>}
box{<0,0,-0.127000><1.272792,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.000000,0.000000,9.600000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.250000,0.000000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.000000,0.000000,49.250000>}
box{<0,0,-0.203200><1.060660,0.035000,0.203200> rotate<0,-44.997030,0> translate<18.250000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.250000,0.000000,14.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.250000,0.000000,12.500000>}
box{<0,0,-0.127000><2.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.250000,0.000000,12.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,13.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.250000,0.000000,13.000000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.750000,0.000000,13.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.250000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.250000,0.000000,13.000000>}
box{<0,0,-0.127000><1.950000,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.250000,0.000000,13.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.000000,0.000000,33.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.250000,0.000000,32.500000>}
box{<0,0,-0.127000><1.767767,0.035000,0.127000> rotate<0,44.997030,0> translate<18.000000,0.000000,33.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.250000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.250000,0.000000,32.500000>}
box{<0,0,-0.127000><1.950000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.250000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,16.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.500000,0.000000,18.000000>}
box{<0,0,-0.127000><2.474874,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.750000,0.000000,16.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.450000,-1.535000,20.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.500000,-1.535000,20.000000>}
box{<0,0,-0.127000><2.050000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.450000,-1.535000,20.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.750000,0.000000,21.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.500000,0.000000,20.000000>}
box{<0,0,-0.127000><2.474874,0.035000,0.127000> rotate<0,44.997030,0> translate<17.750000,0.000000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.500000,0.000000,18.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.500000,0.000000,20.000000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.500000,0.000000,20.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.750000,-1.535000,23.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.600000,-1.535000,23.000000>}
box{<0,0,-0.127000><0.850000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.750000,-1.535000,23.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.600000,-1.535000,23.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.600000,-1.535000,24.500000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.600000,-1.535000,24.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.750000,0.000000,14.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.750000,0.000000,12.500000>}
box{<0,0,-0.127000><2.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<19.750000,0.000000,12.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.600000,-1.535000,24.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.750000,-1.535000,24.650000>}
box{<0,0,-0.127000><0.212132,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.600000,-1.535000,24.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.750000,-1.535000,24.650000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.750000,-1.535000,26.250000>}
box{<0,0,-0.127000><1.600000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.750000,-1.535000,26.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.750000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.750000,0.000000,33.500000>}
box{<0,0,-0.127000><2.950000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.750000,0.000000,33.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.750000,-1.535000,33.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.750000,-1.535000,46.250000>}
box{<0,0,-0.127000><12.750000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.750000,-1.535000,46.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.000000,0.000000,4.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.000000,0.000000,4.450000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.000000,0.000000,4.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.000000,0.000000,6.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.000000,0.000000,7.900000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.000000,0.000000,7.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.000000,0.000000,9.600000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.000000,0.000000,9.250000>}
box{<0,0,-0.127000><0.350000,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.000000,0.000000,9.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.900000,0.000000,10.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.250000,0.000000,10.500000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.900000,0.000000,10.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.250000,0.000000,14.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.250000,0.000000,12.500000>}
box{<0,0,-0.127000><2.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.250000,0.000000,12.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.250000,0.000000,30.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.250000,0.000000,32.500000>}
box{<0,0,-0.127000><1.750000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.250000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.500000,-1.535000,20.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.650000,-1.535000,20.000000>}
box{<0,0,-0.127000><1.150000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.500000,-1.535000,20.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.250000,0.000000,10.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,0.000000,11.000000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.250000,0.000000,10.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,0.000000,14.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,0.000000,12.500000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.750000,0.000000,12.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.350000,-1.535000,18.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,-1.535000,18.100000>}
box{<0,0,-0.127000><2.400000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.350000,-1.535000,18.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.650000,-1.535000,20.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,-1.535000,19.900000>}
box{<0,0,-0.127000><0.141421,0.035000,0.127000> rotate<0,44.997030,0> translate<20.650000,-1.535000,20.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,0.000000,30.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,0.000000,32.500000>}
box{<0,0,-0.127000><1.750000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.750000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,-1.535000,33.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,-1.535000,46.500000>}
box{<0,0,-0.127000><13.000000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.750000,-1.535000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.250000,-1.535000,17.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.100000,-1.535000,18.100000>}
box{<0,0,-0.127000><1.202082,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.250000,-1.535000,17.250000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.750000,-1.535000,28.250000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.150000,-1.535000,28.250000>}
box{<0,0,-0.203200><1.400000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.750000,-1.535000,28.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.210000,-1.535000,7.460000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.210000,-1.535000,2.250000>}
box{<0,0,-0.127000><5.210000,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.210000,-1.535000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.000000,0.000000,9.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.250000,0.000000,10.500000>}
box{<0,0,-0.127000><1.767767,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.000000,0.000000,9.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.250000,0.000000,14.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.250000,0.000000,12.500000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.250000,0.000000,12.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.250000,0.000000,30.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.250000,0.000000,32.125000>}
box{<0,0,-0.127000><1.375000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.250000,0.000000,32.125000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.750000,-1.535000,46.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.250000,-1.535000,47.750000>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.750000,-1.535000,46.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,-1.535000,19.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.400000,-1.535000,20.550000>}
box{<0,0,-0.127000><0.919239,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.750000,-1.535000,19.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.400000,-1.535000,20.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.400000,-1.535000,23.000000>}
box{<0,0,-0.127000><2.450000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.400000,-1.535000,23.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.400000,-1.535000,24.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.400000,-1.535000,23.000000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.400000,-1.535000,23.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,0.000000,11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,0.000000,11.000000>}
box{<0,0,-0.127000><0.750000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.750000,0.000000,11.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.250000,0.000000,17.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,0.000000,18.500000>}
box{<0,0,-0.127000><1.767767,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.250000,0.000000,17.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.400000,-1.535000,24.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,-1.535000,24.600000>}
box{<0,0,-0.127000><0.141421,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.400000,-1.535000,24.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,-1.535000,25.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,-1.535000,24.600000>}
box{<0,0,-0.127000><0.400000,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.500000,-1.535000,24.600000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,-1.535000,26.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,-1.535000,25.000000>}
box{<0,0,-0.127000><1.100000,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.500000,-1.535000,25.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.150000,-1.535000,28.250000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.500000,-1.535000,27.900000>}
box{<0,0,-0.203200><0.494975,0.035000,0.203200> rotate<0,44.997030,0> translate<21.150000,-1.535000,28.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,0.000000,34.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,0.000000,33.750000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.500000,0.000000,33.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.319800,0.000000,34.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,0.000000,34.250000>}
box{<0,0,-0.127000><4.180200,0.035000,0.127000> rotate<0,0.000000,0> translate<17.319800,0.000000,34.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,0.000000,35.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,0.000000,34.250000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.500000,0.000000,34.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,-1.535000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,-1.535000,47.250000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,-44.997030,0> translate<20.750000,-1.535000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.250000,0.000000,10.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,0.000000,10.500000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.250000,0.000000,10.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,0.000000,11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,0.000000,11.250000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.500000,0.000000,11.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,0.000000,11.250000>}
box{<0,0,-0.127000><3.700000,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.750000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.750000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,0.000000,16.500000>}
box{<0,0,-0.127000><3.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.750000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,0.000000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,0.000000,31.375000>}
box{<0,0,-0.127000><0.875000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.750000,0.000000,31.375000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,0.000000,31.375000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,0.000000,31.500000>}
box{<0,0,-0.127000><0.125000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.750000,0.000000,31.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,0.000000,31.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,0.000000,31.750000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.750000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.000000,0.000000,4.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.000000,0.000000,4.450000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.000000,0.000000,4.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.000000,0.000000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.000000,0.000000,6.550000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.000000,0.000000,6.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.000000,0.000000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.000000,0.000000,25.500000>}
box{<0,0,-0.127000><3.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.000000,0.000000,25.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,-1.535000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.150000,-1.535000,16.500000>}
box{<0,0,-0.127000><0.400000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.750000,-1.535000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.750000,0.000000,10.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.250000,0.000000,11.000000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.750000,0.000000,10.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.250000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.250000,0.000000,11.000000>}
box{<0,0,-0.127000><3.950000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.250000,0.000000,11.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,-1.535000,18.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.250000,-1.535000,18.100000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.750000,-1.535000,18.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.100000,-1.535000,18.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.250000,-1.535000,18.100000>}
box{<0,0,-0.127000><1.150000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.100000,-1.535000,18.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,-1.535000,19.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.250000,-1.535000,19.900000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.750000,-1.535000,19.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.750000,0.000000,33.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.250000,0.000000,32.000000>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,44.997030,0> translate<20.750000,0.000000,33.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.250000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.250000,0.000000,32.000000>}
box{<0,0,-0.127000><1.450000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.250000,0.000000,32.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,-1.535000,25.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.500000,-1.535000,25.000000>}
box{<0,0,-0.127000><1.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.500000,-1.535000,25.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.000000,0.000000,25.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.500000,0.000000,25.000000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<22.000000,0.000000,25.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.000000,0.000000,9.600000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.750000,0.000000,10.350000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.000000,0.000000,9.600000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.750000,0.000000,10.350000>}
box{<0,0,-0.127000><4.600000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.750000,0.000000,10.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.000000,0.000000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.750000,0.000000,29.500000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.000000,0.000000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.750000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.750000,0.000000,29.500000>}
box{<0,0,-0.127000><1.050000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.750000,0.000000,29.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.750000,0.000000,32.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.750000,0.000000,30.550000>}
box{<0,0,-0.127000><1.950000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.750000,0.000000,30.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,0.000000,33.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.750000,0.000000,32.500000>}
box{<0,0,-0.127000><1.767767,0.035000,0.127000> rotate<0,44.997030,0> translate<21.500000,0.000000,33.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.837000,-1.535000,35.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.850000,-1.535000,35.487000>}
box{<0,0,-0.127000><0.018385,0.035000,0.127000> rotate<0,44.997030,0> translate<22.837000,-1.535000,35.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.850000,-1.535000,34.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.850000,-1.535000,35.487000>}
box{<0,0,-0.127000><1.487000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.850000,-1.535000,35.487000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,0.000000,35.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.900000,0.000000,37.150000>}
box{<0,0,-0.127000><1.979899,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.500000,0.000000,35.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.900000,0.000000,41.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.900000,0.000000,37.150000>}
box{<0,0,-0.127000><4.350000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.900000,0.000000,37.150000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,-1.535000,26.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.000000,-1.535000,26.100000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.500000,-1.535000,26.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.500000,-1.535000,27.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.000000,-1.535000,27.900000>}
box{<0,0,-0.203200><1.500000,0.035000,0.203200> rotate<0,0.000000,0> translate<21.500000,-1.535000,27.900000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.000000,-1.535000,27.900000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.000000,-1.535000,28.500000>}
box{<0,0,-0.203200><0.600000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.000000,-1.535000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<18.750000,-1.535000,33.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.000000,-1.535000,28.750000>}
box{<0,0,-0.203200><6.010408,0.035000,0.203200> rotate<0,44.997030,0> translate<18.750000,-1.535000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.250000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.250000,0.000000,10.350000>}
box{<0,0,-0.127000><4.600000,0.035000,0.127000> rotate<0,-90.000000,0> translate<23.250000,0.000000,10.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.000000,-1.535000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.250000,-1.535000,28.750000>}
box{<0,0,-0.203200><0.353553,0.035000,0.203200> rotate<0,-44.997030,0> translate<23.000000,-1.535000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.000000,-1.535000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.250000,-1.535000,28.750000>}
box{<0,0,-0.203200><0.250000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.000000,-1.535000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.250000,0.000000,28.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.250000,0.000000,28.750000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,90.000000,0> translate<23.250000,0.000000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.250000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.250000,0.000000,28.750000>}
box{<0,0,-0.127000><1.800000,0.035000,0.127000> rotate<0,-90.000000,0> translate<23.250000,0.000000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.250000,0.000000,30.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.250000,0.000000,32.500000>}
box{<0,0,-0.127000><1.750000,0.035000,0.127000> rotate<0,90.000000,0> translate<23.250000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.250000,0.000000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.500000,0.000000,28.750000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.250000,0.000000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.500000,-1.535000,45.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.500000,-1.535000,45.750000>}
box{<0,0,-0.127000><0.300000,0.035000,0.127000> rotate<0,90.000000,0> translate<23.500000,-1.535000,45.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,-1.535000,8.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,-1.535000,2.250000>}
box{<0,0,-0.127000><6.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<23.750000,-1.535000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,0.000000,11.250000>}
box{<0,0,-0.127000><3.700000,0.035000,0.127000> rotate<0,-90.000000,0> translate<23.750000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.150000,-1.535000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,-1.535000,18.100000>}
box{<0,0,-0.127000><2.262742,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.150000,-1.535000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.250000,-1.535000,19.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,-1.535000,19.900000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.250000,-1.535000,19.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,0.000000,30.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,0.000000,32.500000>}
box{<0,0,-0.127000><1.750000,0.035000,0.127000> rotate<0,90.000000,0> translate<23.750000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.500000,-1.535000,43.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,-1.535000,43.300000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,44.997030,0> translate<23.500000,-1.535000,43.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,-1.535000,39.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,-1.535000,43.300000>}
box{<0,0,-0.127000><3.800000,0.035000,0.127000> rotate<0,90.000000,0> translate<23.750000,-1.535000,43.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.000000,0.000000,4.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.000000,0.000000,4.450000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.000000,0.000000,4.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.000000,0.000000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.000000,0.000000,6.550000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.000000,0.000000,6.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.250000,0.000000,10.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.000000,0.000000,9.600000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<23.250000,0.000000,10.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.500000,-1.535000,5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.000000,-1.535000,16.500000>}
box{<0,0,-0.127000><16.263456,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.500000,-1.535000,5.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,0.000000,39.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.000000,0.000000,39.500000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.750000,0.000000,39.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,0.000000,11.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.250000,0.000000,10.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<23.750000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.250000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.250000,0.000000,11.500000>}
box{<0,0,-0.127000><3.450000,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.250000,0.000000,11.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,-1.535000,19.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.250000,-1.535000,19.900000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.750000,-1.535000,19.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.500000,0.000000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.250000,0.000000,29.500000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.500000,0.000000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.250000,0.000000,29.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.250000,0.000000,30.550000>}
box{<0,0,-0.127000><1.050000,0.035000,0.127000> rotate<0,90.000000,0> translate<24.250000,0.000000,30.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.250000,0.000000,30.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.250000,0.000000,32.500000>}
box{<0,0,-0.127000><1.750000,0.035000,0.127000> rotate<0,90.000000,0> translate<24.250000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.250000,0.000000,11.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,0.000000,11.250000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,44.997030,0> translate<24.250000,0.000000,11.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.000000,-1.535000,26.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,-1.535000,26.100000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.000000,-1.535000,26.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,-1.535000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,-1.535000,27.900000>}
box{<0,0,-0.127000><0.850000,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.500000,-1.535000,27.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.000000,0.000000,39.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,0.000000,40.000000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.000000,0.000000,39.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,0.000000,41.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,0.000000,40.000000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.500000,0.000000,40.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.500000,-1.535000,45.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,-1.535000,46.750000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.500000,-1.535000,45.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.750000,0.000000,11.750000>}
box{<0,0,-0.127000><3.200000,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.750000,0.000000,11.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,0.000000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.750000,0.000000,29.000000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.500000,0.000000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.750000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.750000,0.000000,29.000000>}
box{<0,0,-0.127000><1.550000,0.035000,0.127000> rotate<0,-90.000000,0> translate<24.750000,0.000000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.750000,0.000000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.750000,0.000000,32.500000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,90.000000,0> translate<24.750000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.250000,0.000000,10.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.850000,0.000000,10.750000>}
box{<0,0,-0.127000><0.600000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.250000,0.000000,10.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,0.000000,11.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.000000,0.000000,11.250000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.500000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.000000,-1.535000,4.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.000000,-1.535000,16.500000>}
box{<0,0,-0.127000><16.970563,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.000000,-1.535000,4.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.000000,-1.535000,17.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.000000,-1.535000,16.500000>}
box{<0,0,-0.127000><0.750000,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.000000,-1.535000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.000000,-1.535000,39.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.000000,-1.535000,43.050000>}
box{<0,0,-0.127000><3.550000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.000000,-1.535000,43.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.750000,0.000000,11.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.250000,0.000000,11.750000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.750000,0.000000,11.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.250000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.250000,0.000000,12.500000>}
box{<0,0,-0.127000><2.450000,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.250000,0.000000,12.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.000000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.250000,0.000000,16.500000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.000000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.000000,0.000000,17.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.250000,0.000000,17.250000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.000000,0.000000,17.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.837000,0.000000,35.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.250000,0.000000,33.087000>}
box{<0,0,-0.127000><3.412497,0.035000,0.127000> rotate<0,44.997030,0> translate<22.837000,0.000000,35.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.250000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.250000,0.000000,33.087000>}
box{<0,0,-0.127000><2.537000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.250000,0.000000,33.087000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.000000,0.000000,39.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300000,0.000000,39.800000>}
box{<0,0,-0.127000><0.424264,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.000000,0.000000,39.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300000,0.000000,41.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.300000,0.000000,39.800000>}
box{<0,0,-0.127000><1.700000,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.300000,0.000000,39.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.000000,0.000000,11.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,0.000000,10.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<25.000000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.210000,-1.535000,7.460000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,-1.535000,11.750000>}
box{<0,0,-0.127000><6.066976,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.210000,-1.535000,7.460000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,-1.535000,26.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,-1.535000,26.100000>}
box{<0,0,-0.127000><1.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.500000,-1.535000,26.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,-1.535000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,-1.535000,26.100000>}
box{<0,0,-0.127000><2.650000,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.500000,-1.535000,26.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,-1.535000,33.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,-1.535000,28.750000>}
box{<0,0,-0.127000><5.150000,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.500000,-1.535000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.000000,-1.535000,43.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,-1.535000,43.550000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.000000,-1.535000,43.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.650000,-1.535000,34.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.600000,-1.535000,34.000000>}
box{<0,0,-0.127000><0.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.650000,-1.535000,34.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,-1.535000,33.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.600000,-1.535000,34.000000>}
box{<0,0,-0.127000><0.141421,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.500000,-1.535000,33.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.250000,0.000000,11.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.750000,0.000000,11.250000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<25.250000,0.000000,11.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.750000,0.000000,12.750000>}
box{<0,0,-0.127000><2.200000,0.035000,0.127000> rotate<0,-90.000000,0> translate<25.750000,0.000000,12.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.250000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.750000,0.000000,16.000000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<25.250000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.750000,0.000000,16.000000>}
box{<0,0,-0.127000><1.050000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.750000,0.000000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.750000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.750000,0.000000,33.587000>}
box{<0,0,-0.127000><3.037000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.750000,0.000000,33.587000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.000000,0.000000,4.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,0.000000,4.450000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.000000,0.000000,4.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,0.000000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,0.000000,6.550000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.000000,0.000000,6.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.850000,0.000000,10.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,0.000000,9.600000>}
box{<0,0,-0.127000><1.626346,0.035000,0.127000> rotate<0,44.997030,0> translate<24.850000,0.000000,10.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.750000,-1.535000,8.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,-1.535000,11.000000>}
box{<0,0,-0.127000><3.181981,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.750000,-1.535000,8.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.250000,0.000000,12.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,0.000000,11.750000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<25.250000,0.000000,12.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.500000,-1.535000,4.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,-1.535000,16.500000>}
box{<0,0,-0.127000><17.677670,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.500000,-1.535000,4.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,-1.535000,17.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,-1.535000,16.500000>}
box{<0,0,-0.127000><1.000000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.000000,-1.535000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,0.000000,17.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,0.000000,17.500000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.000000,0.000000,17.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.250000,-1.535000,19.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.100000,-1.535000,21.750000>}
box{<0,0,-0.127000><2.616295,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.250000,-1.535000,19.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.100000,-1.535000,23.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.100000,-1.535000,21.750000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.100000,-1.535000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.100000,0.000000,41.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.100000,0.000000,38.650000>}
box{<0,0,-0.127000><2.850000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.100000,0.000000,38.650000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.220000,-1.535000,9.470000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.220000,-1.535000,2.250000>}
box{<0,0,-0.127000><7.220000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.220000,-1.535000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.250000,0.000000,14.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.250000,0.000000,12.250000>}
box{<0,0,-0.127000><2.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.250000,0.000000,12.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.250000,0.000000,17.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.250000,0.000000,16.250000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,44.997030,0> translate<25.250000,0.000000,17.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.250000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.250000,0.000000,16.250000>}
box{<0,0,-0.127000><1.300000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.250000,0.000000,16.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.250000,0.000000,28.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.250000,0.000000,25.500000>}
box{<0,0,-0.127000><4.069705,0.035000,0.127000> rotate<0,42.507642,0> translate<23.250000,0.000000,28.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,0.000000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.250000,0.000000,29.500000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.500000,0.000000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.250000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.250000,0.000000,29.500000>}
box{<0,0,-0.127000><1.050000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.250000,0.000000,29.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.250000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.250000,0.000000,32.750000>}
box{<0,0,-0.127000><2.200000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.250000,0.000000,32.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,-1.535000,26.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.500000,-1.535000,26.100000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.500000,-1.535000,26.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.500000,-1.535000,27.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.500000,-1.535000,28.500000>}
box{<0,0,-0.127000><0.600000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.500000,-1.535000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.500000,-1.535000,46.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.500000,-1.535000,46.750000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.500000,-1.535000,46.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.750000,0.000000,14.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.750000,0.000000,12.250000>}
box{<0,0,-0.127000><2.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.750000,0.000000,12.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,0.000000,17.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.750000,0.000000,16.500000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<26.000000,0.000000,17.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.750000,0.000000,16.500000>}
box{<0,0,-0.127000><1.550000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.750000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.500000,-1.535000,28.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.750000,-1.535000,28.750000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.500000,-1.535000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.750000,0.000000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.750000,0.000000,30.550000>}
box{<0,0,-0.127000><1.800000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.750000,0.000000,30.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.750000,0.000000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.750000,0.000000,31.750000>}
box{<0,0,-0.127000><0.750000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.750000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,-1.535000,47.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.750000,-1.535000,47.250000>}
box{<0,0,-0.127000><5.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.500000,-1.535000,47.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,0.000000,10.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.850000,0.000000,10.750000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.500000,0.000000,10.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.220000,-1.535000,9.470000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,-1.535000,10.250000>}
box{<0,0,-0.127000><1.103087,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.220000,-1.535000,9.470000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.750000,0.000000,11.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,0.000000,11.250000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.750000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.590000,-1.535000,3.090000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,-1.535000,16.500000>}
box{<0,0,-0.127000><18.964604,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.590000,-1.535000,3.090000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,-1.535000,17.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,-1.535000,16.500000>}
box{<0,0,-0.127000><0.750000,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.000000,-1.535000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,0.000000,17.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,0.000000,17.250000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.000000,0.000000,17.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.500000,0.000000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,0.000000,18.500000>}
box{<0,0,-0.127000><5.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.500000,0.000000,18.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.250000,-1.535000,47.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,-1.535000,47.750000>}
box{<0,0,-0.127000><5.750000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.250000,-1.535000,47.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,-1.535000,45.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.050000,-1.535000,45.450000>}
box{<0,0,-0.127000><1.550000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.500000,-1.535000,45.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,0.000000,11.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,11.750000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.000000,0.000000,11.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,14.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,13.500000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.250000,0.000000,13.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,0.000000,17.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,16.750000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,44.997030,0> translate<27.000000,0.000000,17.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,16.750000>}
box{<0,0,-0.127000><1.800000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.250000,0.000000,16.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,29.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,30.550000>}
box{<0,0,-0.127000><1.300000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.250000,0.000000,30.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,0.000000,32.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,32.250000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,44.997030,0> translate<27.000000,0.000000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,32.250000>}
box{<0,0,-0.127000><1.700000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.250000,0.000000,32.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.400000,-1.535000,34.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.400000,-1.535000,35.237000>}
box{<0,0,-0.127000><1.237000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.400000,-1.535000,35.237000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,0.000000,11.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.500000,0.000000,10.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<27.000000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.750000,0.000000,33.587000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.663000,0.000000,35.500000>}
box{<0,0,-0.127000><2.705391,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.750000,0.000000,33.587000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.400000,-1.535000,35.237000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.663000,-1.535000,35.500000>}
box{<0,0,-0.127000><0.371938,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.400000,-1.535000,35.237000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,11.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,11.250000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<27.250000,0.000000,11.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,12.625000>}
box{<0,0,-0.127000><2.325000,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.750000,0.000000,12.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,17.000000>}
box{<0,0,-0.127000><2.050000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.750000,0.000000,17.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,-1.535000,20.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,-1.535000,21.750000>}
box{<0,0,-0.127000><1.000000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.750000,-1.535000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.250000,0.000000,29.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,28.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<27.250000,0.000000,29.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,29.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,30.550000>}
box{<0,0,-0.127000><0.800000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.750000,0.000000,30.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,34.000000>}
box{<0,0,-0.127000><3.450000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.750000,0.000000,34.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,-1.535000,21.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.900000,-1.535000,21.750000>}
box{<0,0,-0.127000><0.150000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.750000,-1.535000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.900000,-1.535000,23.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.900000,-1.535000,21.750000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<27.900000,-1.535000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,0.000000,4.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,0.000000,4.450000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.000000,0.000000,4.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,0.000000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,0.000000,6.550000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.000000,0.000000,6.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.850000,0.000000,10.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,0.000000,9.600000>}
box{<0,0,-0.127000><1.626346,0.035000,0.127000> rotate<0,44.997030,0> translate<26.850000,0.000000,10.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.130000,-1.535000,4.630000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,-1.535000,16.500000>}
box{<0,0,-0.127000><16.786715,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.130000,-1.535000,4.630000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,-1.535000,17.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,-1.535000,16.500000>}
box{<0,0,-0.127000><0.750000,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.000000,-1.535000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,17.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,0.000000,17.250000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.750000,0.000000,17.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,0.000000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,0.000000,19.500000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.000000,0.000000,18.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,-1.535000,20.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,-1.535000,20.500000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,44.997030,0> translate<27.750000,-1.535000,20.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,0.000000,19.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,0.000000,20.500000>}
box{<0,0,-0.127000><1.000000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.000000,0.000000,20.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,0.000000,23.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,0.000000,20.500000>}
box{<0,0,-0.127000><3.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.000000,0.000000,20.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.900000,-1.535000,21.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,-1.535000,21.750000>}
box{<0,0,-0.127000><0.100000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.900000,-1.535000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.250000,0.000000,25.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,0.000000,23.750000>}
box{<0,0,-0.127000><2.474874,0.035000,0.127000> rotate<0,44.997030,0> translate<26.250000,0.000000,25.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.500000,-1.535000,26.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,-1.535000,26.100000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.500000,-1.535000,26.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,-1.535000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,-1.535000,28.500000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,44.997030,0> translate<27.750000,-1.535000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,-1.535000,27.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,-1.535000,28.500000>}
box{<0,0,-0.127000><0.600000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.000000,-1.535000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.250000,0.000000,14.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.250000,0.000000,13.500000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.250000,0.000000,13.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.250000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.250000,0.000000,16.000000>}
box{<0,0,-0.127000><1.050000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.250000,0.000000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,29.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.250000,0.000000,29.250000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<27.750000,0.000000,29.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.250000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.250000,0.000000,33.500000>}
box{<0,0,-0.127000><2.950000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.250000,0.000000,33.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.100000,0.000000,38.650000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.375000,0.000000,36.375000>}
box{<0,0,-0.127000><3.217336,0.035000,0.127000> rotate<0,44.997030,0> translate<26.100000,0.000000,38.650000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.900000,-1.535000,23.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.400000,-1.535000,23.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.900000,-1.535000,23.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.500000,0.000000,23.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.500000,0.000000,24.750000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.500000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,-1.535000,26.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.500000,-1.535000,26.100000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.000000,-1.535000,26.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.500000,-1.535000,24.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.500000,-1.535000,26.100000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.500000,-1.535000,26.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.250000,0.000000,33.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.500000,0.000000,33.750000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.250000,0.000000,33.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.500000,-1.535000,11.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,-1.535000,11.750000>}
box{<0,0,-0.127000><3.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.500000,-1.535000,11.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,-1.535000,12.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,-1.535000,11.750000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.750000,-1.535000,11.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,0.000000,12.000000>}
box{<0,0,-0.127000><2.950000,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.750000,0.000000,12.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,-1.535000,21.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,-1.535000,22.250000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.750000,-1.535000,22.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.250000,0.000000,29.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,0.000000,29.250000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.250000,0.000000,29.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,0.000000,32.250000>}
box{<0,0,-0.127000><1.700000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.750000,0.000000,32.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.500000,-1.535000,33.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,-1.535000,34.000000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.500000,-1.535000,33.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,34.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,0.000000,35.000000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.750000,0.000000,34.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.375000,0.000000,36.375000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,0.000000,36.000000>}
box{<0,0,-0.127000><0.530330,0.035000,0.127000> rotate<0,44.997030,0> translate<28.375000,0.000000,36.375000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,0.000000,35.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,0.000000,36.000000>}
box{<0,0,-0.127000><1.000000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.750000,0.000000,36.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.050000,-1.535000,45.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,-1.535000,43.750000>}
box{<0,0,-0.127000><2.404163,0.035000,0.127000> rotate<0,44.997030,0> translate<27.050000,-1.535000,45.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,-1.535000,34.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,-1.535000,43.750000>}
box{<0,0,-0.127000><9.750000,0.035000,0.127000> rotate<0,90.000000,0> translate<28.750000,-1.535000,43.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.760000,-1.535000,8.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.760000,-1.535000,2.250000>}
box{<0,0,-0.127000><6.260000,0.035000,0.127000> rotate<0,-90.000000,0> translate<28.760000,-1.535000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.500000,0.000000,10.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.850000,0.000000,10.750000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.500000,0.000000,10.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.750000,0.000000,11.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.000000,0.000000,11.250000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.750000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.670000,-1.535000,6.170000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.000000,-1.535000,16.500000>}
box{<0,0,-0.127000><14.608826,0.035000,0.127000> rotate<0,-44.997030,0> translate<18.670000,-1.535000,6.170000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.000000,-1.535000,16.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.000000,-1.535000,16.500000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.000000,-1.535000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.250000,0.000000,16.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.000000,0.000000,16.750000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.250000,0.000000,16.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.500000,0.000000,23.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.000000,0.000000,22.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<28.500000,0.000000,23.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.000000,-1.535000,11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,-1.535000,11.000000>}
box{<0,0,-0.127000><3.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.000000,-1.535000,11.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,0.000000,13.000000>}
box{<0,0,-0.127000><1.950000,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.250000,0.000000,13.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,-1.535000,22.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,-1.535000,22.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.750000,-1.535000,22.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,0.000000,29.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,0.000000,28.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<28.750000,0.000000,29.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,0.000000,30.550000>}
box{<0,0,-0.127000><1.200000,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.250000,0.000000,30.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,0.000000,32.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,0.000000,32.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.750000,0.000000,32.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,0.000000,32.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,0.000000,34.250000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.250000,0.000000,34.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,-1.535000,44.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,-1.535000,34.250000>}
box{<0,0,-0.127000><9.750000,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.250000,-1.535000,34.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.500000,-1.535000,46.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,-1.535000,44.000000>}
box{<0,0,-0.127000><3.889087,0.035000,0.127000> rotate<0,44.997030,0> translate<26.500000,-1.535000,46.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,-1.535000,10.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,-1.535000,10.250000>}
box{<0,0,-0.127000><2.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.000000,-1.535000,10.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.000000,0.000000,11.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,0.000000,10.750000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<29.000000,0.000000,11.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.750000,-1.535000,21.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,-1.535000,20.250000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<28.750000,-1.535000,21.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.500000,-1.535000,26.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,-1.535000,26.100000>}
box{<0,0,-0.127000><1.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.500000,-1.535000,26.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,-1.535000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,-1.535000,28.500000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,44.997030,0> translate<29.250000,-1.535000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,-1.535000,27.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,-1.535000,28.500000>}
box{<0,0,-0.127000><0.600000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.500000,-1.535000,28.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,-1.535000,11.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.625000,-1.535000,11.250000>}
box{<0,0,-0.127000><0.450694,0.035000,0.127000> rotate<0,-33.687844,0> translate<29.250000,-1.535000,11.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.625000,-1.535000,12.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.625000,-1.535000,11.250000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.625000,-1.535000,11.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,0.000000,13.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.625000,0.000000,12.750000>}
box{<0,0,-0.127000><0.450694,0.035000,0.127000> rotate<0,33.687844,0> translate<29.250000,0.000000,13.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,0.000000,34.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.625000,0.000000,34.625000>}
box{<0,0,-0.127000><0.530330,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.250000,0.000000,34.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,13.625000>}
box{<0,0,-0.127000><1.325000,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.750000,0.000000,13.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,0.000000,17.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,17.250000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,44.997030,0> translate<29.500000,0.000000,17.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,-1.535000,21.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,-1.535000,22.000000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.500000,-1.535000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.400000,-1.535000,23.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,-1.535000,23.750000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.400000,-1.535000,23.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,29.500000>}
box{<0,0,-0.127000><1.050000,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.750000,0.000000,29.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,30.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,31.500000>}
box{<0,0,-0.127000><0.750000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.750000,0.000000,31.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.625000,0.000000,34.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.875000,0.000000,34.625000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.625000,0.000000,34.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.000000,0.000000,4.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,4.450000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.000000,0.000000,4.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,6.550000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.000000,0.000000,6.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.850000,0.000000,10.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,9.600000>}
box{<0,0,-0.127000><1.626346,0.035000,0.127000> rotate<0,44.997030,0> translate<28.850000,0.000000,10.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,-1.535000,17.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,-1.535000,17.500000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500000,-1.535000,17.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,-1.535000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,-1.535000,18.500000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.750000,-1.535000,18.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,-1.535000,22.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,-1.535000,22.750000>}
box{<0,0,-0.127000><0.750000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.250000,-1.535000,22.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.500000,0.000000,24.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,26.250000>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.500000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,29.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,26.250000>}
box{<0,0,-0.127000><3.000000,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.000000,0.000000,26.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,29.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,29.250000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,44.997030,0> translate<29.750000,0.000000,29.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,44.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,45.250000>}
box{<0,0,-0.127000><0.750000,0.035000,0.127000> rotate<0,90.000000,0> translate<30.000000,0.000000,45.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,-1.535000,34.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.125000,-1.535000,34.250000>}
box{<0,0,-0.127000><0.875000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.250000,-1.535000,34.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,-1.535000,10.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,-1.535000,11.000000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.500000,-1.535000,10.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,-1.535000,11.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,-1.535000,11.000000>}
box{<0,0,-0.127000><0.625000,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.250000,-1.535000,11.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,0.000000,16.750000>}
box{<0,0,-0.127000><0.353553,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.000000,0.000000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,-1.535000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,-1.535000,22.000000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.750000,-1.535000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,23.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,0.000000,23.250000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<29.750000,0.000000,23.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,-1.535000,32.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,-1.535000,29.250000>}
box{<0,0,-0.127000><4.596194,0.035000,0.127000> rotate<0,44.997030,0> translate<27.000000,-1.535000,32.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,0.000000,32.750000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.250000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,0.000000,33.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,0.000000,32.750000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.250000,0.000000,32.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,-1.535000,33.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,-1.535000,33.000000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.250000,-1.535000,33.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.250000,-1.535000,34.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,-1.535000,33.250000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,44.997030,0> translate<29.250000,-1.535000,34.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,-1.535000,11.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.375000,-1.535000,11.625000>}
box{<0,0,-0.127000><0.125000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.250000,-1.535000,11.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.375000,0.000000,13.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.375000,0.000000,11.625000>}
box{<0,0,-0.127000><1.375000,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.375000,0.000000,11.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,13.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.375000,0.000000,13.000000>}
box{<0,0,-0.127000><0.883883,0.035000,0.127000> rotate<0,44.997030,0> translate<29.750000,0.000000,13.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.375000,0.000000,36.375000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.428956,0.000000,38.428956>}
box{<0,0,-0.127000><2.904733,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.375000,0.000000,36.375000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.450000,0.000000,30.550000>}
box{<0,0,-0.127000><0.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.750000,0.000000,30.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.500000,0.000000,17.750000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<29.750000,0.000000,18.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,0.000000,20.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.500000,0.000000,21.250000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.500000,0.000000,20.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.450000,0.000000,30.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.500000,0.000000,30.500000>}
box{<0,0,-0.127000><0.070711,0.035000,0.127000> rotate<0,44.997030,0> translate<30.450000,0.000000,30.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.500000,-1.535000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.500000,-1.535000,30.500000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,-90.000000,0> translate<30.500000,-1.535000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.428956,0.000000,38.428956>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.748956,0.000000,38.053956>}
box{<0,0,-0.127000><0.492976,0.035000,0.127000> rotate<0,49.521500,0> translate<30.428956,0.000000,38.428956> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,0.000000,10.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.850000,0.000000,10.750000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500000,0.000000,10.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.750000,-1.535000,47.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.875000,-1.535000,43.125000>}
box{<0,0,-0.127000><5.833631,0.035000,0.127000> rotate<0,44.997030,0> translate<26.750000,-1.535000,47.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.750000,0.000000,42.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.987538,0.000000,42.000000>}
box{<0,0,-0.127000><0.237538,0.035000,0.127000> rotate<0,0.000000,0> translate<30.750000,0.000000,42.000000> }
cylinder{<0,0,0><0,0.035000,0>0.100000 translate<30.987538,0.000000,42.000000>}
cylinder{<0,0,0><0,0.035000,0>0.100000 translate<30.987538,0.000000,43.487538>}
box{<0,0,-0.100000><1.487538,0.035000,0.100000> rotate<0,90.000000,0> translate<30.987538,0.000000,43.487538> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,44.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.987538,0.000000,43.512463>}
box{<0,0,-0.127000><1.396589,0.035000,0.127000> rotate<0,44.997030,0> translate<30.000000,0.000000,44.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.760000,-1.535000,8.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.000000,-1.535000,10.750000>}
box{<0,0,-0.127000><3.167838,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.760000,-1.535000,8.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.000000,-1.535000,15.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.000000,-1.535000,10.750000>}
box{<0,0,-0.127000><4.750000,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.000000,-1.535000,10.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,-1.535000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.000000,-1.535000,15.500000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,44.997030,0> translate<30.000000,-1.535000,16.500000> }
cylinder{<0,0,0><0,0.035000,0>0.100000 translate<30.987538,0.000000,43.487538>}
cylinder{<0,0,0><0,0.035000,0>0.100000 translate<31.000000,0.000000,43.500000>}
box{<0,0,-0.100000><0.017625,0.035000,0.100000> rotate<0,-44.997030,0> translate<30.987538,0.000000,43.487538> }
cylinder{<0,0,0><0,0.035000,0>0.100000 translate<30.987538,0.000000,43.512463>}
cylinder{<0,0,0><0,0.035000,0>0.100000 translate<31.000000,0.000000,43.500000>}
box{<0,0,-0.100000><0.017625,0.035000,0.100000> rotate<0,44.997030,0> translate<30.987538,0.000000,43.512463> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.000000,-1.535000,47.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.125000,-1.535000,43.625000>}
box{<0,0,-0.127000><5.833631,0.035000,0.127000> rotate<0,44.997030,0> translate<27.000000,-1.535000,47.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.750000,0.000000,42.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.200000,0.000000,40.855000>}
box{<0,0,-0.127000><1.230254,0.035000,0.127000> rotate<0,68.539999,0> translate<30.750000,0.000000,42.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.875000,0.000000,34.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.250000,0.000000,33.250000>}
box{<0,0,-0.127000><1.944544,0.035000,0.127000> rotate<0,44.997030,0> translate<29.875000,0.000000,34.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.250000,0.000000,31.839997>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.250000,0.000000,33.250000>}
box{<0,0,-0.127000><1.410003,0.035000,0.127000> rotate<0,90.000000,0> translate<31.250000,0.000000,33.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.300000,-1.535000,2.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.500000,-1.535000,2.450000>}
box{<0,0,-0.127000><0.282843,0.035000,0.127000> rotate<0,-44.997030,0> translate<31.300000,-1.535000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.500000,-1.535000,16.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.500000,-1.535000,2.450000>}
box{<0,0,-0.127000><13.550000,0.035000,0.127000> rotate<0,-90.000000,0> translate<31.500000,-1.535000,2.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,-1.535000,17.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.500000,-1.535000,16.000000>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,44.997030,0> translate<30.000000,-1.535000,17.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,45.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.500000,0.000000,46.500000>}
box{<0,0,-0.127000><1.952562,0.035000,0.127000> rotate<0,-39.802944,0> translate<30.000000,0.000000,45.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,0.000000,16.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,16.750000>}
box{<0,0,-0.127000><1.300000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.250000,0.000000,16.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.750000,0.000000,17.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,17.250000>}
box{<0,0,-0.127000><1.800000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.750000,0.000000,17.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.500000,0.000000,17.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,17.750000>}
box{<0,0,-0.127000><1.050000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.500000,0.000000,17.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.500000,0.000000,21.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,21.250000>}
box{<0,0,-0.127000><1.050000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.500000,0.000000,21.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.500000,0.000000,21.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,21.750000>}
box{<0,0,-0.127000><2.050000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.500000,0.000000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.000000,0.000000,22.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,22.750000>}
box{<0,0,-0.127000><2.550000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.000000,0.000000,22.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,0.000000,23.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,23.250000>}
box{<0,0,-0.127000><1.300000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.250000,0.000000,23.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.875000,0.000000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.625000,0.000000,44.250000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<30.875000,0.000000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.625000,0.000000,43.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.625000,0.000000,44.250000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,90.000000,0> translate<31.625000,0.000000,44.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.250000,0.000000,31.839997>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.748956,0.000000,31.341041>}
box{<0,0,-0.127000><0.705631,0.035000,0.127000> rotate<0,44.997030,0> translate<31.250000,0.000000,31.839997> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.000000,-1.535000,16.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.000000,-1.535000,4.090000>}
box{<0,0,-0.127000><12.410000,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.000000,-1.535000,4.090000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,0.000000,4.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.000000,0.000000,4.450000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.000000,0.000000,4.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.000000,0.000000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.000000,0.000000,6.550000>}
box{<0,0,-0.127000><1.350000,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.000000,0.000000,6.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.850000,0.000000,10.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.000000,0.000000,9.600000>}
box{<0,0,-0.127000><1.626346,0.035000,0.127000> rotate<0,44.997030,0> translate<30.850000,0.000000,10.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,-1.535000,18.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.000000,-1.535000,16.500000>}
box{<0,0,-0.127000><2.828427,0.035000,0.127000> rotate<0,44.997030,0> translate<30.000000,-1.535000,18.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.625000,0.000000,34.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.078247,0.000000,36.828247>}
box{<0,0,-0.127000><3.297380,0.035000,0.127000> rotate<0,-41.924061,0> translate<29.625000,0.000000,34.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.500000,-1.535000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.250000,-1.535000,32.750000>}
box{<0,0,-0.127000><2.474874,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.500000,-1.535000,31.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.250000,0.000000,34.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.250000,0.000000,32.750000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<32.250000,0.000000,32.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.625000,0.000000,43.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.375000,0.000000,42.250000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<31.625000,0.000000,43.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.250000,-1.535000,32.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.500000,-1.535000,32.750000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.250000,-1.535000,32.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.000000,0.000000,49.250000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.540000,0.000000,49.250000>}
box{<0,0,-0.203200><13.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<19.000000,0.000000,49.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,17.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.750000,0.000000,17.750000>}
box{<0,0,-0.127000><1.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.750000,0.000000,17.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.750000,0.000000,43.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.750000,0.000000,44.250000>}
box{<0,0,-0.127000><1.250000,0.035000,0.127000> rotate<0,90.000000,0> translate<32.750000,0.000000,44.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,18.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.000000,0.000000,18.250000>}
box{<0,0,-0.127000><1.450000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,18.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,17.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.250000,0.000000,17.250000>}
box{<0,0,-0.127000><1.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.750000,0.000000,17.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,18.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.250000,0.000000,18.750000>}
box{<0,0,-0.127000><1.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,18.750000> }
cylinder{<0,0,0><0,0.035000,0>0.100000 translate<31.951041,0.000000,39.256041>}
cylinder{<0,0,0><0,0.035000,0>0.100000 translate<33.300000,0.000000,40.605000>}
box{<0,0,-0.100000><1.907717,0.035000,0.100000> rotate<0,-44.997030,0> translate<31.951041,0.000000,39.256041> }
cylinder{<0,0,0><0,0.035000,0>0.100000 translate<33.300000,0.000000,40.855000>}
cylinder{<0,0,0><0,0.035000,0>0.100000 translate<33.300000,0.000000,40.605000>}
box{<0,0,-0.100000><0.250000,0.035000,0.100000> rotate<0,-90.000000,0> translate<33.300000,0.000000,40.605000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.421750,0.000000,38.171750>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.421750,0.000000,38.296750>}
box{<0,0,-0.127000><0.125000,0.035000,0.127000> rotate<0,90.000000,0> translate<33.421750,0.000000,38.296750> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.951041,0.000000,30.138956>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.493884,0.000000,30.681800>}
box{<0,0,-0.127000><0.767697,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.951041,0.000000,30.138956> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,19.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.500000,0.000000,19.250000>}
box{<0,0,-0.127000><1.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,19.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.750000,0.000000,43.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.500000,0.000000,42.250000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<32.750000,0.000000,43.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.250000,0.000000,34.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.578247,0.000000,35.328247>}
box{<0,0,-0.127000><1.878425,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.250000,0.000000,34.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,0.000000,16.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.750000,0.000000,16.750000>}
box{<0,0,-0.127000><2.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.750000,0.000000,16.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,19.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.750000,0.000000,19.750000>}
box{<0,0,-0.127000><2.200000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,19.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.875000,-1.535000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.830000,-1.535000,45.000000>}
box{<0,0,-0.127000><2.955000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.875000,-1.535000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.000000,-1.535000,4.090000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.840000,-1.535000,2.250000>}
box{<0,0,-0.127000><2.602153,0.035000,0.127000> rotate<0,44.997030,0> translate<32.000000,-1.535000,4.090000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,20.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.000000,0.000000,20.250000>}
box{<0,0,-0.127000><2.450000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,20.250000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.540000,0.000000,49.250000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.040000,0.000000,47.750000>}
box{<0,0,-0.203200><2.121320,0.035000,0.203200> rotate<0,44.997030,0> translate<32.540000,0.000000,49.250000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.000000,0.000000,47.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.040000,0.000000,47.750000>}
box{<0,0,-0.203200><0.040000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.000000,0.000000,47.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,20.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.250000,0.000000,20.750000>}
box{<0,0,-0.127000><2.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,20.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.421750,0.000000,38.296750>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.250000,0.000000,39.125000>}
box{<0,0,-0.127000><1.171322,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.421750,0.000000,38.296750> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.493884,0.000000,30.681800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.431800,0.000000,30.681800>}
box{<0,0,-0.127000><0.937916,0.035000,0.127000> rotate<0,0.000000,0> translate<33.493884,0.000000,30.681800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,21.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.500000,0.000000,21.250000>}
box{<0,0,-0.127000><2.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,21.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,22.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.500000,0.000000,22.750000>}
box{<0,0,-0.127000><2.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,22.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.125000,-1.535000,34.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.625000,-1.535000,38.750000>}
box{<0,0,-0.127000><6.363961,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.125000,-1.535000,34.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.250000,0.000000,39.125000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.625000,0.000000,38.750000>}
box{<0,0,-0.127000><0.530330,0.035000,0.127000> rotate<0,44.997030,0> translate<34.250000,0.000000,39.125000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,21.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.750000,0.000000,21.750000>}
box{<0,0,-0.127000><3.200000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,23.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.750000,0.000000,23.250000>}
box{<0,0,-0.127000><3.200000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,23.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.421750,0.000000,38.171750>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.921750,0.000000,36.671750>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,44.997030,0> translate<33.421750,0.000000,38.171750> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,22.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.000000,0.000000,22.250000>}
box{<0,0,-0.127000><3.450000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,22.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,23.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.000000,0.000000,23.750000>}
box{<0,0,-0.127000><3.450000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,23.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.068197,0.000000,31.706144>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.068197,0.000000,31.318197>}
box{<0,0,-0.127000><0.387947,0.035000,0.127000> rotate<0,-90.000000,0> translate<35.068197,0.000000,31.318197> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.994209,0.000000,32.780131>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.068197,0.000000,31.706144>}
box{<0,0,-0.127000><1.518848,0.035000,0.127000> rotate<0,44.997030,0> translate<33.994209,0.000000,32.780131> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.190000,0.000000,43.060000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.190000,0.000000,42.290000>}
box{<0,0,-0.127000><0.770000,0.035000,0.127000> rotate<0,-90.000000,0> translate<35.190000,0.000000,42.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.500000,0.000000,46.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.190000,0.000000,43.060000>}
box{<0,0,-0.127000><5.044770,0.035000,0.127000> rotate<0,42.989017,0> translate<31.500000,0.000000,46.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,24.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.250000,0.000000,24.250000>}
box{<0,0,-0.127000><3.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,24.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,24.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.500000,0.000000,24.750000>}
box{<0,0,-0.127000><3.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.500000,0.000000,28.750000>}
box{<0,0,-0.127000><3.950000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,-1.535000,29.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.500000,-1.535000,29.250000>}
box{<0,0,-0.127000><5.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.250000,-1.535000,29.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.750000,-1.535000,44.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.620000,-1.535000,44.250000>}
box{<0,0,-0.127000><2.870000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.750000,-1.535000,44.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,28.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.000000,0.000000,28.250000>}
box{<0,0,-0.127000><4.450000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,28.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.380000,0.000000,14.870000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.380000,0.000000,2.250000>}
box{<0,0,-0.127000><12.620000,0.035000,0.127000> rotate<0,-90.000000,0> translate<36.380000,0.000000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.000000,0.000000,18.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.380000,0.000000,14.870000>}
box{<0,0,-0.127000><4.780042,0.035000,0.127000> rotate<0,44.997030,0> translate<33.000000,0.000000,18.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.500000,0.000000,24.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.500000,0.000000,23.750000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,44.997030,0> translate<35.500000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,27.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.580000,0.000000,27.750000>}
box{<0,0,-0.127000><5.030000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,27.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.830000,-1.535000,45.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.580000,-1.535000,47.750000>}
box{<0,0,-0.127000><3.889087,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.830000,-1.535000,45.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.500000,-1.535000,32.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.625000,-1.535000,36.875000>}
box{<0,0,-0.127000><5.833631,0.035000,0.127000> rotate<0,-44.997030,0> translate<32.500000,-1.535000,32.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.040000,0.000000,47.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.640000,0.000000,45.150000>}
box{<0,0,-0.203200><3.676955,0.035000,0.203200> rotate<0,44.997030,0> translate<34.040000,0.000000,47.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.068197,0.000000,31.318197>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.681803,0.000000,31.318197>}
box{<0,0,-0.127000><1.613606,0.035000,0.127000> rotate<0,0.000000,0> translate<35.068197,0.000000,31.318197> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.500000,-1.535000,29.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.750000,-1.535000,30.500000>}
box{<0,0,-0.127000><1.767767,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.500000,-1.535000,29.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.681803,0.000000,31.318197>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.750000,0.000000,31.250000>}
box{<0,0,-0.127000><0.096445,0.035000,0.127000> rotate<0,44.997030,0> translate<36.681803,0.000000,31.318197> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.750000,-1.535000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.750000,-1.535000,31.250000>}
box{<0,0,-0.127000><0.750000,0.035000,0.127000> rotate<0,90.000000,0> translate<36.750000,-1.535000,31.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.640000,0.000000,45.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.115000,0.000000,45.150000>}
box{<0,0,-0.127000><0.475000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.640000,0.000000,45.150000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.115000,0.000000,45.150000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.125000,0.000000,45.140000>}
box{<0,0,-0.203200><0.014142,0.035000,0.203200> rotate<0,44.997030,0> translate<37.115000,0.000000,45.150000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.125000,0.000000,44.250000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.125000,0.000000,45.140000>}
box{<0,0,-0.203200><0.890000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.125000,0.000000,45.140000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.125000,-1.535000,43.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.535000,-1.535000,43.625000>}
box{<0,0,-0.127000><6.410000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.125000,-1.535000,43.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.000000,-1.535000,22.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.750000,-1.535000,30.500000>}
box{<0,0,-0.127000><10.960155,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.000000,-1.535000,22.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.375000,-1.535000,42.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.750000,-1.535000,36.875000>}
box{<0,0,-0.127000><7.601398,0.035000,0.127000> rotate<0,44.997030,0> translate<32.375000,-1.535000,42.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.750000,-1.535000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.750000,-1.535000,36.875000>}
box{<0,0,-0.127000><6.375000,0.035000,0.127000> rotate<0,90.000000,0> translate<37.750000,-1.535000,36.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.125000,0.000000,44.250000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.875000,0.000000,43.500000>}
box{<0,0,-0.203200><1.060660,0.035000,0.203200> rotate<0,44.997030,0> translate<37.125000,0.000000,44.250000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.875000,0.000000,41.375000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.875000,0.000000,43.500000>}
box{<0,0,-0.203200><2.125000,0.035000,0.203200> rotate<0,90.000000,0> translate<37.875000,0.000000,43.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.250000,0.000000,24.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.290000,0.000000,21.210000>}
box{<0,0,-0.127000><4.299209,0.035000,0.127000> rotate<0,44.997030,0> translate<35.250000,0.000000,24.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.190000,0.000000,42.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.605000,0.000000,38.875000>}
box{<0,0,-0.127000><4.829539,0.035000,0.127000> rotate<0,44.997030,0> translate<35.190000,0.000000,42.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,27.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.620000,0.000000,27.250000>}
box{<0,0,-0.127000><7.070000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,27.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.625000,0.000000,36.875000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.625000,0.000000,38.875000>}
box{<0,0,-0.127000><2.828427,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.625000,0.000000,36.875000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.605000,0.000000,38.875000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.625000,0.000000,38.875000>}
box{<0,0,-0.127000><0.020000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.605000,0.000000,38.875000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.250000,-1.535000,22.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.750000,-1.535000,30.500000>}
box{<0,0,-0.127000><12.020815,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.250000,-1.535000,22.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.500000,-1.535000,42.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.750000,-1.535000,37.000000>}
box{<0,0,-0.127000><7.424621,0.035000,0.127000> rotate<0,44.997030,0> translate<33.500000,-1.535000,42.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.750000,-1.535000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.750000,-1.535000,37.000000>}
box{<0,0,-0.127000><6.500000,0.035000,0.127000> rotate<0,90.000000,0> translate<38.750000,-1.535000,37.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.329075,0.000000,35.079075>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.829075,0.000000,35.079075>}
box{<0,0,-0.127000><2.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.329075,0.000000,35.079075> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.920000,0.000000,13.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.920000,0.000000,2.250000>}
box{<0,0,-0.127000><10.830000,0.035000,0.127000> rotate<0,-90.000000,0> translate<38.920000,0.000000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.250000,0.000000,18.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.920000,0.000000,13.080000>}
box{<0,0,-0.127000><8.018591,0.035000,0.127000> rotate<0,44.997030,0> translate<33.250000,0.000000,18.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.015000,0.000000,45.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.040000,0.000000,45.125000>}
box{<0,0,-0.127000><0.035355,0.035000,0.127000> rotate<0,44.997030,0> translate<39.015000,0.000000,45.150000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.015000,0.000000,45.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.060000,0.000000,45.150000>}
box{<0,0,-0.127000><0.045000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.015000,0.000000,45.150000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.620000,-1.535000,44.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.120000,-1.535000,47.750000>}
box{<0,0,-0.127000><4.949747,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.620000,-1.535000,44.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.040000,0.000000,45.125000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.250000,0.000000,45.125000>}
box{<0,0,-0.127000><0.210000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.040000,0.000000,45.125000> }
cylinder{<0,0,0><0,0.035000,0>0.100000 translate<39.015000,0.000000,45.150000>}
cylinder{<0,0,0><0,0.035000,0>0.100000 translate<39.310000,0.000000,45.195000>}
box{<0,0,-0.100000><0.298412,0.035000,0.100000> rotate<0,-8.672602,0> translate<39.015000,0.000000,45.150000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.875000,-1.535000,43.125000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.575000,-1.535000,43.125000>}
box{<0,0,-0.127000><8.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.875000,-1.535000,43.125000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<37.875000,0.000000,41.375000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.625000,0.000000,39.625000>}
box{<0,0,-0.203200><2.474874,0.035000,0.203200> rotate<0,44.997030,0> translate<37.875000,0.000000,41.375000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.829075,0.000000,35.079075>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.750000,0.000000,36.000000>}
box{<0,0,-0.127000><1.302385,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.829075,0.000000,35.079075> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.250000,0.000000,45.125000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.050000,0.000000,44.325000>}
box{<0,0,-0.127000><1.131371,0.035000,0.127000> rotate<0,44.997030,0> translate<39.250000,0.000000,45.125000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.000000,0.000000,23.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.080000,0.000000,18.670000>}
box{<0,0,-0.127000><7.184205,0.035000,0.127000> rotate<0,44.997030,0> translate<35.000000,0.000000,23.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.750000,0.000000,23.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.375000,0.000000,17.625000>}
box{<0,0,-0.127000><7.954951,0.035000,0.127000> rotate<0,44.997030,0> translate<34.750000,0.000000,23.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.050000,0.000000,44.325000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.590000,0.000000,43.785000>}
box{<0,0,-0.127000><0.763675,0.035000,0.127000> rotate<0,44.997030,0> translate<40.050000,0.000000,44.325000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.590000,0.000000,42.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.590000,0.000000,43.785000>}
box{<0,0,-0.127000><1.495000,0.035000,0.127000> rotate<0,90.000000,0> translate<40.590000,0.000000,43.785000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.750000,0.000000,36.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.625000,0.000000,36.855000>}
box{<0,0,-0.127000><1.223376,0.035000,0.127000> rotate<0,-44.334724,0> translate<39.750000,0.000000,36.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.526972,0.000000,37.131972>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.625000,0.000000,36.855000>}
box{<0,0,-0.127000><0.293808,0.035000,0.127000> rotate<0,70.505045,0> translate<40.526972,0.000000,37.131972> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,26.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.660000,0.000000,26.750000>}
box{<0,0,-0.127000><9.110000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,26.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.375000,0.000000,17.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.000000,0.000000,17.625000>}
box{<0,0,-0.127000><0.625000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.375000,0.000000,17.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.000000,0.000000,17.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.000000,0.000000,17.625000>}
box{<0,0,-0.127000><0.125000,0.035000,0.127000> rotate<0,90.000000,0> translate<41.000000,0.000000,17.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.000000,0.000000,22.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.120000,0.000000,16.130000>}
box{<0,0,-0.127000><8.654987,0.035000,0.127000> rotate<0,44.997030,0> translate<35.000000,0.000000,22.250000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.750000,-1.535000,20.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.125000,-1.535000,19.625000>}
box{<0,0,-0.203200><0.530330,0.035000,0.203200> rotate<0,44.997030,0> translate<40.750000,-1.535000,20.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.125000,-1.535000,19.875000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.125000,-1.535000,19.625000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<41.125000,-1.535000,19.625000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.000000,0.000000,17.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.250000,0.000000,17.250000>}
box{<0,0,-0.203200><0.353553,0.035000,0.203200> rotate<0,44.997030,0> translate<41.000000,0.000000,17.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.250000,-1.535000,19.500000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.250000,-1.535000,17.250000>}
box{<0,0,-0.203200><2.250000,0.035000,0.203200> rotate<0,-90.000000,0> translate<41.250000,-1.535000,17.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.125000,-1.535000,19.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.250000,-1.535000,19.500000>}
box{<0,0,-0.127000><0.176777,0.035000,0.127000> rotate<0,44.997030,0> translate<41.125000,-1.535000,19.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.460000,0.000000,11.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.460000,0.000000,2.250000>}
box{<0,0,-0.127000><9.040000,0.035000,0.127000> rotate<0,-90.000000,0> translate<41.460000,0.000000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.500000,0.000000,19.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.460000,0.000000,11.290000>}
box{<0,0,-0.127000><11.257140,0.035000,0.127000> rotate<0,44.997030,0> translate<33.500000,0.000000,19.250000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.625000,0.000000,39.625000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.500000,0.000000,39.625000>}
box{<0,0,-0.203200><1.875000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.625000,0.000000,39.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.535000,-1.535000,43.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.660000,-1.535000,47.750000>}
box{<0,0,-0.127000><5.833631,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.535000,-1.535000,43.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.060000,0.000000,45.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.660000,0.000000,47.750000>}
box{<0,0,-0.127000><3.676955,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.060000,0.000000,45.150000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.660000,0.000000,47.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.675000,0.000000,47.735000>}
box{<0,0,-0.127000><0.021213,0.035000,0.127000> rotate<0,44.997030,0> translate<41.660000,0.000000,47.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.000000,0.000000,17.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.175000,0.000000,17.625000>}
box{<0,0,-0.127000><1.175000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.000000,0.000000,17.625000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.500000,0.000000,39.625000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.196975,0.000000,38.928025>}
box{<0,0,-0.203200><0.985671,0.035000,0.203200> rotate<0,44.997030,0> translate<41.500000,0.000000,39.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.175000,0.000000,17.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.300000,0.000000,17.500000>}
box{<0,0,-0.127000><0.176777,0.035000,0.127000> rotate<0,44.997030,0> translate<42.175000,0.000000,17.625000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.750000,0.000000,20.000000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.300000,0.000000,20.000000>}
box{<0,0,-0.203200><1.550000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.750000,0.000000,20.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.196975,0.000000,38.928025>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.323025,0.000000,38.928025>}
box{<0,0,-0.203200><0.126050,0.035000,0.203200> rotate<0,0.000000,0> translate<42.196975,0.000000,38.928025> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.050000,0.000000,44.325000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.445000,0.000000,44.325000>}
box{<0,0,-0.127000><2.395000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.050000,0.000000,44.325000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,26.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.700000,0.000000,26.250000>}
box{<0,0,-0.127000><11.150000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,26.250000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.125000,-1.535000,19.875000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.750000,-1.535000,21.500000>}
box{<0,0,-0.203200><2.298097,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.125000,-1.535000,19.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.750000,-1.535000,38.376050>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.750000,-1.535000,21.500000>}
box{<0,0,-0.203200><16.876050,0.035000,0.203200> rotate<0,-90.000000,0> translate<42.750000,-1.535000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.323025,-1.535000,38.928025>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.750000,-1.535000,38.376050>}
box{<0,0,-0.203200><0.697842,0.035000,0.203200> rotate<0,52.273148,0> translate<42.323025,-1.535000,38.928025> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.750000,0.000000,21.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.910000,0.000000,13.590000>}
box{<0,0,-0.127000><11.539983,0.035000,0.127000> rotate<0,44.997030,0> translate<34.750000,0.000000,21.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.000000,0.000000,9.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.000000,0.000000,2.250000>}
box{<0,0,-0.127000><7.250000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.000000,0.000000,2.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.750000,0.000000,19.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.000000,0.000000,9.500000>}
box{<0,0,-0.127000><14.495689,0.035000,0.127000> rotate<0,44.997030,0> translate<33.750000,0.000000,19.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.575000,-1.535000,43.125000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.200000,-1.535000,47.750000>}
box{<0,0,-0.127000><6.540738,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.575000,-1.535000,43.125000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.500000,0.000000,21.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.700000,0.000000,11.050000>}
box{<0,0,-0.127000><14.424978,0.035000,0.127000> rotate<0,44.997030,0> translate<34.500000,0.000000,21.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,25.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.740000,0.000000,25.750000>}
box{<0,0,-0.127000><13.190000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,25.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.750000,0.000000,9.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.750000,0.000000,8.470000>}
box{<0,0,-0.127000><1.030000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.750000,0.000000,8.470000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.000000,0.000000,20.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.750000,0.000000,9.500000>}
box{<0,0,-0.127000><15.202796,0.035000,0.127000> rotate<0,44.997030,0> translate<34.000000,0.000000,20.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.500000,0.000000,28.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.000000,0.000000,38.250000>}
box{<0,0,-0.127000><13.435029,0.035000,0.127000> rotate<0,-44.997030,0> translate<35.500000,0.000000,28.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.000000,0.000000,38.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.000000,0.000000,41.250000>}
box{<0,0,-0.127000><3.000000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.000000,0.000000,41.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.200000,0.000000,17.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.250000,0.000000,18.550000>}
box{<0,0,-0.127000><1.484924,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.200000,0.000000,17.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.080000,0.000000,18.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.250000,0.000000,18.670000>}
box{<0,0,-0.127000><5.170000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.080000,0.000000,18.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.250000,0.000000,18.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.250000,0.000000,18.670000>}
box{<0,0,-0.127000><0.120000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.250000,0.000000,18.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.290000,0.000000,21.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.410000,0.000000,21.210000>}
box{<0,0,-0.127000><7.120000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.290000,0.000000,21.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.200000,0.000000,20.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.410000,0.000000,21.210000>}
box{<0,0,-0.127000><1.711198,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.200000,0.000000,20.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.000000,0.000000,28.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.750000,0.000000,38.000000>}
box{<0,0,-0.127000><13.788582,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.000000,0.000000,28.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.750000,0.000000,38.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.750000,0.000000,39.460000>}
box{<0,0,-0.127000><1.460000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.750000,0.000000,39.460000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.250000,0.000000,20.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.490000,0.000000,8.510000>}
box{<0,0,-0.127000><17.309974,0.035000,0.127000> rotate<0,44.997030,0> translate<34.250000,0.000000,20.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.550000,0.000000,25.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.780000,0.000000,25.250000>}
box{<0,0,-0.127000><15.230000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.550000,0.000000,25.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.750000,0.000000,8.470000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.250000,0.000000,5.970000>}
box{<0,0,-0.127000><3.535534,0.035000,0.127000> rotate<0,44.997030,0> translate<44.750000,0.000000,8.470000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.250000,0.000000,5.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,5.970000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.250000,0.000000,5.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.490000,0.000000,8.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,8.510000>}
box{<0,0,-0.127000><1.260000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.490000,0.000000,8.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.700000,0.000000,11.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,11.050000>}
box{<0,0,-0.127000><3.050000,0.035000,0.127000> rotate<0,0.000000,0> translate<44.700000,0.000000,11.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.910000,0.000000,13.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,13.590000>}
box{<0,0,-0.127000><4.840000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.910000,0.000000,13.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.120000,0.000000,16.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,16.130000>}
box{<0,0,-0.127000><6.630000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.120000,0.000000,16.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.250000,0.000000,18.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,18.670000>}
box{<0,0,-0.127000><2.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.250000,0.000000,18.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.410000,0.000000,21.210000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,21.210000>}
box{<0,0,-0.127000><2.340000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.410000,0.000000,21.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.500000,0.000000,23.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,23.750000>}
box{<0,0,-0.127000><11.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.500000,0.000000,23.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.500000,0.000000,23.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,23.750000>}
box{<0,0,-0.127000><0.250000,0.035000,0.127000> rotate<0,0.000000,0> translate<47.500000,0.000000,23.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.780000,0.000000,25.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,26.220000>}
box{<0,0,-0.127000><1.371787,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.780000,0.000000,25.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.740000,0.000000,25.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,28.760000>}
box{<0,0,-0.127000><4.256783,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.740000,0.000000,25.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.700000,0.000000,26.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,31.300000>}
box{<0,0,-0.127000><7.141778,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.700000,0.000000,26.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.660000,0.000000,26.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,33.840000>}
box{<0,0,-0.127000><10.026774,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.660000,0.000000,26.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.620000,0.000000,27.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,36.380000>}
box{<0,0,-0.127000><12.911770,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.620000,0.000000,27.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.580000,0.000000,27.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,38.920000>}
box{<0,0,-0.127000><15.796765,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.580000,0.000000,27.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.750000,0.000000,39.460000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,41.460000>}
box{<0,0,-0.127000><2.828427,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.750000,0.000000,39.460000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.000000,0.000000,41.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.750000,0.000000,44.000000>}
box{<0,0,-0.127000><3.889087,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.000000,0.000000,41.250000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-4.125000,-1.535000,51.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-3.750000,-1.535000,-1.500000>}
box{<0,0,-0.127000><53.126324,0.035000,0.127000> rotate<0,89.589653,0> translate<-4.125000,-1.535000,51.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-4.125000,-1.535000,51.625000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.500000,-1.535000,51.750000>}
box{<0,0,-0.127000><56.625138,0.035000,0.127000> rotate<0,-0.126472,0> translate<-4.125000,-1.535000,51.625000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-3.750000,-1.535000,-1.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.250000,-1.535000,-1.500000>}
box{<0,0,-0.127000><57.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<-3.750000,-1.535000,-1.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-1.500000,0.000000,-1.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-1.250000,0.000000,52.375000>}
box{<0,0,-0.127000><53.625583,0.035000,0.127000> rotate<0,-89.726967,0> translate<-1.500000,0.000000,-1.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-1.500000,0.000000,-1.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.000000,0.000000,-1.250000>}
box{<0,0,-0.127000><53.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<-1.500000,0.000000,-1.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<-1.250000,0.000000,52.375000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.375000,0.000000,51.875000>}
box{<0,0,-0.127000><53.627331,0.035000,0.127000> rotate<0,0.534176,0> translate<-1.250000,0.000000,52.375000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.000000,0.000000,-1.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.375000,0.000000,51.875000>}
box{<0,0,-0.127000><53.126324,0.035000,0.127000> rotate<0,-89.589653,0> translate<52.000000,0.000000,-1.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.500000,-1.535000,51.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.250000,-1.535000,-1.500000>}
box{<0,0,-0.127000><53.255281,0.035000,0.127000> rotate<0,89.187184,0> translate<52.500000,-1.535000,51.750000> }
texture{col_pol}
}
#end
union{
cylinder{<42.323025,0.038000,38.928025><42.323025,-1.538000,38.928025>0.457200}
cylinder{<40.526972,0.038000,37.131972><40.526972,-1.538000,37.131972>0.457200}
cylinder{<2.250000,0.038000,26.250000><2.250000,-1.538000,26.250000>0.508000}
cylinder{<2.250000,0.038000,28.790000><2.250000,-1.538000,28.790000>0.508000}
cylinder{<2.250000,0.038000,31.330000><2.250000,-1.538000,31.330000>0.508000}
cylinder{<2.250000,0.038000,33.870000><2.250000,-1.538000,33.870000>0.508000}
cylinder{<2.250000,0.038000,36.410000><2.250000,-1.538000,36.410000>0.508000}
cylinder{<2.250000,0.038000,38.950000><2.250000,-1.538000,38.950000>0.508000}
cylinder{<2.250000,0.038000,41.490000><2.250000,-1.538000,41.490000>0.508000}
cylinder{<2.250000,0.038000,44.030000><2.250000,-1.538000,44.030000>0.508000}
cylinder{<16.625000,0.038000,42.750000><16.625000,-1.538000,42.750000>0.508000}
cylinder{<16.625000,0.038000,45.290000><16.625000,-1.538000,45.290000>0.508000}
cylinder{<16.625000,0.038000,47.830000><16.625000,-1.538000,47.830000>0.508000}
cylinder{<31.500000,0.038000,47.750000><31.500000,-1.538000,47.750000>0.508000}
cylinder{<34.040000,0.038000,47.750000><34.040000,-1.538000,47.750000>0.508000}
cylinder{<36.580000,0.038000,47.750000><36.580000,-1.538000,47.750000>0.508000}
cylinder{<39.120000,0.038000,47.750000><39.120000,-1.538000,47.750000>0.508000}
cylinder{<41.660000,0.038000,47.750000><41.660000,-1.538000,47.750000>0.508000}
cylinder{<44.200000,0.038000,47.750000><44.200000,-1.538000,47.750000>0.508000}
cylinder{<23.750000,0.038000,2.250000><23.750000,-1.538000,2.250000>0.508000}
cylinder{<21.210000,0.038000,2.250000><21.210000,-1.538000,2.250000>0.508000}
cylinder{<18.670000,0.038000,2.250000><18.670000,-1.538000,2.250000>0.508000}
cylinder{<16.130000,0.038000,2.250000><16.130000,-1.538000,2.250000>0.508000}
cylinder{<13.590000,0.038000,2.250000><13.590000,-1.538000,2.250000>0.508000}
cylinder{<11.050000,0.038000,2.250000><11.050000,-1.538000,2.250000>0.508000}
cylinder{<8.510000,0.038000,2.250000><8.510000,-1.538000,2.250000>0.508000}
cylinder{<5.970000,0.038000,2.250000><5.970000,-1.538000,2.250000>0.508000}
cylinder{<44.000000,0.038000,2.250000><44.000000,-1.538000,2.250000>0.508000}
cylinder{<41.460000,0.038000,2.250000><41.460000,-1.538000,2.250000>0.508000}
cylinder{<38.920000,0.038000,2.250000><38.920000,-1.538000,2.250000>0.508000}
cylinder{<36.380000,0.038000,2.250000><36.380000,-1.538000,2.250000>0.508000}
cylinder{<33.840000,0.038000,2.250000><33.840000,-1.538000,2.250000>0.508000}
cylinder{<31.300000,0.038000,2.250000><31.300000,-1.538000,2.250000>0.508000}
cylinder{<28.760000,0.038000,2.250000><28.760000,-1.538000,2.250000>0.508000}
cylinder{<26.220000,0.038000,2.250000><26.220000,-1.538000,2.250000>0.508000}
cylinder{<47.750000,0.038000,23.750000><47.750000,-1.538000,23.750000>0.508000}
cylinder{<47.750000,0.038000,21.210000><47.750000,-1.538000,21.210000>0.508000}
cylinder{<47.750000,0.038000,18.670000><47.750000,-1.538000,18.670000>0.508000}
cylinder{<47.750000,0.038000,16.130000><47.750000,-1.538000,16.130000>0.508000}
cylinder{<47.750000,0.038000,13.590000><47.750000,-1.538000,13.590000>0.508000}
cylinder{<47.750000,0.038000,11.050000><47.750000,-1.538000,11.050000>0.508000}
cylinder{<47.750000,0.038000,8.510000><47.750000,-1.538000,8.510000>0.508000}
cylinder{<47.750000,0.038000,5.970000><47.750000,-1.538000,5.970000>0.508000}
cylinder{<47.750000,0.038000,44.000000><47.750000,-1.538000,44.000000>0.508000}
cylinder{<47.750000,0.038000,41.460000><47.750000,-1.538000,41.460000>0.508000}
cylinder{<47.750000,0.038000,38.920000><47.750000,-1.538000,38.920000>0.508000}
cylinder{<47.750000,0.038000,36.380000><47.750000,-1.538000,36.380000>0.508000}
cylinder{<47.750000,0.038000,33.840000><47.750000,-1.538000,33.840000>0.508000}
cylinder{<47.750000,0.038000,31.300000><47.750000,-1.538000,31.300000>0.508000}
cylinder{<47.750000,0.038000,28.760000><47.750000,-1.538000,28.760000>0.508000}
cylinder{<47.750000,0.038000,26.220000><47.750000,-1.538000,26.220000>0.508000}
cylinder{<6.000000,0.038000,47.750000><6.000000,-1.538000,47.750000>0.508000}
cylinder{<8.540000,0.038000,47.750000><8.540000,-1.538000,47.750000>0.508000}
cylinder{<11.080000,0.038000,47.750000><11.080000,-1.538000,47.750000>0.508000}
cylinder{<13.620000,0.038000,47.750000><13.620000,-1.538000,47.750000>0.508000}
cylinder{<2.250000,0.038000,6.000000><2.250000,-1.538000,6.000000>0.508000}
cylinder{<2.250000,0.038000,8.540000><2.250000,-1.538000,8.540000>0.508000}
cylinder{<2.250000,0.038000,11.080000><2.250000,-1.538000,11.080000>0.508000}
cylinder{<2.250000,0.038000,13.620000><2.250000,-1.538000,13.620000>0.508000}
cylinder{<2.250000,0.038000,16.160000><2.250000,-1.538000,16.160000>0.508000}
cylinder{<2.250000,0.038000,18.700000><2.250000,-1.538000,18.700000>0.508000}
cylinder{<2.250000,0.038000,21.240000><2.250000,-1.538000,21.240000>0.508000}
cylinder{<2.250000,0.038000,23.780000><2.250000,-1.538000,23.780000>0.508000}
cylinder{<8.550000,0.038000,22.290000><8.550000,-1.538000,22.290000>0.406400}
cylinder{<8.550000,0.038000,24.830000><8.550000,-1.538000,24.830000>0.406400}
cylinder{<27.663000,0.038000,35.500000><27.663000,-1.538000,35.500000>0.406400}
cylinder{<22.837000,0.038000,35.500000><22.837000,-1.538000,35.500000>0.406400}
cylinder{<26.700000,0.038000,44.000000><26.700000,-1.538000,44.000000>0.450000 }
cylinder{<22.300000,0.038000,44.000000><22.300000,-1.538000,44.000000>0.450000 }
cylinder{<26.700000,0.038000,44.000000><26.700000,-1.538000,44.000000>0.450000 }
cylinder{<22.300000,0.038000,44.000000><22.300000,-1.538000,44.000000>0.450000 }
cylinder{<26.700000,0.038000,44.000000><26.700000,-1.538000,44.000000>0.450000 }
cylinder{<22.300000,0.038000,44.000000><22.300000,-1.538000,44.000000>0.450000 }
cylinder{<26.700000,0.038000,44.000000><26.700000,-1.538000,44.000000>0.450000 }
cylinder{<22.300000,0.038000,44.000000><22.300000,-1.538000,44.000000>0.450000 }
cylinder{<26.700000,0.038000,44.000000><26.700000,-1.538000,44.000000>0.450000 }
cylinder{<22.300000,0.038000,44.000000><22.300000,-1.538000,44.000000>0.450000 }
cylinder{<26.700000,0.038000,44.000000><26.700000,-1.538000,44.000000>0.450000 }
cylinder{<22.300000,0.038000,44.000000><22.300000,-1.538000,44.000000>0.450000 }
cylinder{<26.700000,0.038000,44.000000><26.700000,-1.538000,44.000000>0.450000 }
cylinder{<22.300000,0.038000,44.000000><22.300000,-1.538000,44.000000>0.450000 }
cylinder{<26.700000,0.038000,44.000000><26.700000,-1.538000,44.000000>0.450000 }
cylinder{<22.300000,0.038000,44.000000><22.300000,-1.538000,44.000000>0.450000 }
cylinder{<26.700000,0.038000,44.000000><26.700000,-1.538000,44.000000>0.450000 }
cylinder{<22.300000,0.038000,44.000000><22.300000,-1.538000,44.000000>0.450000 }
//Holes(fast)/Vias
cylinder{<18.000000,0.038000,23.750000><18.000000,-1.538000,23.750000>0.200000 }
cylinder{<25.000000,0.038000,39.500000><25.000000,-1.538000,39.500000>0.200000 }
cylinder{<23.750000,0.038000,39.500000><23.750000,-1.538000,39.500000>0.200000 }
cylinder{<25.500000,0.038000,28.750000><25.500000,-1.538000,28.750000>0.200000 }
cylinder{<19.500000,0.038000,20.000000><19.500000,-1.538000,20.000000>0.200000 }
cylinder{<28.500000,0.038000,24.750000><28.500000,-1.538000,24.750000>0.200000 }
cylinder{<22.500000,0.038000,25.000000><22.500000,-1.538000,25.000000>0.200000 }
cylinder{<32.250000,0.038000,32.750000><32.250000,-1.538000,32.750000>0.200000 }
cylinder{<30.500000,0.038000,30.500000><30.500000,-1.538000,30.500000>0.200000 }
cylinder{<36.625000,0.038000,36.875000><36.625000,-1.538000,36.875000>0.200000 }
cylinder{<13.000000,0.038000,7.750000><13.000000,-1.538000,7.750000>0.200000 }
cylinder{<33.750000,0.038000,15.000000><33.750000,-1.538000,15.000000>0.200000 }
cylinder{<15.750000,0.038000,30.500000><15.750000,-1.538000,30.500000>0.200000 }
cylinder{<22.250000,0.038000,38.250000><22.250000,-1.538000,38.250000>0.200000 }
cylinder{<39.750000,0.038000,34.500000><39.750000,-1.538000,34.500000>0.200000 }
cylinder{<44.000000,0.038000,42.625000><44.000000,-1.538000,42.625000>0.200000 }
cylinder{<39.000000,0.038000,38.875000><39.000000,-1.538000,38.875000>0.200000 }
cylinder{<4.375000,0.038000,45.250000><4.375000,-1.538000,45.250000>0.200000 }
cylinder{<28.500000,0.038000,33.750000><28.500000,-1.538000,33.750000>0.200000 }
cylinder{<30.250000,0.038000,33.000000><30.250000,-1.538000,33.000000>0.200000 }
cylinder{<34.625000,0.038000,38.750000><34.625000,-1.538000,38.750000>0.200000 }
cylinder{<21.750000,0.038000,16.500000><21.750000,-1.538000,16.500000>0.200000 }
cylinder{<17.500000,0.038000,28.000000><17.500000,-1.538000,28.000000>0.200000 }
cylinder{<18.250000,0.038000,27.250000><18.250000,-1.538000,27.250000>0.200000 }
cylinder{<18.000000,0.038000,26.000000><18.000000,-1.538000,26.000000>0.200000 }
cylinder{<17.750000,0.038000,25.000000><17.750000,-1.538000,25.000000>0.200000 }
cylinder{<24.000000,0.038000,16.500000><24.000000,-1.538000,16.500000>0.200000 }
cylinder{<25.000000,0.038000,17.250000><25.000000,-1.538000,17.250000>0.200000 }
cylinder{<26.000000,0.038000,17.500000><26.000000,-1.538000,17.500000>0.200000 }
cylinder{<27.000000,0.038000,17.250000><27.000000,-1.538000,17.250000>0.200000 }
cylinder{<28.000000,0.038000,17.250000><28.000000,-1.538000,17.250000>0.200000 }
cylinder{<29.000000,0.038000,16.750000><29.000000,-1.538000,16.750000>0.200000 }
cylinder{<28.750000,0.038000,12.000000><28.750000,-1.538000,12.000000>0.200000 }
cylinder{<29.625000,0.038000,12.750000><29.625000,-1.538000,12.750000>0.200000 }
cylinder{<30.375000,0.038000,11.625000><30.375000,-1.538000,11.625000>0.200000 }
cylinder{<30.000000,0.038000,16.500000><30.000000,-1.538000,16.500000>0.200000 }
cylinder{<29.500000,0.038000,17.500000><29.500000,-1.538000,17.500000>0.200000 }
cylinder{<29.750000,0.038000,18.500000><29.750000,-1.538000,18.500000>0.200000 }
cylinder{<24.500000,0.038000,28.750000><24.500000,-1.538000,28.750000>0.200000 }
cylinder{<8.000000,0.038000,10.750000><8.000000,-1.538000,10.750000>0.200000 }
cylinder{<8.000000,0.038000,14.000000><8.000000,-1.538000,14.000000>0.200000 }
cylinder{<19.750000,0.038000,33.500000><19.750000,-1.538000,33.500000>0.200000 }
cylinder{<29.500000,0.038000,21.750000><29.500000,-1.538000,21.750000>0.200000 }
cylinder{<33.500000,0.038000,42.250000><33.500000,-1.538000,42.250000>0.200000 }
cylinder{<32.750000,0.038000,44.250000><32.750000,-1.538000,44.250000>0.200000 }
cylinder{<20.750000,0.038000,33.500000><20.750000,-1.538000,33.500000>0.200000 }
cylinder{<29.500000,0.038000,20.250000><29.500000,-1.538000,20.250000>0.200000 }
cylinder{<32.375000,0.038000,42.250000><32.375000,-1.538000,42.250000>0.200000 }
cylinder{<30.875000,0.038000,45.000000><30.875000,-1.538000,45.000000>0.200000 }
cylinder{<26.750000,0.038000,28.750000><26.750000,-1.538000,28.750000>0.200000 }
cylinder{<40.750000,0.038000,20.000000><40.750000,-1.538000,20.000000>0.200000 }
cylinder{<41.250000,0.038000,17.250000><41.250000,-1.538000,17.250000>0.200000 }
cylinder{<23.250000,0.038000,28.750000><23.250000,-1.538000,28.750000>0.200000 }
cylinder{<18.250000,0.038000,18.000000><18.250000,-1.538000,18.000000>0.200000 }
cylinder{<29.750000,0.038000,23.750000><29.750000,-1.538000,23.750000>0.200000 }
cylinder{<20.250000,0.038000,17.250000><20.250000,-1.538000,17.250000>0.200000 }
cylinder{<28.000000,0.038000,20.500000><28.000000,-1.538000,20.500000>0.200000 }
cylinder{<18.750000,0.038000,35.250000><18.750000,-1.538000,35.250000>0.200000 }
cylinder{<27.750000,0.038000,28.750000><27.750000,-1.538000,28.750000>0.200000 }
cylinder{<27.000000,0.038000,32.500000><27.000000,-1.538000,32.500000>0.200000 }
cylinder{<36.750000,0.038000,31.250000><36.750000,-1.538000,31.250000>0.200000 }
cylinder{<29.250000,0.038000,28.750000><29.250000,-1.538000,28.750000>0.200000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.125000,0.000000,12.375000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.125000,0.000000,12.875000>}
box{<0,0,-0.100000><0.500000,0.036000,0.100000> rotate<0,90.000000,0> translate<19.125000,0.000000,12.875000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.125000,0.000000,12.375000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.625000,0.000000,12.375000>}
box{<0,0,-0.100000><0.500000,0.036000,0.100000> rotate<0,0.000000,0> translate<19.125000,0.000000,12.375000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.125000,0.000000,12.375000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.750000,0.000000,13.000000>}
box{<0,0,-0.100000><0.883883,0.036000,0.100000> rotate<0,-44.997030,0> translate<19.125000,0.000000,12.375000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.750000,0.000000,13.000000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<20.000000,0.000000,13.000000>}
box{<0,0,-0.100000><0.250000,0.036000,0.100000> rotate<0,0.000000,0> translate<19.750000,0.000000,13.000000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<28.500000,0.000000,12.500000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<28.500000,0.000000,13.000000>}
box{<0,0,-0.100000><0.500000,0.036000,0.100000> rotate<0,90.000000,0> translate<28.500000,0.000000,13.000000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<28.500000,0.000000,12.500000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<29.000000,0.000000,12.500000>}
box{<0,0,-0.100000><0.500000,0.036000,0.100000> rotate<0,0.000000,0> translate<28.500000,0.000000,12.500000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<28.500000,0.000000,12.500000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<29.125000,0.000000,13.125000>}
box{<0,0,-0.100000><0.883883,0.036000,0.100000> rotate<0,-44.997030,0> translate<28.500000,0.000000,12.500000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<29.125000,0.000000,13.125000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<29.750000,0.000000,13.125000>}
box{<0,0,-0.100000><0.625000,0.036000,0.100000> rotate<0,0.000000,0> translate<29.125000,0.000000,13.125000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.875000,0.000000,35.125000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.500000,0.000000,34.750000>}
box{<0,0,-0.100000><0.530330,0.036000,0.100000> rotate<0,-44.997030,0> translate<40.500000,0.000000,34.750000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.875000,0.000000,35.125000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<41.250000,0.000000,34.750000>}
box{<0,0,-0.100000><0.530330,0.036000,0.100000> rotate<0,44.997030,0> translate<40.875000,0.000000,35.125000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.875000,0.000000,35.125000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.875000,0.000000,33.750000>}
box{<0,0,-0.100000><1.375000,0.036000,0.100000> rotate<0,-90.000000,0> translate<40.875000,0.000000,33.750000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<34.875000,0.000000,40.250000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<35.125000,0.000000,40.000000>}
box{<0,0,-0.100000><0.353553,0.036000,0.100000> rotate<0,44.997030,0> translate<34.875000,0.000000,40.250000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<35.125000,0.000000,40.000000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.500000,0.000000,40.000000>}
box{<0,0,-0.100000><5.375000,0.036000,0.100000> rotate<0,0.000000,0> translate<35.125000,0.000000,40.000000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.500000,0.000000,40.000000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.750000,0.000000,40.250000>}
box{<0,0,-0.100000><0.353553,0.036000,0.100000> rotate<0,-44.997030,0> translate<40.500000,0.000000,40.000000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<34.250000,0.000000,28.875000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<34.750000,0.000000,29.375000>}
box{<0,0,-0.100000><0.707107,0.036000,0.100000> rotate<0,-44.997030,0> translate<34.250000,0.000000,28.875000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<34.750000,0.000000,29.375000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<35.250000,0.000000,28.875000>}
box{<0,0,-0.100000><0.707107,0.036000,0.100000> rotate<0,44.997030,0> translate<34.750000,0.000000,29.375000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<34.750000,0.000000,29.375000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<34.750000,0.000000,27.125000>}
box{<0,0,-0.100000><2.250000,0.036000,0.100000> rotate<0,-90.000000,0> translate<34.750000,0.000000,27.125000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<34.750000,0.000000,27.125000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<35.250000,0.000000,26.625000>}
box{<0,0,-0.100000><0.707107,0.036000,0.100000> rotate<0,44.997030,0> translate<34.750000,0.000000,27.125000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.375000,0.000000,34.125000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.875000,0.000000,34.125000>}
box{<0,0,-0.100000><0.500000,0.036000,0.100000> rotate<0,0.000000,0> translate<19.375000,0.000000,34.125000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.875000,0.000000,34.125000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.875000,0.000000,33.625000>}
box{<0,0,-0.100000><0.500000,0.036000,0.100000> rotate<0,-90.000000,0> translate<19.875000,0.000000,33.625000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.875000,0.000000,34.125000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.250000,0.000000,33.500000>}
box{<0,0,-0.100000><0.883883,0.036000,0.100000> rotate<0,-44.997030,0> translate<19.250000,0.000000,33.500000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<19.250000,0.000000,33.500000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<18.625000,0.000000,33.500000>}
box{<0,0,-0.100000><0.625000,0.036000,0.100000> rotate<0,0.000000,0> translate<18.625000,0.000000,33.500000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.250000,-1.536000,21.000000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.250000,-1.536000,21.500000>}
box{<0,0,-0.100000><0.500000,0.036000,0.100000> rotate<0,90.000000,0> translate<9.250000,-1.536000,21.500000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.250000,-1.536000,21.500000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.750000,-1.536000,21.500000>}
box{<0,0,-0.100000><0.500000,0.036000,0.100000> rotate<0,0.000000,0> translate<9.250000,-1.536000,21.500000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.250000,-1.536000,21.500000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.875000,-1.536000,20.875000>}
box{<0,0,-0.100000><0.883883,0.036000,0.100000> rotate<0,44.997030,0> translate<9.250000,-1.536000,21.500000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.875000,-1.536000,20.875000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<10.500000,-1.536000,20.875000>}
box{<0,0,-0.100000><0.625000,0.036000,0.100000> rotate<0,0.000000,0> translate<9.875000,-1.536000,20.875000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.125000,0.000000,19.625000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.500000,0.000000,19.250000>}
box{<0,0,-0.100000><0.530330,0.036000,0.100000> rotate<0,44.997030,0> translate<40.125000,0.000000,19.625000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.500000,0.000000,19.250000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.125000,0.000000,18.875000>}
box{<0,0,-0.100000><0.530330,0.036000,0.100000> rotate<0,-44.997030,0> translate<40.125000,0.000000,18.875000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<40.500000,0.000000,19.250000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<38.875000,0.000000,19.250000>}
box{<0,0,-0.100000><1.625000,0.036000,0.100000> rotate<0,0.000000,0> translate<38.875000,0.000000,19.250000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.250000,0.000000,21.000000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.250000,0.000000,21.500000>}
box{<0,0,-0.100000><0.500000,0.036000,0.100000> rotate<0,90.000000,0> translate<9.250000,0.000000,21.500000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.250000,0.000000,21.500000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.750000,0.000000,21.500000>}
box{<0,0,-0.100000><0.500000,0.036000,0.100000> rotate<0,0.000000,0> translate<9.250000,0.000000,21.500000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.250000,0.000000,21.500000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.875000,0.000000,20.875000>}
box{<0,0,-0.100000><0.883883,0.036000,0.100000> rotate<0,44.997030,0> translate<9.250000,0.000000,21.500000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<9.875000,0.000000,20.875000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<10.500000,0.000000,20.875000>}
box{<0,0,-0.100000><0.625000,0.036000,0.100000> rotate<0,0.000000,0> translate<9.875000,0.000000,20.875000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<11.125000,0.000000,27.250000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<11.500000,0.000000,26.875000>}
box{<0,0,-0.100000><0.530330,0.036000,0.100000> rotate<0,44.997030,0> translate<11.125000,0.000000,27.250000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<11.500000,0.000000,26.875000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<11.875000,0.000000,27.250000>}
box{<0,0,-0.100000><0.530330,0.036000,0.100000> rotate<0,-44.997030,0> translate<11.500000,0.000000,26.875000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<11.500000,0.000000,26.875000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<11.500000,0.000000,28.000000>}
box{<0,0,-0.100000><1.125000,0.036000,0.100000> rotate<0,90.000000,0> translate<11.500000,0.000000,28.000000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<11.000000,0.000000,25.250000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<11.000000,0.000000,24.750000>}
box{<0,0,-0.100000><0.500000,0.036000,0.100000> rotate<0,-90.000000,0> translate<11.000000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<11.000000,0.000000,24.750000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<10.500000,0.000000,24.750000>}
box{<0,0,-0.100000><0.500000,0.036000,0.100000> rotate<0,0.000000,0> translate<10.500000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<11.000000,0.000000,24.750000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<10.375000,0.000000,25.375000>}
box{<0,0,-0.100000><0.883883,0.036000,0.100000> rotate<0,44.997030,0> translate<10.375000,0.000000,25.375000> }
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<10.375000,0.000000,25.375000>}
cylinder{<0,0,0><0,0.036000,0>0.100000 translate<10.375000,0.000000,28.000000>}
box{<0,0,-0.100000><2.625000,0.036000,0.100000> rotate<0,90.000000,0> translate<10.375000,0.000000,28.000000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.750000,0.000000,40.625000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.375000,0.000000,40.625000>}
box{<0,0,-0.127000><0.625000,0.036000,0.127000> rotate<0,0.000000,0> translate<13.750000,0.000000,40.625000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.375000,0.000000,40.625000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.375000,0.000000,40.000000>}
box{<0,0,-0.127000><0.625000,0.036000,0.127000> rotate<0,-90.000000,0> translate<14.375000,0.000000,40.000000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.375000,0.000000,40.625000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.375000,0.000000,39.625000>}
box{<0,0,-0.127000><1.414214,0.036000,0.127000> rotate<0,-44.997030,0> translate<13.375000,0.000000,39.625000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.375000,0.000000,39.625000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.375000,0.000000,39.500000>}
box{<0,0,-0.127000><0.125000,0.036000,0.127000> rotate<0,-90.000000,0> translate<13.375000,0.000000,39.500000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.750000,-1.536000,43.750000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.250000,-1.536000,43.250000>}
box{<0,0,-0.127000><0.707107,0.036000,0.127000> rotate<0,-44.997030,0> translate<44.250000,-1.536000,43.250000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.250000,-1.536000,43.250000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.375000,-1.536000,43.250000>}
box{<0,0,-0.127000><12.875000,0.036000,0.127000> rotate<0,0.000000,0> translate<31.375000,-1.536000,43.250000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.375000,-1.536000,43.250000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.875000,-1.536000,43.750000>}
box{<0,0,-0.127000><0.707107,0.036000,0.127000> rotate<0,44.997030,0> translate<30.875000,-1.536000,43.750000> }
//ACLK silk screen
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.845000,0.000000,43.125000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.845000,0.000000,43.725000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<41.845000,0.000000,43.725000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.045000,0.000000,43.125000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.045000,0.000000,43.725000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<43.045000,0.000000,43.725000> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.600000,-1.536000,26.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.600000,-1.536000,27.300000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.600000,-1.536000,27.300000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.400000,-1.536000,26.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.400000,-1.536000,27.300000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.400000,-1.536000,27.300000> }
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.900000,-1.536000,27.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.900000,-1.536000,26.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.900000,-1.536000,26.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.100000,-1.536000,27.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.100000,-1.536000,26.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.100000,-1.536000,26.700000> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.650000,-1.536000,19.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.650000,-1.536000,18.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.650000,-1.536000,18.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.850000,-1.536000,19.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.850000,-1.536000,18.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.850000,-1.536000,18.700000> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.350000,-1.536000,18.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.350000,-1.536000,19.300000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<21.350000,-1.536000,19.300000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.150000,-1.536000,18.700000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.150000,-1.536000,19.300000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.150000,-1.536000,19.300000> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.200000,-1.536000,22.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.800000,-1.536000,22.400000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.200000,-1.536000,22.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.200000,-1.536000,23.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.800000,-1.536000,23.600000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.200000,-1.536000,23.600000> }
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.200000,-1.536000,23.900000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.800000,-1.536000,23.900000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.200000,-1.536000,23.900000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.200000,-1.536000,25.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.800000,-1.536000,25.100000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.200000,-1.536000,25.100000> }
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.800000,0.000000,21.900000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.200000,0.000000,21.900000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.200000,0.000000,21.900000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.800000,0.000000,23.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.200000,0.000000,23.100000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.200000,0.000000,23.100000> }
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.800000,0.000000,24.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.200000,0.000000,24.150000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.200000,0.000000,24.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.800000,0.000000,25.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.200000,0.000000,25.350000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.200000,0.000000,25.350000> }
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.900000,-1.536000,27.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.900000,-1.536000,26.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.900000,-1.536000,26.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.100000,-1.536000,27.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.100000,-1.536000,26.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.100000,-1.536000,26.700000> }
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.900000,-1.536000,27.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.900000,-1.536000,26.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.900000,-1.536000,26.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.100000,-1.536000,27.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.100000,-1.536000,26.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.100000,-1.536000,26.700000> }
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.400000,-1.536000,27.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.400000,-1.536000,26.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.400000,-1.536000,26.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.600000,-1.536000,27.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.600000,-1.536000,26.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.600000,-1.536000,26.700000> }
//C13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.600000,0.000000,27.550000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.600000,0.000000,26.950000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.600000,0.000000,26.950000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.400000,0.000000,27.550000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.400000,0.000000,26.950000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.400000,0.000000,26.950000> }
//C14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.300000,-1.536000,23.850000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,-1.536000,23.850000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.700000,-1.536000,23.850000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.300000,-1.536000,22.650000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,-1.536000,22.650000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.700000,-1.536000,22.650000> }
//C15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.050000,-1.536000,34.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.450000,-1.536000,34.600000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.450000,-1.536000,34.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.050000,-1.536000,33.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.450000,-1.536000,33.400000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.450000,-1.536000,33.400000> }
//C16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.200000,-1.536000,33.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.800000,-1.536000,33.400000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.200000,-1.536000,33.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.200000,-1.536000,34.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.800000,-1.536000,34.600000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.200000,-1.536000,34.600000> }
//C17 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.900000,-1.536000,27.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.900000,-1.536000,26.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.900000,-1.536000,26.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.100000,-1.536000,27.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.100000,-1.536000,26.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.100000,-1.536000,26.700000> }
//C18 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.600000,0.000000,27.550000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.600000,0.000000,26.950000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.600000,0.000000,26.950000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.400000,0.000000,27.550000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.400000,0.000000,26.950000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.400000,0.000000,26.950000> }
//C19 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.150000,-1.536000,19.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.150000,-1.536000,18.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.150000,-1.536000,18.700000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.350000,-1.536000,19.300000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.350000,-1.536000,18.700000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.350000,-1.536000,18.700000> }
//C20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.913400,0.000000,38.112200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.386600,0.000000,38.112200>}
box{<0,0,-0.063500><1.473200,0.036000,0.063500> rotate<0,0.000000,0> translate<15.913400,0.000000,38.112200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.913400,0.000000,35.927800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.386600,0.000000,35.927800>}
box{<0,0,-0.063500><1.473200,0.036000,0.063500> rotate<0,0.000000,0> translate<15.913400,0.000000,35.927800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.386600,0.000000,38.112200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.386600,0.000000,35.927800>}
box{<0,0,-0.063500><2.184400,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.386600,0.000000,35.927800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.913400,0.000000,35.927800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.913400,0.000000,38.112200>}
box{<0,0,-0.063500><2.184400,0.036000,0.063500> rotate<0,90.000000,0> translate<15.913400,0.000000,38.112200> }
box{<-0.254000,0,-1.244600><0.254000,0.036000,1.244600> rotate<0,-0.000000,0> translate<15.608600,0.000000,37.020000>}
box{<-0.254000,0,-1.244600><0.254000,0.036000,1.244600> rotate<0,-0.000000,0> translate<17.691400,0.000000,37.020000>}
//C24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,-1.536000,21.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.300000,-1.536000,21.150000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.700000,-1.536000,21.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,-1.536000,22.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.300000,-1.536000,22.350000>}
box{<0,0,-0.076200><0.600000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.700000,-1.536000,22.350000> }
//D4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.526641,0.000000,34.378616>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.712631,0.000000,32.564603>}
box{<0,0,-0.063500><2.565399,0.036000,0.063500> rotate<0,-44.997080,0> translate<34.712631,0.000000,32.564603> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.712631,0.000000,32.564603>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.814603,0.000000,33.462631>}
box{<0,0,-0.063500><1.270004,0.036000,0.063500> rotate<0,44.997030,0> translate<33.814603,0.000000,33.462631> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.814603,0.000000,33.462631>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.628616,0.000000,35.276641>}
box{<0,0,-0.063500><2.565399,0.036000,0.063500> rotate<0,-44.996981,0> translate<33.814603,0.000000,33.462631> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.628616,0.000000,35.276641>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.526641,0.000000,34.378616>}
box{<0,0,-0.063500><1.269999,0.036000,0.063500> rotate<0,44.997030,0> translate<35.628616,0.000000,35.276641> }
box{<-0.177800,0,-0.635000><0.177800,0.036000,0.635000> rotate<0,-225.000000,0> translate<35.718419,0.000000,34.468419>}
box{<-0.152400,0,-0.787400><0.152400,0.036000,0.787400> rotate<0,-225.000000,0> translate<36.221313,0.000000,34.971313>}
box{<-0.152400,0,-0.787400><0.152400,0.036000,0.787400> rotate<0,-225.000000,0> translate<34.101972,0.000000,32.887894>}
//H1 silk screen
//H2 silk screen
//H3 silk screen
//H4 silk screen
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.143419,0.000000,37.311578>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.143419,0.000000,36.952369>}
box{<0,0,-0.076200><0.359209,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.143419,0.000000,36.952369> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.143419,0.000000,37.311578>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.502628,0.000000,37.311578>}
box{<0,0,-0.076200><0.359209,0.036000,0.076200> rotate<0,0.000000,0> translate<42.143419,0.000000,37.311578> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.706578,0.000000,38.748419>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.347369,0.000000,38.748419>}
box{<0,0,-0.076200><0.359209,0.036000,0.076200> rotate<0,0.000000,0> translate<40.347369,0.000000,38.748419> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.706578,0.000000,38.748419>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.706578,0.000000,39.107628>}
box{<0,0,-0.076200><0.359209,0.036000,0.076200> rotate<0,90.000000,0> translate<40.706578,0.000000,39.107628> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.706578,0.000000,39.107628>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.143419,0.000000,40.544469>}
box{<0,0,-0.076200><2.031999,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.706578,0.000000,39.107628> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.502628,0.000000,40.544469>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.143419,0.000000,40.544469>}
box{<0,0,-0.076200><0.359209,0.036000,0.076200> rotate<0,0.000000,0> translate<42.143419,0.000000,40.544469> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.910528,0.000000,37.311578>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.910528,0.000000,36.952369>}
box{<0,0,-0.076200><0.359209,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.910528,0.000000,36.952369> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.910528,0.000000,37.311578>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.347369,0.000000,38.748419>}
box{<0,0,-0.076200><2.031999,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.910528,0.000000,37.311578> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.910528,0.000000,36.952369>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.347369,0.000000,35.515528>}
box{<0,0,-0.076200><2.031999,0.036000,0.076200> rotate<0,44.997030,0> translate<38.910528,0.000000,36.952369> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.706578,0.000000,35.515528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.347369,0.000000,35.515528>}
box{<0,0,-0.076200><0.359209,0.036000,0.076200> rotate<0,0.000000,0> translate<40.347369,0.000000,35.515528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.706578,0.000000,35.515528>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.143419,0.000000,36.952369>}
box{<0,0,-0.076200><2.031999,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.706578,0.000000,35.515528> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.502628,0.000000,37.311578>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.939469,0.000000,38.748419>}
box{<0,0,-0.076200><2.031999,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.502628,0.000000,37.311578> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.939469,0.000000,39.107628>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.939469,0.000000,38.748419>}
box{<0,0,-0.076200><0.359209,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.939469,0.000000,38.748419> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.939469,0.000000,39.107628>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.502628,0.000000,40.544469>}
box{<0,0,-0.076200><2.031999,0.036000,0.076200> rotate<0,44.997030,0> translate<42.502628,0.000000,40.544469> }
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-135.000000,0> translate<40.526972,0.000000,37.131972>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-135.000000,0> translate<42.323025,0.000000,38.928025>}
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,40.855000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,42.125000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,42.125000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,42.125000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,42.760000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,42.125000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,42.760000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,42.125000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,42.760000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,37.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,38.315000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,38.315000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,38.315000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,39.585000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,39.585000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,39.585000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,40.220000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,39.585000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,40.220000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,39.585000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,40.220000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,39.585000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,38.315000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,38.315000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,38.315000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,37.680000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,37.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,40.855000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,40.220000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,40.855000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,40.220000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,40.855000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,40.220000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,42.125000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,40.855000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,40.855000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,33.235000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,34.505000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,34.505000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,34.505000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,35.140000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,34.505000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,35.140000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,34.505000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,35.140000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,35.140000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,35.775000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,35.775000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,35.775000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,37.045000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,37.045000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,37.045000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,37.680000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,37.045000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,37.680000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,37.045000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,37.680000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,37.045000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,35.775000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,35.775000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,35.775000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,35.140000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,35.140000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,30.060000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,30.695000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,30.695000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,30.695000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,31.965000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,31.965000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,31.965000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,32.600000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,31.965000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,32.600000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,31.965000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,32.600000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,31.965000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,30.695000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,30.695000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,30.695000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,30.060000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,30.060000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,33.235000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,32.600000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,33.235000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,32.600000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,33.235000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,32.600000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,34.505000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,33.235000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,33.235000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,25.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,26.885000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,26.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,26.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,27.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,26.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,27.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,26.885000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,27.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,27.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,28.155000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,28.155000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,28.155000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,29.425000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,29.425000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,29.425000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,30.060000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,29.425000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,30.060000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,29.425000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,30.060000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,29.425000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,28.155000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,28.155000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,28.155000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,27.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,27.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,24.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,24.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<1.615000,0.000000,24.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,25.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,24.980000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,25.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,24.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,25.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,24.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,26.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,25.615000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,25.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,43.395000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,44.665000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,44.665000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,44.665000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,45.300000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,44.665000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,45.300000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,45.300000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<1.615000,0.000000,45.300000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,45.300000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,44.665000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,45.300000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,43.395000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,42.760000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,43.395000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,42.760000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,43.395000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,42.760000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,44.665000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,43.395000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,43.395000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,41.490000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,38.950000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,36.410000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,33.870000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,31.330000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,28.790000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,26.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,44.030000>}
//JP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.990000,0.000000,46.560000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.355000,0.000000,47.195000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<15.355000,0.000000,47.195000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.355000,0.000000,47.195000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.355000,0.000000,48.465000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<15.355000,0.000000,48.465000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.355000,0.000000,48.465000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.990000,0.000000,49.100000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<15.355000,0.000000,48.465000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.260000,0.000000,49.100000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.895000,0.000000,48.465000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<17.260000,0.000000,49.100000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.895000,0.000000,48.465000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.895000,0.000000,47.195000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.895000,0.000000,47.195000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.895000,0.000000,47.195000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.260000,0.000000,46.560000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<17.260000,0.000000,46.560000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.355000,0.000000,42.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.355000,0.000000,43.385000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<15.355000,0.000000,43.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.355000,0.000000,43.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.990000,0.000000,44.020000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<15.355000,0.000000,43.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.260000,0.000000,44.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.895000,0.000000,43.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<17.260000,0.000000,44.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.990000,0.000000,44.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.355000,0.000000,44.655000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<15.355000,0.000000,44.655000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.355000,0.000000,44.655000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.355000,0.000000,45.925000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<15.355000,0.000000,45.925000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.355000,0.000000,45.925000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.990000,0.000000,46.560000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<15.355000,0.000000,45.925000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.260000,0.000000,46.560000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.895000,0.000000,45.925000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<17.260000,0.000000,46.560000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.895000,0.000000,45.925000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.895000,0.000000,44.655000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.895000,0.000000,44.655000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.895000,0.000000,44.655000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.260000,0.000000,44.020000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<17.260000,0.000000,44.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.990000,0.000000,41.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.260000,0.000000,41.480000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.990000,0.000000,41.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.355000,0.000000,42.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.990000,0.000000,41.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<15.355000,0.000000,42.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.260000,0.000000,41.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.895000,0.000000,42.115000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<17.260000,0.000000,41.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.895000,0.000000,43.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.895000,0.000000,42.115000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<17.895000,0.000000,42.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.990000,0.000000,49.100000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.260000,0.000000,49.100000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.990000,0.000000,49.100000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<16.625000,0.000000,47.830000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<16.625000,0.000000,45.290000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<16.625000,0.000000,42.750000>}
//JP4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.930000,0.000000,48.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.565000,0.000000,49.020000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<42.930000,0.000000,48.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.565000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.835000,0.000000,49.020000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.565000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.835000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.470000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<44.835000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.470000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.835000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<44.835000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.835000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.565000,0.000000,46.480000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.565000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.565000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.930000,0.000000,47.115000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<42.930000,0.000000,47.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.485000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.755000,0.000000,49.020000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.485000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.755000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.390000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<39.755000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.390000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.755000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<39.755000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.390000,0.000000,48.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.025000,0.000000,49.020000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<40.390000,0.000000,48.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.025000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.295000,0.000000,49.020000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.025000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.295000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.930000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<42.295000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.930000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.295000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<42.295000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.295000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.025000,0.000000,46.480000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<41.025000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.025000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.390000,0.000000,47.115000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<40.390000,0.000000,47.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.310000,0.000000,48.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.945000,0.000000,49.020000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<35.310000,0.000000,48.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.945000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.215000,0.000000,49.020000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.945000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.215000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.850000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<37.215000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.850000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.215000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<37.215000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.215000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.945000,0.000000,46.480000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.945000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.945000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.310000,0.000000,47.115000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<35.310000,0.000000,47.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.485000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.850000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<37.850000,0.000000,48.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.850000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.485000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<37.850000,0.000000,47.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.755000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.485000,0.000000,46.480000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.485000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.865000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.135000,0.000000,49.020000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<30.865000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.135000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.770000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<32.135000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.770000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.135000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.135000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.770000,0.000000,48.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.405000,0.000000,49.020000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.770000,0.000000,48.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.405000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.675000,0.000000,49.020000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.405000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.675000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.310000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<34.675000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.310000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.675000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<34.675000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.675000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.405000,0.000000,46.480000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.405000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.405000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.770000,0.000000,47.115000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<32.770000,0.000000,47.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.230000,0.000000,48.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.230000,0.000000,47.115000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.230000,0.000000,47.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.865000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.230000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<30.230000,0.000000,48.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.230000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.865000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<30.230000,0.000000,47.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.135000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.865000,0.000000,46.480000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<30.865000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.470000,0.000000,48.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.470000,0.000000,47.115000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<45.470000,0.000000,47.115000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<44.200000,0.000000,47.750000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<41.660000,0.000000,47.750000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<39.120000,0.000000,47.750000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<36.580000,0.000000,47.750000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<34.040000,0.000000,47.750000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<31.500000,0.000000,47.750000>}
//JP5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.145000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.875000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<7.875000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.875000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.240000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<7.240000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.240000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.875000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<7.240000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.320000,0.000000,1.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.685000,0.000000,0.980000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<11.685000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.685000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.415000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<10.415000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.415000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.780000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<9.780000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.780000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.415000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<9.780000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.415000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.685000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<10.415000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.685000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.320000,0.000000,2.885000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<11.685000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.145000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.780000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<9.145000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.780000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.145000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<9.145000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.875000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.145000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<7.875000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.765000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.495000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.495000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.495000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.860000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<14.860000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.860000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.495000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<14.860000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.860000,0.000000,1.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.225000,0.000000,0.980000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<14.225000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.225000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.955000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.955000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.955000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.320000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<12.320000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.320000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.955000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<12.320000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.955000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.225000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.955000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.225000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.860000,0.000000,2.885000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<14.225000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.940000,0.000000,1.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.305000,0.000000,0.980000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.305000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.305000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.035000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.035000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.035000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.400000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<17.400000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.400000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.035000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<17.400000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.035000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.305000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<18.035000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.305000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.940000,0.000000,2.885000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.305000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.765000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.400000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<16.765000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<17.400000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.765000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<16.765000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.495000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<16.765000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<15.495000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.385000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.115000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.115000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.115000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.480000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<22.480000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.480000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.115000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<22.480000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.480000,0.000000,1.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.845000,0.000000,0.980000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<21.845000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.845000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.575000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.575000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.575000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.940000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<19.940000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<19.940000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.575000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<19.940000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.575000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.845000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.575000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.845000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.480000,0.000000,2.885000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<21.845000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.020000,0.000000,1.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.020000,0.000000,2.885000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<25.020000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.385000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.020000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.385000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.020000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.385000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.385000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<23.115000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.385000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<23.115000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.605000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.335000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.335000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.335000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.700000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.700000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.700000,0.000000,1.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.700000,0.000000,2.885000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<4.700000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.700000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.335000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.700000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.605000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.240000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<6.605000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.240000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.605000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<6.605000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.335000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.605000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.335000,0.000000,3.520000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<8.510000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<11.050000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<13.590000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<16.130000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<18.670000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<21.210000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<23.750000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<5.970000,0.000000,2.250000>}
//JP6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.395000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.125000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.125000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.125000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.490000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<27.490000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.490000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.125000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<27.490000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.570000,0.000000,1.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.935000,0.000000,0.980000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<31.935000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.935000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.665000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<30.665000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.665000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.030000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<30.030000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.030000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.665000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<30.030000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.665000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.935000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<30.665000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.935000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.570000,0.000000,2.885000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<31.935000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.395000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.030000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<29.395000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.030000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.395000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<29.395000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.125000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.395000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<28.125000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.015000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.745000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.745000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.745000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.110000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<35.110000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.110000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.745000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<35.110000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.110000,0.000000,1.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.475000,0.000000,0.980000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<34.475000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.475000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.205000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.205000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.205000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.570000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<32.570000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.570000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.205000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<32.570000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.205000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.475000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<33.205000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.475000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.110000,0.000000,2.885000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<34.475000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.190000,0.000000,1.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.555000,0.000000,0.980000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<39.555000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.555000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.285000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.285000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.285000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.650000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<37.650000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.650000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.285000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<37.650000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.285000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.555000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<38.285000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.555000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.190000,0.000000,2.885000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<39.555000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.015000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.650000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<37.015000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.650000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.015000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<37.015000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.745000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.015000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<35.745000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.635000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.365000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.365000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.365000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.730000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<42.730000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.730000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.365000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<42.730000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.730000,0.000000,1.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.095000,0.000000,0.980000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<42.095000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.095000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.825000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.825000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.825000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.190000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<40.190000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.190000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.825000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<40.190000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.825000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.095000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<40.825000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.095000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.730000,0.000000,2.885000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<42.095000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.270000,0.000000,1.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.270000,0.000000,2.885000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<45.270000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.635000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.270000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<44.635000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.270000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.635000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<44.635000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.365000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.635000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.365000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.855000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.585000,0.000000,0.980000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<25.585000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.585000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.950000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<24.950000,0.000000,1.615000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.950000,0.000000,1.615000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.950000,0.000000,2.885000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<24.950000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<24.950000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.585000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<24.950000,0.000000,2.885000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.855000,0.000000,0.980000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.490000,0.000000,1.615000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<26.855000,0.000000,0.980000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.490000,0.000000,2.885000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.855000,0.000000,3.520000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<26.855000,0.000000,3.520000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<25.585000,0.000000,3.520000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.855000,0.000000,3.520000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<25.585000,0.000000,3.520000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<28.760000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<31.300000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<33.840000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<36.380000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<38.920000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<41.460000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<44.000000,0.000000,2.250000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<26.220000,0.000000,2.250000>}
//JP7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,9.145000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,7.875000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,7.875000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,7.875000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,7.240000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,7.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,7.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,7.875000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,7.875000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,12.320000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,11.685000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,12.320000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,11.685000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,10.415000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,10.415000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,10.415000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,9.780000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,9.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,9.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,10.415000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,10.415000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,10.415000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,11.685000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,11.685000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,11.685000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,12.320000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,11.685000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,9.145000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,9.780000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,9.780000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,9.780000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,9.145000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,9.145000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,7.875000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,9.145000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,9.145000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,16.765000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,15.495000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,15.495000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,15.495000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,14.860000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,14.860000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,14.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,15.495000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,15.495000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,14.860000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,14.225000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,14.860000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,14.225000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,12.955000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,12.955000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,12.955000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,12.320000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,12.320000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,12.320000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,12.955000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,12.955000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,12.955000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,14.225000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,14.225000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,14.225000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,14.860000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,14.225000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,19.940000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,19.305000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,19.940000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,19.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,18.035000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,18.035000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,18.035000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,17.400000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,17.400000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,17.400000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,18.035000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,18.035000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,18.035000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,19.305000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,19.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,19.305000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,19.940000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,19.305000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,16.765000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,17.400000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,17.400000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,17.400000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,16.765000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,16.765000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,15.495000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,16.765000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,16.765000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,24.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,23.115000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,23.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,23.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,22.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,22.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,22.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,23.115000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,23.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,22.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,21.845000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,22.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,21.845000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,20.575000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,20.575000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,20.575000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,19.940000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,19.940000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,19.940000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,20.575000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,20.575000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,20.575000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,21.845000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,21.845000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,21.845000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,22.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,21.845000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,25.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,25.020000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.115000,0.000000,25.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,24.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,25.020000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,25.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,25.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,24.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,24.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,23.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,24.385000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,24.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,6.605000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,5.335000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,5.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,5.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,4.700000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,4.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,4.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,4.700000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.115000,0.000000,4.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,4.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,5.335000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,5.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,6.605000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,7.240000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,7.240000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,7.240000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,6.605000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,6.605000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,5.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,6.605000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,6.605000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,8.510000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,11.050000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,13.590000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,16.130000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,18.670000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,21.210000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,23.750000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,5.970000>}
//JP8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,29.395000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,28.125000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,28.125000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,28.125000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,27.490000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,27.490000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,27.490000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,28.125000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,28.125000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,32.570000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,31.935000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,32.570000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,31.935000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,30.665000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,30.665000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,30.665000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,30.030000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,30.030000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,30.030000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,30.665000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,30.665000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,30.665000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,31.935000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,31.935000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,31.935000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,32.570000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,31.935000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,29.395000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,30.030000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,30.030000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,30.030000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,29.395000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,29.395000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,28.125000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,29.395000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,29.395000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,37.015000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,35.745000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,35.745000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,35.745000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,35.110000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,35.110000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,35.110000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,35.745000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,35.745000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,35.110000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,34.475000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,35.110000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,34.475000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,33.205000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,33.205000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,33.205000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,32.570000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,32.570000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,32.570000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,33.205000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,33.205000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,33.205000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,34.475000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,34.475000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,34.475000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,35.110000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,34.475000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,40.190000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,39.555000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,40.190000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,39.555000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,38.285000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,38.285000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,38.285000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,37.650000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,37.650000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,37.650000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,38.285000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,38.285000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,38.285000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,39.555000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,39.555000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,39.555000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,40.190000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,39.555000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,37.015000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,37.650000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,37.650000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,37.650000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,37.015000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,37.015000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,35.745000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,37.015000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,37.015000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,44.635000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,43.365000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,43.365000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,43.365000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,42.730000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,42.730000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,42.730000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,43.365000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,43.365000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,42.730000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,42.095000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,42.730000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,42.095000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,40.825000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,40.825000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,40.825000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,40.190000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,40.190000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,40.190000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,40.825000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,40.825000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,40.825000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,42.095000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,42.095000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,42.095000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,42.730000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,42.095000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,45.270000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,45.270000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.115000,0.000000,45.270000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,44.635000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,45.270000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,45.270000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,45.270000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,44.635000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,44.635000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,43.365000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,44.635000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,44.635000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,26.855000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,25.585000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<49.020000,0.000000,25.585000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,25.585000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,24.950000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<48.385000,0.000000,24.950000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,24.950000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,24.950000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<47.115000,0.000000,24.950000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,24.950000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,25.585000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<46.480000,0.000000,25.585000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<49.020000,0.000000,26.855000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.385000,0.000000,27.490000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<48.385000,0.000000,27.490000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.115000,0.000000,27.490000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,26.855000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.480000,0.000000,26.855000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,25.585000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.480000,0.000000,26.855000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<46.480000,0.000000,26.855000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,28.760000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,31.300000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,33.840000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,36.380000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,38.920000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,41.460000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,44.000000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<47.750000,0.000000,26.220000>}
//JP9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.985000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.255000,0.000000,49.020000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.985000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.255000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.890000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<14.255000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.890000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.255000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<14.255000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.810000,0.000000,48.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.445000,0.000000,49.020000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<9.810000,0.000000,48.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.445000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.715000,0.000000,49.020000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<10.445000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.715000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.350000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<11.715000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.350000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.715000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<11.715000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.715000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.445000,0.000000,46.480000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<10.445000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<10.445000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.810000,0.000000,47.115000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<9.810000,0.000000,47.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.985000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.350000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<12.350000,0.000000,48.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.350000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.985000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<12.350000,0.000000,47.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.255000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<12.985000,0.000000,46.480000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<12.985000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.365000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.635000,0.000000,49.020000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.365000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.635000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.270000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<6.635000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.270000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.635000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<6.635000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.270000,0.000000,48.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.905000,0.000000,49.020000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<7.270000,0.000000,48.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.905000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.175000,0.000000,49.020000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<7.905000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.175000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.810000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<9.175000,0.000000,49.020000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.810000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.175000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<9.175000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.175000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.905000,0.000000,46.480000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<7.905000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.905000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.270000,0.000000,47.115000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<7.270000,0.000000,47.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.730000,0.000000,48.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.730000,0.000000,47.115000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<4.730000,0.000000,47.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.365000,0.000000,49.020000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.730000,0.000000,48.385000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<4.730000,0.000000,48.385000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<4.730000,0.000000,47.115000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.365000,0.000000,46.480000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<4.730000,0.000000,47.115000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.635000,0.000000,46.480000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.365000,0.000000,46.480000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.365000,0.000000,46.480000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.890000,0.000000,48.385000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.890000,0.000000,47.115000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.890000,0.000000,47.115000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<13.620000,0.000000,47.750000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<11.080000,0.000000,47.750000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<8.540000,0.000000,47.750000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<6.000000,0.000000,47.750000>}
//JP10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,20.605000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,21.875000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,21.875000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,21.875000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,22.510000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,21.875000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,22.510000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,21.875000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,22.510000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,17.430000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,18.065000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,18.065000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,18.065000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,19.335000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,19.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,19.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,19.970000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,19.335000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,19.970000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,19.335000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,19.970000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,19.335000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,18.065000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,18.065000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,18.065000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,17.430000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,17.430000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,20.605000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,19.970000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,20.605000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,19.970000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,20.605000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,19.970000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,21.875000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,20.605000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,20.605000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,12.985000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,14.255000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,14.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,14.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,14.890000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,14.255000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,14.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,14.255000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,14.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,14.890000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,15.525000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,15.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,15.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,16.795000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,16.795000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,16.795000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,17.430000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,16.795000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,17.430000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,16.795000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,17.430000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,16.795000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,15.525000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,15.525000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,15.525000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,14.890000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,14.890000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,9.810000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,10.445000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,11.715000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,11.715000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,12.350000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,11.715000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,12.350000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,11.715000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,12.350000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,11.715000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,10.445000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,10.445000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,10.445000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,9.810000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,9.810000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,12.985000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,12.350000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,12.985000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,12.350000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,12.985000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,12.350000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,14.255000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,12.985000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,12.985000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,5.365000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,6.635000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,6.635000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,6.635000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,7.270000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,6.635000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,7.270000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,6.635000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,7.270000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,7.270000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,7.905000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,7.905000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,7.905000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,9.175000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,9.175000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,9.175000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,9.810000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,9.175000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,9.810000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,9.175000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,9.810000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,9.175000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,7.905000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,7.905000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,7.905000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,7.270000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,7.270000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,4.730000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,4.730000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<1.615000,0.000000,4.730000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,5.365000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,4.730000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,5.365000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,4.730000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,5.365000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,4.730000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,6.635000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,5.365000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,5.365000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,23.145000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,24.415000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,90.000000,0> translate<0.980000,0.000000,24.415000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,24.415000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,25.050000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<0.980000,0.000000,24.415000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,25.050000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,25.050000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,0.000000,0> translate<1.615000,0.000000,25.050000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,25.050000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,24.415000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<2.885000,0.000000,25.050000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<0.980000,0.000000,23.145000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<1.615000,0.000000,22.510000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,44.997030,0> translate<0.980000,0.000000,23.145000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<2.885000,0.000000,22.510000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,23.145000>}
box{<0,0,-0.101600><0.898026,0.036000,0.101600> rotate<0,-44.997030,0> translate<2.885000,0.000000,22.510000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,24.415000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.520000,0.000000,23.145000>}
box{<0,0,-0.101600><1.270000,0.036000,0.101600> rotate<0,-90.000000,0> translate<3.520000,0.000000,23.145000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,21.240000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,18.700000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,16.160000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,13.620000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,11.080000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,8.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,6.000000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<2.250000,0.000000,23.780000>}
//L2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.290000,-1.536000,26.386000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.290000,-1.536000,28.114000>}
box{<0,0,-0.050800><1.728000,0.036000,0.050800> rotate<0,90.000000,0> translate<20.290000,-1.536000,28.114000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.197000,-1.536000,26.386000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.197000,-1.536000,28.114000>}
box{<0,0,-0.050800><1.728000,0.036000,0.050800> rotate<0,90.000000,0> translate<19.197000,-1.536000,28.114000> }
box{<-0.150000,0,-0.599950><0.150000,0.036000,0.599950> rotate<0,-90.000000,0> translate<19.740350,-1.536000,26.257000>}
box{<-0.150000,0,-0.599950><0.150000,0.036000,0.599950> rotate<0,-90.000000,0> translate<19.740350,-1.536000,28.238200>}
//LED1 silk screen
object{ARC(0.354172,0.101600,8.802740,171.197260,0.036000) translate<18.000000,0.000000,4.520800>}
object{ARC(0.354172,0.101600,188.802740,351.197260,0.036000) translate<18.000000,0.000000,6.479200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.425000,0.000000,4.975000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.425000,0.000000,6.025000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,90.000000,0> translate<17.425000,0.000000,6.025000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.575000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.575000,0.000000,4.575000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,-90.000000,0> translate<18.575000,0.000000,4.575000> }
difference{
cylinder{<18.450000,0,4.650000><18.450000,0.036000,4.650000>0.153800 translate<0,0.000000,0>}
cylinder{<18.450000,-0.1,4.650000><18.450000,0.135000,4.650000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<17.537500,0.000000,4.750000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<18.250000,0.000000,4.875000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<17.750000,0.000000,4.875000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<18.000000,0.000000,4.912500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<17.537500,0.000000,6.250000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<18.462500,0.000000,6.250000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<17.750000,0.000000,6.125000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<18.250000,0.000000,6.125000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<18.000000,0.000000,6.087500>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-180.000000,0> translate<18.000000,0.000000,5.400000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-180.000000,0> translate<18.450000,0.000000,4.850000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-180.000000,0> translate<18.462500,0.000000,4.537500>}
//LED2 silk screen
object{ARC(0.354172,0.101600,8.802740,171.197260,0.036000) translate<20.000000,0.000000,4.520800>}
object{ARC(0.354172,0.101600,188.802740,351.197260,0.036000) translate<20.000000,0.000000,6.479200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.425000,0.000000,4.975000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.425000,0.000000,6.025000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,90.000000,0> translate<19.425000,0.000000,6.025000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.575000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.575000,0.000000,4.575000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,-90.000000,0> translate<20.575000,0.000000,4.575000> }
difference{
cylinder{<20.450000,0,4.650000><20.450000,0.036000,4.650000>0.153800 translate<0,0.000000,0>}
cylinder{<20.450000,-0.1,4.650000><20.450000,0.135000,4.650000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<19.537500,0.000000,4.750000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<20.250000,0.000000,4.875000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<19.750000,0.000000,4.875000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<20.000000,0.000000,4.912500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<19.537500,0.000000,6.250000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<20.462500,0.000000,6.250000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<19.750000,0.000000,6.125000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<20.250000,0.000000,6.125000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<20.000000,0.000000,6.087500>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-180.000000,0> translate<20.000000,0.000000,5.400000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-180.000000,0> translate<20.450000,0.000000,4.850000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-180.000000,0> translate<20.462500,0.000000,4.537500>}
//LED3 silk screen
object{ARC(0.354172,0.101600,8.802740,171.197260,0.036000) translate<22.000000,0.000000,4.520800>}
object{ARC(0.354172,0.101600,188.802740,351.197260,0.036000) translate<22.000000,0.000000,6.479200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.425000,0.000000,4.975000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.425000,0.000000,6.025000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,90.000000,0> translate<21.425000,0.000000,6.025000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.575000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.575000,0.000000,4.575000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.575000,0.000000,4.575000> }
difference{
cylinder{<22.450000,0,4.650000><22.450000,0.036000,4.650000>0.153800 translate<0,0.000000,0>}
cylinder{<22.450000,-0.1,4.650000><22.450000,0.135000,4.650000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<21.537500,0.000000,4.750000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<22.250000,0.000000,4.875000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<21.750000,0.000000,4.875000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<22.000000,0.000000,4.912500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<21.537500,0.000000,6.250000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<22.462500,0.000000,6.250000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<21.750000,0.000000,6.125000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<22.250000,0.000000,6.125000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<22.000000,0.000000,6.087500>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-180.000000,0> translate<22.000000,0.000000,5.400000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-180.000000,0> translate<22.450000,0.000000,4.850000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-180.000000,0> translate<22.462500,0.000000,4.537500>}
//LED4 silk screen
object{ARC(0.354172,0.101600,8.802740,171.197260,0.036000) translate<28.000000,0.000000,4.520800>}
object{ARC(0.354172,0.101600,188.802740,351.197260,0.036000) translate<28.000000,0.000000,6.479200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.425000,0.000000,4.975000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.425000,0.000000,6.025000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,90.000000,0> translate<27.425000,0.000000,6.025000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.575000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.575000,0.000000,4.575000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,-90.000000,0> translate<28.575000,0.000000,4.575000> }
difference{
cylinder{<28.450000,0,4.650000><28.450000,0.036000,4.650000>0.153800 translate<0,0.000000,0>}
cylinder{<28.450000,-0.1,4.650000><28.450000,0.135000,4.650000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<27.537500,0.000000,4.750000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<28.250000,0.000000,4.875000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<27.750000,0.000000,4.875000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<28.000000,0.000000,4.912500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<27.537500,0.000000,6.250000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<28.462500,0.000000,6.250000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<27.750000,0.000000,6.125000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<28.250000,0.000000,6.125000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<28.000000,0.000000,6.087500>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-180.000000,0> translate<28.000000,0.000000,5.400000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-180.000000,0> translate<28.450000,0.000000,4.850000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-180.000000,0> translate<28.462500,0.000000,4.537500>}
//LED5 silk screen
object{ARC(0.354172,0.101600,8.802740,171.197260,0.036000) translate<24.000000,0.000000,4.520800>}
object{ARC(0.354172,0.101600,188.802740,351.197260,0.036000) translate<24.000000,0.000000,6.479200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.425000,0.000000,4.975000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.425000,0.000000,6.025000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,90.000000,0> translate<23.425000,0.000000,6.025000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.575000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.575000,0.000000,4.575000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,-90.000000,0> translate<24.575000,0.000000,4.575000> }
difference{
cylinder{<24.450000,0,4.650000><24.450000,0.036000,4.650000>0.153800 translate<0,0.000000,0>}
cylinder{<24.450000,-0.1,4.650000><24.450000,0.135000,4.650000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<23.537500,0.000000,4.750000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<24.250000,0.000000,4.875000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<23.750000,0.000000,4.875000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<24.000000,0.000000,4.912500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<23.537500,0.000000,6.250000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<24.462500,0.000000,6.250000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<23.750000,0.000000,6.125000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<24.250000,0.000000,6.125000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<24.000000,0.000000,6.087500>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-180.000000,0> translate<24.000000,0.000000,5.400000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-180.000000,0> translate<24.450000,0.000000,4.850000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-180.000000,0> translate<24.462500,0.000000,4.537500>}
//LED6 silk screen
object{ARC(0.354172,0.101600,8.802740,171.197260,0.036000) translate<26.000000,0.000000,4.520800>}
object{ARC(0.354172,0.101600,188.802740,351.197260,0.036000) translate<26.000000,0.000000,6.479200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.425000,0.000000,4.975000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.425000,0.000000,6.025000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,90.000000,0> translate<25.425000,0.000000,6.025000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.575000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.575000,0.000000,4.575000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,-90.000000,0> translate<26.575000,0.000000,4.575000> }
difference{
cylinder{<26.450000,0,4.650000><26.450000,0.036000,4.650000>0.153800 translate<0,0.000000,0>}
cylinder{<26.450000,-0.1,4.650000><26.450000,0.135000,4.650000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<25.537500,0.000000,4.750000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<26.250000,0.000000,4.875000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<25.750000,0.000000,4.875000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<26.000000,0.000000,4.912500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<25.537500,0.000000,6.250000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<26.462500,0.000000,6.250000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<25.750000,0.000000,6.125000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<26.250000,0.000000,6.125000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<26.000000,0.000000,6.087500>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-180.000000,0> translate<26.000000,0.000000,5.400000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-180.000000,0> translate<26.450000,0.000000,4.850000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-180.000000,0> translate<26.462500,0.000000,4.537500>}
//LED7 silk screen
object{ARC(0.354172,0.101600,278.802740,441.197260,0.036000) translate<31.270800,0.000000,40.855000>}
object{ARC(0.354172,0.101600,98.802740,261.197260,0.036000) translate<33.229200,0.000000,40.855000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.725000,0.000000,41.430000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.775000,0.000000,41.430000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,0.000000,0> translate<31.725000,0.000000,41.430000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.750000,0.000000,40.280000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.325000,0.000000,40.280000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,0.000000,0> translate<31.325000,0.000000,40.280000> }
difference{
cylinder{<31.400000,0,40.405000><31.400000,0.036000,40.405000>0.153800 translate<0,0.000000,0>}
cylinder{<31.400000,-0.1,40.405000><31.400000,0.135000,40.405000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<31.500000,0.000000,41.317500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<31.625000,0.000000,40.605000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<31.625000,0.000000,41.105000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<31.662500,0.000000,40.855000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<33.000000,0.000000,41.317500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<33.000000,0.000000,40.392500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<32.875000,0.000000,41.105000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<32.875000,0.000000,40.605000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<32.837500,0.000000,40.855000>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-90.000000,0> translate<32.150000,0.000000,40.855000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-90.000000,0> translate<31.600000,0.000000,40.405000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-90.000000,0> translate<31.287500,0.000000,40.392500>}
//LED8 silk screen
object{ARC(0.354172,0.101600,8.802740,171.197260,0.036000) translate<30.000000,0.000000,4.520800>}
object{ARC(0.354172,0.101600,188.802740,351.197260,0.036000) translate<30.000000,0.000000,6.479200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.425000,0.000000,4.975000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.425000,0.000000,6.025000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,90.000000,0> translate<29.425000,0.000000,6.025000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.575000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.575000,0.000000,4.575000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,-90.000000,0> translate<30.575000,0.000000,4.575000> }
difference{
cylinder{<30.450000,0,4.650000><30.450000,0.036000,4.650000>0.153800 translate<0,0.000000,0>}
cylinder{<30.450000,-0.1,4.650000><30.450000,0.135000,4.650000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<29.537500,0.000000,4.750000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<30.250000,0.000000,4.875000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<29.750000,0.000000,4.875000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<30.000000,0.000000,4.912500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<29.537500,0.000000,6.250000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<30.462500,0.000000,6.250000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<29.750000,0.000000,6.125000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<30.250000,0.000000,6.125000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<30.000000,0.000000,6.087500>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-180.000000,0> translate<30.000000,0.000000,5.400000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-180.000000,0> translate<30.450000,0.000000,4.850000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-180.000000,0> translate<30.462500,0.000000,4.537500>}
//LED9 silk screen
object{ARC(0.354172,0.101600,8.802740,171.197260,0.036000) translate<32.000000,0.000000,4.520800>}
object{ARC(0.354172,0.101600,188.802740,351.197260,0.036000) translate<32.000000,0.000000,6.479200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.425000,0.000000,4.975000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.425000,0.000000,6.025000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,90.000000,0> translate<31.425000,0.000000,6.025000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.575000,0.000000,6.000000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.575000,0.000000,4.575000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.575000,0.000000,4.575000> }
difference{
cylinder{<32.450000,0,4.650000><32.450000,0.036000,4.650000>0.153800 translate<0,0.000000,0>}
cylinder{<32.450000,-0.1,4.650000><32.450000,0.135000,4.650000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<31.537500,0.000000,4.750000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<32.250000,0.000000,4.875000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<31.750000,0.000000,4.875000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<32.000000,0.000000,4.912500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<31.537500,0.000000,6.250000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-180.000000,0> translate<32.462500,0.000000,6.250000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<31.750000,0.000000,6.125000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-180.000000,0> translate<32.250000,0.000000,6.125000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-180.000000,0> translate<32.000000,0.000000,6.087500>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-180.000000,0> translate<32.000000,0.000000,5.400000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-180.000000,0> translate<32.450000,0.000000,4.850000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-180.000000,0> translate<32.462500,0.000000,4.537500>}
//LED10 silk screen
object{ARC(0.354172,0.101600,98.802740,261.197260,0.036000) translate<17.259200,0.000000,40.700000>}
object{ARC(0.354172,0.101600,278.802740,441.197260,0.036000) translate<15.300800,0.000000,40.700000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.805000,0.000000,40.125000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.755000,0.000000,40.125000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,0.000000,0> translate<15.755000,0.000000,40.125000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.780000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.205000,0.000000,41.275000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,0.000000,0> translate<15.780000,0.000000,41.275000> }
difference{
cylinder{<17.130000,0,41.150000><17.130000,0.036000,41.150000>0.153800 translate<0,0.000000,0>}
cylinder{<17.130000,-0.1,41.150000><17.130000,0.135000,41.150000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-270.000000,0> translate<17.030000,0.000000,40.237500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-270.000000,0> translate<16.905000,0.000000,40.950000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-270.000000,0> translate<16.905000,0.000000,40.450000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-270.000000,0> translate<16.867500,0.000000,40.700000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-270.000000,0> translate<15.530000,0.000000,40.237500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-270.000000,0> translate<15.530000,0.000000,41.162500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-270.000000,0> translate<15.655000,0.000000,40.450000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-270.000000,0> translate<15.655000,0.000000,40.950000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-270.000000,0> translate<15.692500,0.000000,40.700000>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-270.000000,0> translate<16.380000,0.000000,40.700000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-270.000000,0> translate<16.930000,0.000000,41.150000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-270.000000,0> translate<17.242500,0.000000,41.162500>}
//MSP_RESET silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.890000,0.000000,44.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.890000,0.000000,44.040000>}
box{<0,0,-0.101600><6.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<34.890000,0.000000,44.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.890000,0.000000,44.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.890000,0.000000,40.540000>}
box{<0,0,-0.101600><3.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.890000,0.000000,40.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.890000,0.000000,40.540000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.890000,0.000000,40.540000>}
box{<0,0,-0.101600><6.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<34.890000,0.000000,40.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.890000,0.000000,40.540000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.890000,0.000000,44.040000>}
box{<0,0,-0.101600><3.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<34.890000,0.000000,44.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.390000,0.000000,43.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.390000,0.000000,43.040000>}
box{<0,0,-0.101600><3.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.390000,0.000000,43.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.390000,0.000000,43.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.390000,0.000000,41.540000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.390000,0.000000,41.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.390000,0.000000,41.540000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.390000,0.000000,41.540000>}
box{<0,0,-0.101600><3.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.390000,0.000000,41.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.390000,0.000000,41.540000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.390000,0.000000,43.040000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<36.390000,0.000000,43.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.890000,0.000000,44.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.890000,0.000000,43.540000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.890000,0.000000,43.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.890000,0.000000,44.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.890000,0.000000,44.040000>}
box{<0,0,-0.101600><6.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<34.890000,0.000000,44.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.890000,0.000000,44.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.890000,0.000000,43.540000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.890000,0.000000,43.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.890000,0.000000,41.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.890000,0.000000,40.540000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<40.890000,0.000000,40.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.890000,0.000000,40.540000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.890000,0.000000,40.540000>}
box{<0,0,-0.101600><6.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<34.890000,0.000000,40.540000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.890000,0.000000,40.540000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.890000,0.000000,41.040000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<34.890000,0.000000,41.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.640000,0.000000,43.040000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.140000,0.000000,43.040000>}
box{<0,0,-0.101600><2.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.640000,0.000000,43.040000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.640000,0.000000,41.540000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.090000,0.000000,41.540000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.640000,0.000000,41.540000> }
//PUSH1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,8.500000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,8.500000>}
box{<0,0,-0.101600><6.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<9.500000,0.000000,8.500000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,8.500000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,12.000000>}
box{<0,0,-0.101600><3.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<9.500000,0.000000,12.000000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,12.000000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,12.000000>}
box{<0,0,-0.101600><6.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<9.500000,0.000000,12.000000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,12.000000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,8.500000>}
box{<0,0,-0.101600><3.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<15.500000,0.000000,8.500000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.000000,0.000000,9.500000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.000000,0.000000,9.500000>}
box{<0,0,-0.101600><3.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.000000,0.000000,9.500000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.000000,0.000000,9.500000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.000000,0.000000,11.000000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<11.000000,0.000000,11.000000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.000000,0.000000,11.000000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.000000,0.000000,11.000000>}
box{<0,0,-0.101600><3.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.000000,0.000000,11.000000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.000000,0.000000,11.000000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.000000,0.000000,9.500000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.000000,0.000000,9.500000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,8.500000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,9.000000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<15.500000,0.000000,9.000000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,8.500000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,8.500000>}
box{<0,0,-0.101600><6.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<9.500000,0.000000,8.500000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,8.500000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,9.000000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<9.500000,0.000000,9.000000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,11.500000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,12.000000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<9.500000,0.000000,12.000000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,12.000000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,12.000000>}
box{<0,0,-0.101600><6.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<9.500000,0.000000,12.000000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,12.000000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,11.500000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<15.500000,0.000000,11.500000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.750000,0.000000,9.500000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.250000,0.000000,9.500000>}
box{<0,0,-0.101600><2.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.250000,0.000000,9.500000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.750000,0.000000,11.000000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.300000,0.000000,11.000000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.300000,0.000000,11.000000> }
//PUSH2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,12.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,12.250000>}
box{<0,0,-0.101600><6.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<9.500000,0.000000,12.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,12.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,15.750000>}
box{<0,0,-0.101600><3.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<9.500000,0.000000,15.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,15.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,15.750000>}
box{<0,0,-0.101600><6.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<9.500000,0.000000,15.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,15.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,12.250000>}
box{<0,0,-0.101600><3.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<15.500000,0.000000,12.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.000000,0.000000,13.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.000000,0.000000,13.250000>}
box{<0,0,-0.101600><3.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.000000,0.000000,13.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.000000,0.000000,13.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.000000,0.000000,14.750000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<11.000000,0.000000,14.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.000000,0.000000,14.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.000000,0.000000,14.750000>}
box{<0,0,-0.101600><3.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.000000,0.000000,14.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.000000,0.000000,14.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.000000,0.000000,13.250000>}
box{<0,0,-0.101600><1.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<14.000000,0.000000,13.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,12.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,12.750000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<15.500000,0.000000,12.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,12.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,12.250000>}
box{<0,0,-0.101600><6.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<9.500000,0.000000,12.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,12.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,12.750000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<9.500000,0.000000,12.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,15.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,15.750000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,90.000000,0> translate<9.500000,0.000000,15.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.500000,0.000000,15.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,15.750000>}
box{<0,0,-0.101600><6.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<9.500000,0.000000,15.750000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,15.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<15.500000,0.000000,15.250000>}
box{<0,0,-0.101600><0.500000,0.036000,0.101600> rotate<0,-90.000000,0> translate<15.500000,0.000000,15.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.750000,0.000000,13.250000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.250000,0.000000,13.250000>}
box{<0,0,-0.101600><2.500000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.250000,0.000000,13.250000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.750000,0.000000,14.750000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<11.300000,0.000000,14.750000>}
box{<0,0,-0.101600><2.450000,0.036000,0.101600> rotate<0,0.000000,0> translate<11.300000,0.000000,14.750000> }
//Q1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.201000,-1.536000,22.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.201000,-1.536000,24.449000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.201000,-1.536000,24.449000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<16.043000,-1.536000,24.322000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<16.043000,-1.536000,22.798000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.297000,-1.536000,22.798000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.297000,-1.536000,24.322000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.297000,-1.536000,24.322000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.201000,-1.536000,24.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.582000,-1.536000,24.449000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.201000,-1.536000,24.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.582000,-1.536000,24.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.043000,-1.536000,24.576000>}
box{<0,0,-0.076200><5.461000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.582000,-1.536000,24.576000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.201000,-1.536000,22.671000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.582000,-1.536000,22.671000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.201000,-1.536000,22.671000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.582000,-1.536000,22.544000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.582000,-1.536000,22.671000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.582000,-1.536000,22.671000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.582000,-1.536000,22.544000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.043000,-1.536000,22.544000>}
box{<0,0,-0.076200><5.461000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.582000,-1.536000,22.544000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<9.312000,-1.536000,24.068000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<9.693000,-1.536000,24.068000>}
box{<0,0,-0.203200><0.381000,0.036000,0.203200> rotate<0,0.000000,0> translate<9.312000,-1.536000,24.068000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<9.312000,-1.536000,23.052000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<9.820000,-1.536000,23.052000>}
box{<0,0,-0.203200><0.508000,0.036000,0.203200> rotate<0,0.000000,0> translate<9.312000,-1.536000,23.052000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<9.185000,-1.536000,24.195000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<8.550000,-1.536000,24.830000>}
box{<0,0,-0.203200><0.898026,0.036000,0.203200> rotate<0,44.997030,0> translate<8.550000,-1.536000,24.830000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<9.185000,-1.536000,22.925000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<8.550000,-1.536000,22.290000>}
box{<0,0,-0.203200><0.898026,0.036000,0.203200> rotate<0,-44.997030,0> translate<8.550000,-1.536000,22.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.503000,-1.536000,23.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.122000,-1.536000,23.052000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.122000,-1.536000,23.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.122000,-1.536000,24.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.122000,-1.536000,23.052000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<13.122000,-1.536000,23.052000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.122000,-1.536000,24.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.503000,-1.536000,24.068000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.122000,-1.536000,24.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.503000,-1.536000,23.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.503000,-1.536000,24.068000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.503000,-1.536000,24.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.884000,-1.536000,23.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.884000,-1.536000,23.560000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.884000,-1.536000,23.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.741000,-1.536000,23.052000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.741000,-1.536000,23.560000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.741000,-1.536000,23.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.741000,-1.536000,23.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.233000,-1.536000,23.560000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.233000,-1.536000,23.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.741000,-1.536000,23.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.741000,-1.536000,24.068000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.741000,-1.536000,24.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.884000,-1.536000,23.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.392000,-1.536000,23.560000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.884000,-1.536000,23.560000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.884000,-1.536000,23.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.884000,-1.536000,24.068000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.884000,-1.536000,24.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.582000,-1.536000,24.576000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.582000,-1.536000,24.449000>}
box{<0,0,-0.076200><0.127000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.582000,-1.536000,24.449000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.582000,-1.536000,24.449000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.582000,-1.536000,22.671000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.582000,-1.536000,22.671000> }
box{<-0.203200,0,-0.292100><0.203200,0.036000,0.292100> rotate<0,-90.000000,0> translate<9.858100,-1.536000,24.068000>}
box{<-0.203200,0,-0.292100><0.203200,0.036000,0.292100> rotate<0,-90.000000,0> translate<9.858100,-1.536000,23.052000>}
//Q2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<28.171000,0.000000,37.786000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.329000,0.000000,37.786000>}
box{<0,0,-0.203200><5.842000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.329000,0.000000,37.786000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<28.171000,0.000000,33.214000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<22.329000,0.000000,33.214000>}
box{<0,0,-0.203200><5.842000,0.036000,0.203200> rotate<0,0.000000,0> translate<22.329000,0.000000,33.214000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.171000,0.000000,37.278000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.329000,0.000000,37.278000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.329000,0.000000,37.278000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.329000,0.000000,33.722000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.171000,0.000000,33.722000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.329000,0.000000,33.722000> }
object{ARC(1.778000,0.152400,90.000000,270.000000,0.036000) translate<22.329000,0.000000,35.500000>}
object{ARC(2.286000,0.406400,90.000000,270.000000,0.036000) translate<22.329000,0.000000,35.500000>}
object{ARC(2.286000,0.406400,270.000000,450.000000,0.036000) translate<28.171000,0.000000,35.500000>}
object{ARC(1.778000,0.152400,270.000000,450.000000,0.036000) translate<28.171000,0.000000,35.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.504000,0.000000,34.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.996000,0.000000,34.611000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.996000,0.000000,34.611000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.996000,0.000000,34.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.996000,0.000000,36.389000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.996000,0.000000,36.389000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.996000,0.000000,36.389000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.504000,0.000000,36.389000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<24.996000,0.000000,36.389000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.504000,0.000000,36.389000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.504000,0.000000,34.611000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.504000,0.000000,34.611000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.615000,0.000000,34.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.615000,0.000000,35.500000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.615000,0.000000,35.500000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.615000,0.000000,35.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.615000,0.000000,36.389000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.615000,0.000000,36.389000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.885000,0.000000,34.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.885000,0.000000,35.500000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.885000,0.000000,35.500000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.885000,0.000000,35.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.885000,0.000000,36.389000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.885000,0.000000,36.389000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.615000,0.000000,35.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.980000,0.000000,35.500000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.980000,0.000000,35.500000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.885000,0.000000,35.500000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.520000,0.000000,35.500000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.885000,0.000000,35.500000> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.135000,-1.536000,45.211200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.135000,-1.536000,43.788800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.135000,-1.536000,43.788800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.865000,-1.536000,45.211200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.865000,-1.536000,43.788800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.865000,-1.536000,43.788800> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<25.500000,-1.536000,43.636400>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<25.500000,-1.536000,45.363600>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.776200,0.000000,45.785000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.353800,0.000000,45.785000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<37.353800,0.000000,45.785000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.776200,0.000000,44.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.353800,0.000000,44.515000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<37.353800,0.000000,44.515000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<37.201400,0.000000,45.150000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<38.928600,0.000000,45.150000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.135000,-1.536000,45.211200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.135000,-1.536000,43.788800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.135000,-1.536000,43.788800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.865000,-1.536000,45.211200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.865000,-1.536000,43.788800>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.865000,-1.536000,43.788800> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<23.500000,-1.536000,43.636400>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-90.000000,0> translate<23.500000,-1.536000,45.363600>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.196116,0.000000,35.048091>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.201906,0.000000,36.053881>}
box{<0,0,-0.076200><1.422403,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.196116,0.000000,35.048091> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.298091,0.000000,35.946116>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.303881,0.000000,36.951906>}
box{<0,0,-0.076200><1.422403,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.298091,0.000000,35.946116> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-225.000000,0> translate<34.860656,0.000000,36.610656>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-225.000000,0> translate<33.639341,0.000000,35.389341>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.696116,0.000000,36.548091>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.701906,0.000000,37.553881>}
box{<0,0,-0.076200><1.422403,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.696116,0.000000,36.548091> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.798091,0.000000,37.446116>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.803881,0.000000,38.451906>}
box{<0,0,-0.076200><1.422403,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.798091,0.000000,37.446116> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-225.000000,0> translate<33.360656,0.000000,38.110656>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-225.000000,0> translate<32.139341,0.000000,36.889341>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.644000,0.000000,9.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.644000,0.000000,8.318000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<27.644000,0.000000,8.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.356000,0.000000,8.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.356000,0.000000,9.182000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<28.356000,0.000000,9.182000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<28.000000,0.000000,8.115000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<28.000000,0.000000,9.385000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.644000,0.000000,9.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.644000,0.000000,8.318000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.644000,0.000000,8.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.356000,0.000000,8.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.356000,0.000000,9.182000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.356000,0.000000,9.182000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<24.000000,0.000000,8.115000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<24.000000,0.000000,9.385000>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.644000,0.000000,9.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.644000,0.000000,8.318000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.644000,0.000000,8.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.356000,0.000000,8.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.356000,0.000000,9.182000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.356000,0.000000,9.182000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<26.000000,0.000000,8.115000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<26.000000,0.000000,9.385000>}
//R10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.907200,0.000000,30.686259>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.296259,0.000000,31.297200>}
box{<0,0,-0.076200><0.864001,0.036000,0.076200> rotate<0,44.997030,0> translate<32.296259,0.000000,31.297200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.792797,0.000000,30.793738>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.403737,0.000000,30.182797>}
box{<0,0,-0.076200><0.864001,0.036000,0.076200> rotate<0,44.997030,0> translate<31.792797,0.000000,30.793738> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-135.000000,0> translate<31.900984,0.000000,31.189013>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-135.000000,0> translate<32.799013,0.000000,30.290984>}
//R11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.644000,0.000000,9.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.644000,0.000000,8.318000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.644000,0.000000,8.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.356000,0.000000,8.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.356000,0.000000,9.182000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.356000,0.000000,9.182000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<30.000000,0.000000,8.115000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<30.000000,0.000000,9.385000>}
//R12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.644000,0.000000,9.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.644000,0.000000,8.318000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.644000,0.000000,8.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.356000,0.000000,8.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.356000,0.000000,9.182000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.356000,0.000000,9.182000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<32.000000,0.000000,8.115000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<32.000000,0.000000,9.385000>}
//R13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.644000,0.000000,9.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.644000,0.000000,8.318000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.644000,0.000000,8.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.356000,0.000000,8.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.356000,0.000000,9.182000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.356000,0.000000,9.182000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<22.000000,0.000000,8.115000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<22.000000,0.000000,9.385000>}
//R15 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.644000,0.000000,9.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.644000,0.000000,8.318000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.644000,0.000000,8.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.356000,0.000000,8.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.356000,0.000000,9.182000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.356000,0.000000,9.182000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<18.000000,0.000000,8.115000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<18.000000,0.000000,9.385000>}
//R16 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.644000,0.000000,9.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.644000,0.000000,8.318000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.644000,0.000000,8.318000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.356000,0.000000,8.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.356000,0.000000,9.182000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.356000,0.000000,9.182000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<20.000000,0.000000,8.115000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<20.000000,0.000000,9.385000>}
//R19 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.211200,-1.536000,9.615000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.788800,-1.536000,9.615000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<9.788800,-1.536000,9.615000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.211200,-1.536000,10.885000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.788800,-1.536000,10.885000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<9.788800,-1.536000,10.885000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<9.636400,-1.536000,10.250000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<11.363600,-1.536000,10.250000>}
//R20 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.211200,-1.536000,13.365000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.788800,-1.536000,13.365000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<9.788800,-1.536000,13.365000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.211200,-1.536000,14.635000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.788800,-1.536000,14.635000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<9.788800,-1.536000,14.635000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<9.636400,-1.536000,14.000000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<11.363600,-1.536000,14.000000>}
//R21 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.296259,0.000000,38.097797>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.907200,0.000000,38.708738>}
box{<0,0,-0.076200><0.864001,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.296259,0.000000,38.097797> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.403738,0.000000,39.212200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.792797,0.000000,38.601259>}
box{<0,0,-0.076200><0.864001,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.792797,0.000000,38.601259> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-45.000000,0> translate<31.799012,0.000000,39.104013>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-45.000000,0> translate<30.900984,0.000000,38.205984>}
//R22 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.812000,0.000000,39.526000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.948000,0.000000,39.526000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.948000,0.000000,39.526000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.948000,0.000000,38.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.812000,0.000000,38.814000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.948000,0.000000,38.814000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<15.745000,0.000000,39.170000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<17.015000,0.000000,39.170000>}
//R23 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.961200,0.000000,20.635000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.538800,0.000000,20.635000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<42.538800,0.000000,20.635000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.961200,0.000000,19.365000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.538800,0.000000,19.365000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<42.538800,0.000000,19.365000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<42.386400,0.000000,20.000000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<44.113600,0.000000,20.000000>}
//R24 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.961200,0.000000,18.135000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.538800,0.000000,18.135000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<42.538800,0.000000,18.135000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.961200,0.000000,16.865000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.538800,0.000000,16.865000>}
box{<0,0,-0.076200><1.422400,0.036000,0.076200> rotate<0,0.000000,0> translate<42.538800,0.000000,16.865000> }
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<42.386400,0.000000,17.500000>}
box{<-0.177800,0,-0.711200><0.177800,0.036000,0.711200> rotate<0,-0.000000,0> translate<44.113600,0.000000,17.500000>}
//SJ1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.022791,0.000000,30.858578>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.891419,0.000000,29.727206>}
box{<0,0,-0.101600><1.600001,0.036000,0.101600> rotate<0,-44.997030,0> translate<34.891419,0.000000,29.727206> }
object{ARC(0.254950,0.203200,33.690262,123.690262,0.036000) translate<34.750000,0.000000,32.060659>}
object{ARC(0.254950,0.203200,146.309738,236.309738,0.036000) translate<33.689338,0.000000,30.999997>}
object{ARC(0.254950,0.203200,213.690262,303.690262,0.036000) translate<34.749997,0.000000,29.939338>}
object{ARC(0.254950,0.203200,326.309738,416.309738,0.036000) translate<35.810659,0.000000,31.000000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.477206,0.000000,31.141419>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.608578,0.000000,32.272791>}
box{<0,0,-0.101600><1.600001,0.036000,0.101600> rotate<0,-44.997030,0> translate<33.477206,0.000000,31.141419> }
//SMCLK silk screen
//U$1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.745000,0.000000,15.750000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.745000,0.000000,15.750000>}
box{<0,0,-0.063500><14.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.745000,0.000000,15.750000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.745000,0.000000,15.750000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.745000,0.000000,29.750000>}
box{<0,0,-0.063500><14.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<30.745000,0.000000,29.750000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.745000,0.000000,29.750000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.745000,0.000000,29.750000>}
box{<0,0,-0.063500><14.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<16.745000,0.000000,29.750000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.745000,0.000000,29.750000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.745000,0.000000,15.750000>}
box{<0,0,-0.063500><14.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.745000,0.000000,15.750000> }
difference{
cylinder{<17.380000,0,29.148000><17.380000,0.036000,29.148000>0.347500 translate<0,0.000000,0>}
cylinder{<17.380000,-0.1,29.148000><17.380000,0.135000,29.148000>0.220500 translate<0,0.000000,0>}}
//VREF+ silk screen
//VREF- silk screen
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.300000,0.000000,45.300000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.300000,0.000000,43.200000>}
box{<0,0,-0.101600><2.100000,0.036000,0.101600> rotate<0,-90.000000,0> translate<28.300000,0.000000,43.200000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<27.600000,0.000000,40.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<26.700000,0.000000,40.700000>}
box{<0,0,-0.101600><0.900000,0.036000,0.101600> rotate<0,0.000000,0> translate<26.700000,0.000000,40.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.300000,0.000000,40.700000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.400000,0.000000,40.700000>}
box{<0,0,-0.101600><0.900000,0.036000,0.101600> rotate<0,0.000000,0> translate<21.400000,0.000000,40.700000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.700000,0.000000,43.200000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.700000,0.000000,45.300000>}
box{<0,0,-0.101600><2.100000,0.036000,0.101600> rotate<0,90.000000,0> translate<20.700000,0.000000,45.300000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.300000,0.000000,49.900000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.700000,0.000000,49.900000>}
box{<0,0,-0.101600><7.600000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.700000,0.000000,49.900000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.700000,0.000000,49.900000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.700000,0.000000,48.500000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<20.700000,0.000000,48.500000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.300000,0.000000,49.900000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<28.300000,0.000000,48.500000>}
box{<0,0,-0.101600><1.400000,0.036000,0.101600> rotate<0,-90.000000,0> translate<28.300000,0.000000,48.500000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  UNTITLED(-25.000000,0,-25.000000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//C20	--	1210ELKO
//D4	LL103A	SOD-80
//H1	SPECIAL_DRILL_0.1000	PAD_0.1000
//H2	SPECIAL_DRILL_0.1000	PAD_0.1000
//H3	SPECIAL_DRILL_0.1000	PAD_0.1000
//H4	SPECIAL_DRILL_0.1000	PAD_0.1000
//L2		L2012C
//MSP_RESET	DTSM-3	DTSM-3
//PUSH1	DTSM-3	DTSM-3
//PUSH2	DTSM-3	DTSM-3
//Q1	32768Hz	TC26H
//SJ1	SOLDERJUMPERNO	SJ_2S-NO
//X1	USBSMD	USB-MINIB
