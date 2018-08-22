pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
echo_count = 30
echo_step = 3

start_width = 100
start_height = 32

curr_width = start_width

spin_phase = 180
current_phase = 0
flipped = false
x_disp = 0


function draw_logo(x,y, my_phase, blue_alt, green_alt)
	pal (1, blue_alt)
	pal (11, green_alt)
	
	curr_width = start_width * 
	cos(my_phase/
		spin_phase)
		
	x_disp = start_width/2 * 
	cos(my_phase/
		spin_phase + .5) + start_width/2
	
	sspr(8,0, 55,15, 
		x + x_disp  
		, y, 
 	curr_width , 
 	start_height)	
 pal()
end

function _update()
	
 current_phase += 1
 if current_phase > spin_phase then
 	current_phase = 0
 	flipped = not flipped
 end

end

function draw_logo_echo()
	y_down = 32 + echo_count 
 	* (echo_step)
 i = 0
 while i < echo_count do
 	draw_logo(28, 
 		y_down - i * echo_step,
 		current_phase - 
 			(echo_count - i),
 			1,2
 		)
 		
 	i += 1
 end
end

function _draw()
 cls()
 palt(0, true)
 
 --draw backwards
 draw_logo_echo()
 
 draw_logo(28 ,32, 
 current_phase, 12, 11)

end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000001100000000000001111000bbb000000000bbb000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000000111100001100001111111000bbb0000000bbb0000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700000011111100011000111000111000bbb00000bbb00000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000010000100011000110000011000bbb0000bbb000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000100001000110011000000000000bbb000bb0000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000011000011001100110000000000000bbbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000110000110011001100000000000000bbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000111111110011001100000000000000bbbbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000011111111001100110000000000000bbb0bbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001100001100110011100000110000bbb000bbb000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000110000110011000110000111000bbb00000bbb00000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000011000011001100011111111000bbb0000000bbb0000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000001100001100110000011111000bbb000000000bbb000000000000000000000000000000000000000000000000000000000000000000000000000000
