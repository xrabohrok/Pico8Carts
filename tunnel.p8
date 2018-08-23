pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
timer = 0
colors = {1,2,3,4,5,6,7,8,9,10}
last_color = 1
cur_color = 1 
adjust = 0

function _update()
	timer += 1 + adjust
	if timer > 30 then
		timer = 0
		last_color = cur_color
		cur_color = colors[flr(rnd(#colors))]
	elseif timer < 0 then
		timer = 30
		last_color = cur_color
		cur_color = colors[flr(rnd(#colors))]	
	end
	
	if btnp(2) then
		adjust +=.3
	elseif btnp(3) then
		adjust -= .3
	end
end

function _draw()
	cls()
	local draw_color = cur_color
	if adjust < 0 then
		cls(cur_color)
		draw_color = last_color
	else
		cls(last_color)
	end
	rectfill(64 - 2*timer
			,64 - 2*timer
			,65 + 2*timer 
			,65 + 2*timer,
			draw_color)

end
