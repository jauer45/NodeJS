var scribble = require('scribbletune');

var clip = scribble.clip({
	notes: 'c#4 f#4 b#4 e#4 a#4 d#4 g#4 cb4',
	pattern:   'x_x_x_x_x_x_x_x_',
	accentMap: 'x_x_____x_x___x_'
});

// Render a MIDI file of this clip
scribble.midi(clip, 'scale.mid');
