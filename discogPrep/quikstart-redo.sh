for (( x=100; x < 130000; x++ )); do node quikstart-shellexec.js ${x} >> FLAT_REDO; sleep 10; done;
