var scribblr = require('scribbletune');

// DATA STRUCT MAIN:
// 	notes: [ARRAY], pattern: [ARRAY], accentMap: [pattern:[ARRAY]]
//
// DATA STRUCT FILL:
//	notes: [ARRAY],
//	pattern: [ARRAY]
//	accentMap: [pattern[ARRAY] OR [0,20,60...127]]
//	noteLength: '1/32';
//	arpegiate: { distance: 7, steps: 11 }
//	sizzle: true
//
//
var arrangement = {};
var octavelen = 8;
var note = ['c','d','e','f','g','a','b'];
var chord = ['Cmaj','Dmaj','Emaj','Fmaj','Gmaj','Amaj',
		'Cmaj#','Dmaj#','Fmaj#','Gmaj#','Amaj#',
		'Cm#','Dm#','Em','Fm#','Gm#','Am#','Bm'];
// var chord_majshp = ['Cmaj#','Dmaj#','Fmaj#','Gmaj#','Amaj#'];
// var chord_minshp = ['Cm#','Dm#','Em','Fm#','Gm#','Am#','Bm'];
// var chord = scribble.chord(''Cmaj'); AND scribble.listChords();

var szl; // sizzle: (boolean)

var repeat; //how many times to repeat a "phrase"
var phrase; //repeat a pattern AND accentMap 
var pattern_length = [4, 8, 16, 32, 64]; //(1, 2, 4, 8, 16)
			//noteLength: '1/4'...'1/64'
var pattern_repeat; // pattern: 'x_x_x_x-'.repeat(8);

// Seq : set_patthern_length; (setNote;setChord)


var pattern = ['x___','x_x_','x_xx','xxxx','_x__', '__x_', 
		'___x', 'xx__', 'xxx_', '__xx', '_x_x',
		'_xxx','_xx_','xx_x','x__x','x---','x_--',
		'x__-','x-x_','x-x-','_x--','_x-x','xx--',
		'xxx-','__x-','__x-','-xxx','-xx_','-x-_'];

// Redundant bit currently set to remove current parsing issue 
// with pattern[ARRAY] used for accentMap
var accentp = ['x___','x_x_','x_xx','xxxx','_x__', '__x_',
                '___x', 'xx__', 'xxx_', '__xx', '_x_x',
                '_xxx','_xx_','xx_x','x__x','x---','x_--',
                'x__-','x-x_','x-x-','_x--','_x-x','xx--',
                'xxx-','__x-','__x-','-xxx','-xx_','-x-_'];


var noteLength, pattern, pattern_accentMap, chord, note, oct;
// Usage : $ node autocomposer.js -l 64 -p 2:4:8 -a 1:4:10 -c 2 -n 3 -o 4

var argv = process.argv.slice(2);
console.log(argv);


noteLength = flag_chk(argv[0], argv[1]); // noteLength: RETVAL
pattern = flag_chk(argv[2], argv[3]); // pattern: RETVAL
pattern_accentMap = flag_chk(argv[4], argv[5]); // accentMap: RETVAL
chord = flag_chk(argv[6], argv[7]); // chord: RETVAL
note = flag_chk(argv[8], argv[9]); // note: RETVAL
oct =  flag_chk(argv[10], argv[11]); // note: RETVAL

notes = chord + oct + ' ' + note + oct; 
console.log('final note set: ' + notes);

var clipobj = {
	'noteLength': noteLength,
        'notes': notes,
        'pattern':   pattern,
        'accentMap': pattern_accentMap
};


if (clipobj && notes)
{
	console.log('JSONbit: ' + clipobj);

	var composition = scribblr.clip(clipobj);
	scribblr.midi(composition, 'autocomp.mid');
}

function flag_chk(f, v)
{
	// var noteLength, pattern, pattern_accentMap, chord, note;

	switch (f)
	{
		case '-o':
			console.log('octave: ' + v);
			return set_octave(v);
		case '-l':
			console.log('noteLength : ' + v);
			return set_noteLength(v);
		case '-p':
			console.log('pattern: ' + v);
			return set_pattern(v);
		case '-a':
			console.log('pattern accentMap: ' + v);
			return set_accentMap(v);
		case '-r':
			console.log('pattern repeat: ' + v);
			return set_pattern_repeat(v);
		case '-c':
			console.log('chord: ' + v);
			return set_note_chord(v);
		case '-n':
			console.log('note: ' + v);
			return set_note(v);
		case '-s':
			console.log('sizzle ' + v);
			return set_sizzle(v); 
		default:
			console.log('Usage : $ node autocomposer.js -l 12 -p 2:3:12 -a 0:0:4 -c 2 -n 3 -o 4');
			list_patternSet(); // same for both pattern and accentMap
	}

}

function list_patternSet()
{
	console.log('pattern + accentMap List: ');
	
	for(i = 0; i < pattern.length; i++)
	{
		console.log(': ' + i + ' ' + pattern[i]);
	}
}


function set_octave(v)
{
        console.log('octave: ' + v);
        return(v);
}


function set_pattern(v)
{
	var k = v.split(':');
	console.log(k);

	var set = "";
	for(i = 0; i < k.length; i++)
	{
		console.log( k[i] + " " + pattern[k[i]] );
		set += pattern[k[i]];
	}

	console.log(set);
	return set;
}

function set_pattern_repeat(v)
{
	console.log('pattern/accent repeat: ' + v);
	return(v);
}

function set_accentMap(v)
{
	var k = v.split(':');
        console.log(k);

        var aset = "";
        for(j = 0; j < k.length; j++)
        {
                console.log( 'Accent Map: ' + k[j] + " " + accentp[k[j]] );
                aset += accentp[k[j]];
        }

        console.log(aset);
        return aset;
}


function set_note_chord(v)
{
	console.log("notes: " + chord[v]);
	return (chord[v]);
}

function set_note(v)
{
	console.log("notes: " + note[v]);
	return (note[v]);
}

function set_noteLength(v)
{
	console.log("noteLength: " + v);
	return (v);
}

function set_sizzle(v)
{
	
}
