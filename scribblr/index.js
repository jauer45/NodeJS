var scribble = require('scribbletune');


var mvA  = scribble.clip({
	notes:     'FMaj#4 BMaj#4 EMaj#4 AMaj#4 DMaj#4 GMaj#4 Cmb4 Fmb4',
	pattern:   'x_x_x_x_x_x_x_x_',
	accentMap: 'x___x___x___x___'
});

var mvB = scribble.clip({
	notes:     'BMaj#4 EMaj#4 AMaj#4 DMaj#4 GMaj#4 Cmb4 Fmb4 Bmb4',
	pattern:   'x_x_x___x_x_x_x_',
	accentMap: 'x___x___x_______'
});

var mvC = scribble.clip({
	notes:     'EMaj#4 AMaj#4 DMaj#4 GMaj#4 Cmb4 Fmb4 Bmb4 Emb4',
	pattern:   'x_x_x_x_x_x_x_x_',
	accentMap: 'x___x___x___x___'
});

var mvD = scribble.clip({
	notes:     'AMaj#4 DMaj#4 GMaj#4 Cmb4 Fmb4 Bmb4 Em4 Am4',
	pattern:   'x_x_x___x_x_x_x_',
	accentMap: 'x___x___x_______'
});

var mvE = scribble.clip({
        notes:     'DMaj#4 GMaj#4 Cmb4 Fmb4 Bmb4 Em4 Am4 Dm4',
        pattern:   'x_x_x_x_x_x_x_x_',
        accentMap: 'x___x___x___x___'
});

var mv = scribble.clip({
	notes: 'CMaj#4 FMaj#4 BMaj#4 EMaj#4 AMaj#4 DMaj#4 GMaj#4 Cmb4',
	pattern:   'x_x_x_x_x_x_x_x_',
	accentMap: 'x___x___x_______'
});


// Render a MIDI file of this clip
scribble.midi( mv.concat( mvA.concat( mvB.concat( mvC.concat( mvD.concat( mvE, 'TrackOne.mid') ) ) ) ) );
