var scribble = require('scribbletune');

var hh = scribble.clip({
	notes:     'c#5',
	pattern:   'x___x_xxx___x___',
	accentMap: 'x_______x_______'
});

var bd = scribble.clip({
	notes:     'c#3',
	pattern:   'x___'.repeat(4),
	accentMap: 'x___'.repeat(4)
});

var tm = scribble.clip({
	notes:     'f#3',
	pattern:   'x_x___x___x_x___',
	accentMap: 'x_x_____x_x___x_'
});

var bs = scribble.clip({
	notes:     'g#2',
	pattern:   'x_x_____x____x__',
	accentMap: 'x_______x_______'
});

var chrd = scribble.clip({
	notes: 'CMaj#4 FMaj#4 BMaj#4 EMaj#4 AMaj#4 DMaj#4 GMaj#4 Cmb4',
	pattern:   'x_x_x_x_x_x_x_x_',
	accentMap: 'x_x_____x_x___x_'
});

// Render a MIDI file of this clip
scribble.midi(chrd, 'chord.mid');
scribble.midi(hh, 'hh.mid');
scribble.midi(bd, 'bd.mid');
scribble.midi(tm, 'tm.mid');
scribble.midi(bs, 'bs.mid');


