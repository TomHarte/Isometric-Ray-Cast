# Isometric Ray Casting, Ahoy!

A demo of zero-overdraw isometric drawing for the ZX Spectrum currently featuring the Ant Attack map:

![Sample scrolling](READMEImages/isoscroll.gif)

# Stats

At fullscreen: 15 fps.

At just larger than the window in Ant Attack: 26 fps.

Memory usage:
* 16kb for the map, exactly like Ant Attack;
* the full screen of 6,912 bytes is used; and
* at 32x14, a further 7,578 bytes is used for tables and all existing code; at 32x24 this grows to 9,478 bytes.

Therefore on a 48kb Spectrum there remains around 16kb of space for other graphics and game code at 32x24. If further space were needed then the above spends about 2kb on unrolling the final 2d output stage, for a saving of only of the order of 10,000 cycles. That could be reclaimed.

# Build Requirements

This project is built with [Pasmo](https://github.com/spec-chum/pasmo), an assembler that can directly write ZX Spectrum-style .TAP files. Also in this repository are a small number of C or C++ programs that I used to generate data ahead of time. These are not part of the live build process; their output has already been captured. Nevertheless they should build with any standard C or C++ compiler.

# History

In May 2021 I made the public observation that the map of the ZX Spectrum game, Ant Attack, permits a special case of isometric drawing in which the drawer merely selects which colour to apply to every triangle in a pattern like:

![Grid of isosceles triangles](READMEImages/isogrid.svg)

I also observed that the colour for each triangle can be selected using a front-to-back ray-casting-esque search.

Specifically, for each pair of triangles that join on a vertical edge, start at the top of the level and while either side remains uncoloured:

1. if there is a cube at this position in the grid, paint both with the top-of-cube colour;
2. otherwise if there is a cube at the same elevation and one column to the left in screen space, paint the left with the right-surface colour;
3. similarly, if there is a cube at the same elevation and one column to the right in screen space, paint the right with the left-surface colour;
4. failing all of that, if there is a cube at the same elevation but directly behind in screen space, paint the left with the left-surface colour and the right with the right-surface colour.

Then if necessary proceed one cube down and one column back in screen space and continue. Which is casting a ray from front to back for each triangle that needs to be coloured.

Furthermore, since the grid is completely fixed, the actual pixel plotting can be done by simple image lookup. No need for triangle rasterisation at runtime.

# Controversial?

My further assertion that this algorithm was simple enough for a ZX Spectrum seemed to cause controversy. I was told the following:

> That's how voxel-based games on PCs work, but the Spectrum doesn't have the processing power to work like that. 

I disagreed.

> Since this is a Spectrum forum, how about a version that runs on a Spectrum then? Otherwise, you've proved nothing. [rolls eyes]

I stated that I wasn't the most competent Z80 programmer, and it was logically invalid to claim a perfect correlation the workability of an algorithm and the implementation by someone like me.

> So what you're saying is ... you still think you know better than everyone on a dedicated Spectrum forum?
>
> ... each of your steps through the map goes through a seemingly endless set of nested if/else conditions when it would be far, far faster to simply draw the block over whatever's there and move on.

In response this project demonstrates workability on a ZX Spectrum.

It doesn't seek to be a complete game engine, or a complete game, because I have none in mind. It's purely an attempt to translate this approach into Z80 code for better evaluation.

# Approach

In Ant Attack the cube at (x, y, z) is represented by bit z at (x, y) in the internal map.

This project swizzles that: the cube at (x, y, z) is now represented by bit z at (x + z, y + z). So all original 3d data is present, and the ray casting algorithm as above is in use but the per-diamond code becomes as simple as:

	const uint8_t front = highest(swizzle(x, y));
	const uint8_t left = highest(swizzle(x-1, y));
	const uint8_t right = highest(swizzle(x, y-1));
	const uint8_t back = highest(swizzle(x-1, y-1));
	int left_colour;

	if(!(front | back | left)) {
		left_colour = 0;
	} else if(front >= left) {
		if(front >= back) {
			left_colour = 1;
		} else {
			left_colour = 2;
		}
	} else {
		if(left >= back) {
			left_colour = 3;
		} else {
			left_colour = 2;
		}
	}

... plus the equivalent to pick right_colour with `front`, `back` and `right`.

`highest` is a function that returns an int with only the highest bit of the original set.

Results from that are stored in a 32x49 array, from which values are then picked in threes to select 8x8 graphics tiles which are copied to the display.
