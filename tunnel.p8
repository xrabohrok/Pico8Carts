pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--update and draw

function make_wall()
	wall = {}
 --wall.last_color = 1
 wall.cur_color = 1
 wall.timer = 0
 return wall
end

all_walls={}
wall_count = 10
colors = {1,2,3,4,5,6,7,8,9,10}
 
adjust = 1

function _init()
	i = 0
	while i < wall_count do
		i+= 1
		local wall = make_wall()
		wall.timer = i * (30/wall_count)
		wall.cur_color = new_color()
		add(all_walls, wall)
	end
end

function new_color()
	return colors[flr(rnd(#colors))]
end

function update_walls(wall)
	wall.timer += adjust
	
	if wall.timer > 30 then
		wall.timer = 0
		wall.cur_color = new_color()
	
	elseif wall.timer < 0 then
		wall.timer = 30
		wall.cur_color = new_color()
		
	end
end

function _update()

	foreach(all_walls, update_walls)
	
	if btnp(2) then
		adjust +=.3
	elseif btnp(3) then
		adjust -= .3
	end
end

function _draw()
	cls()

	x = 1
	start = 0
	biggest = 0
	while x <= #all_walls do
		if(all_walls[x].timer > biggest) then
			start = x
			biggest = all_walls[x].timer
		end
		x += 1
	end
	
	count = 0
	j = start
	
	while count < #all_walls do
		count +=1
		
		rectfill(
				64 - 2*all_walls[j].timer
			,64 - 2*all_walls[j].timer
			,65 + 2*all_walls[j].timer 
			,65 + 2*all_walls[j].timer,
			all_walls[j].cur_color)
			
		--	if adjust > 0 then
			j -= 1
		--	else 
		--		j += 1
		--	end
			
			if j > #all_walls then
				j = 1
			elseif j < 1 then
				j = #all_walls
			end
	end

end
