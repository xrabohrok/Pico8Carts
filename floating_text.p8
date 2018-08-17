pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

initialized = false
lines = {}

function setup_words(
	amplitude,
	period,
	words,
	x,
	y,
	rainbow
	)

		set = {}
		set.vamplitude = amplitude
		set.period = period
		set.currentperiod = 0
		set.words = words
		set.base_y = y
		set.base_x = x
		set.col = rainbow
		
		return set

end

thing = setup_words( 10, 30, 
	"blah ha ha", 30, 35, 7)

function makedance(set)
	x = 0
	set.currentperiod += 1
	while (x < #set.words) do
	
		this_period = set.currentperiod
			+ x
		xdisp = set.vamplitude *
			cos(this_period / set.period)
	
		ydisp = set.vamplitude *
			sin(this_period / set.period)	
		
		
		print (sub(set.words, x, x+1), 
				x * 4 + xdisp + set.base_x,
				ydisp + set.base_y,
				set.col)
				

		x += 1
	end
end

function _update()

	if not initialized then
		echo = 100
		color_seq = 
			{3, 11, 1, 12,13}
		
		amplitude = 10
		amplitude_shift = 3
		period = 130
		words = "does this work?"
		
		i = 0
		while i < echo do
			i += 1
			
			iter = setup_words( amplitude, 
				period, 
				words, 30, 35, 
				color_seq[i % #color_seq])
			iter.currentperiod = i % period
			iter.vamplitude += i/amplitude_shift
			add(lines, iter)
		
		end
		lines[#lines].col = 7
		initialized = true
	end

end

function _draw()
	cls()
	
	foreach(lines, makedance)
	
end
