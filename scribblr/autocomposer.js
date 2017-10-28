var scribblr = require('scribbletune');

// Need to insert 4 or more pattern options
// Usage: $ node autocomposer.js -n '0:1' -o '3:4' -p 'x_x_' -a 'x___' -r 8

// List Pattern Options
var pattern = { 
   '-':'hold note',
   '_':'No note',
   'x':'Place note'
};

var noteList = ['c','d','e','f','g','a','b',
		'Cmaj','Dmaj','Emaj','Fmaj','Gmaj','Amaj',
                'Cmaj#','Dmaj#','Fmaj#','Gmaj#','Amaj#',
                'Cm#','Dm#','Em','Fm#','Gm#','Am#','Bm'];


var argv = process.argv.slice(2);

if (argv)
{
        console.log(argv);
        var clipobj = {};

        for (i = 0; i < argv.length; i++)
        {
                console.log( [i] + ": " + argv[i] + " " + argv[(i + 1)] );
		var chain = flag_chk(argv[i], argv[(i + 1)]);
		console.log('key: ' + chain[0] + ' val: ' + chain[1]);
                clipobj[chain[0]] = chain[1];
		i++;
        }

	console.log('Obj: ' + clipobj);
	var audioObj = processObj(clipobj);

	var composition = scribblr.clip(audioObj);
        scribblr.midi(composition, 'test_autocomp.mid');
}



// Invocations
// logic:      -n '0:4' -o '4:6' -p '_x_x' -a '_x___' -r 8
// logic: -l 2 -n '0:4' -o '3:4' -p '_x_x' -a '_x__' -r 4
// logic: -l 1 -n '4:9' -o '4:5' -p 'x_x-x-' -a '__x__' -r 6
// logic: -l 1 -n '4:9' -o '5:7' -p 'x_x--x' -P '7:11' -a 'x____x' -r 6
// logic: -l 1 -n '4:9' -o '5:7' -p 'x_x--x' -P '7:11' -a 'x____x' -r 6 -s 1

// logic: clip = {};
// logic: clip['notes'] = set_notes(setOctave()); // RET: array list

// var clipobj = {
//          'noteLength': noteLength,
//          'notes': notes,
//          'pattern':   pattern,
//          'accentMap': pattern_accentMap,
//	     'arpegiate': {
//		distance: 7,
// 		steps: 11
//	     }
//        };

// A chord is considered a note here
// function notesList
// function notesAdd('-n','-o','valNote')
// function notesAdd('-n','-o','valNote', valNoteLength)
//
// function patternList
// function patternAdd
// function patternRepeat (-p, -a)
//
// function accentMapList (refs patternList)
// function accentMapAdd ('-a', refs patternList)


function processObj(o)
{
	var sclip = {};

	console.log('octave: ' + o['octave'].length);
	console.log('notes: ' + o['notes'].length);
	var n = o['notes'].split(':');
	var m = o['octave'].split(':');

	// Set Notes properly 
	console.log('notes n: ' + n);
	var finalnoteSet = [];
	for(i = 0; i < n.length; i++)
	{
		console.log('finalNoteset: ' +  noteList[n[i]] + m[i] );
		var fullnote = noteList[n[i]] + m[i];
		finalnoteSet[i] = fullnote;
	}
	console.log('notes: ', finalnoteSet);
	sclip['notes'] = finalnoteSet;


	console.log('pattern: ' + o['pattern']);
	console.log('repeat() ' + o['repeat']);
	console.log('accentMap: ' + o['accentMap']);

	var finalPatternSet = "";
	var finalaccSet = ""; 
	if(o['repeat'])
	{
		// console.log("DO REPEAT SET");
		// Sadly this seems not work now: finalPatternSet = o['pattern'] + '.repeat(' + o['repeat'] + ')';
		// So make our own repeat 8 times:

		for(i = 0; i < o['repeat']; i++)
		{
			finalPatternSet += o['pattern'];
			finalaccSet += o['accentMap']; 
		}
 
		sclip['pattern'] = finalPatternSet;
		sclip['accentMap'] = finalaccSet;
	}
	else
	  {
		sclip['pattern'] =  o['pattern'];
		sclip['accentMap'] = o['accentMap'];
	}


	//o['notes'][n] = o['notes'][n] + o['octave'][n];
	// SET scribblr.clip({...}) HERE
	return (sclip);
}

function flag_chk(f, v)
{

        switch (f)
        {
                case '-o':
                        console.log('octave: ' + v);
                        var oct = set_octave(v);
                        return ['octave', oct];
                case '-l':
                        console.log('noteLength : ' + v);
                        var noteLength = set_noteLength(v);
                        return ['noteLength', noteLength];
                case '-p':
                        console.log('pattern: ' + v);
                        var pattern = set_pattern(v);
                        return ['pattern', pattern];
                case '-a':
                        console.log('pattern accentMap: ' + v);
                        var accentMap = set_accentMap(v);
                        return['accentMap', accentMap];
                case '-r':
                        console.log('pattern repeat: ' + v);
                        var prepeat = set_pattern_repeat(v);
                        return['repeat', prepeat];
                case '-n':
                        console.log('note: ' + v);
                        var noteSet = set_note(v);
                        return ['notes', noteSet];
                case '-s':
                        console.log('sizzle ' + v);
                        var sizzle = set_sizzle(v);
                        return ['sizzle', sizzle];
                default:
                        console.log('Usage : $ node autocomposer.js -l 2 -n \'0:4\' -o \'3:4\' -p \'_x_x\' -a \'_x__\' -r 4');
                        // list_patternSet(); // same for both pattern and accentMap
        }

}

function set_octave(v)
{
        console.log('octave: ' + v);
        return(v);
}


function set_pattern(v)
{
        console.log('pattern: ' + v);
        return (v);
}

function set_pattern_repeat(v)
{
        console.log('.repeat: ' + v);
        return(v);
}

function set_accentMap(v)
{
        console.log("accentMap: " + v);
        return (v);
}


function set_note(v)
{
	console.log("notes: " + v);
        return (v);
	
	// var k = v.split(':');
        // console.log(k);
        // var noteSet = "";
        // for(j = 0; j < k.length; j++)
        // {
        //        console.log( [j] + ' notes: ' + k[j] + " " + noteList[k[j]] );
        //        noteSet += noteList[k[j]];
        //}
        // console.log(noteSet);
        // return (noteSet);
}

function set_noteLength(v)
{
        console.log("noteLength: " + v);
        return (v);
}

function set_sizzle(v)
{
	console.log("sizzle: " + v);
        return (v);
}

