The script 'prepare.sh' downloads the Brown corpus from http://www.sls.hawaii.edu/bley-vroman/browntag_nolines.txt and then creates a file for each grammatical category (each P.O.S. tag) and fills that file with the words from the corpus which belong to that category.

'generate.sh NUM' takes the NUM-th sentence from the corpus and replaces each of it's words with another one of the same grammatical category.

Example:

$ ./prepare.sh
$ ./generate.sh 5
** You have selected sentence number 5 from the Brown corpus.

* Untagged sentence from the Brown corpus: 

the jury said it did find that many of Georgia's registration and election laws are outmoded or inadequate and often ambiguous .

* Sentence with P.O.S. tags: 

the_AT jury_NN said_VBD it_PPS did_DOD find_VB that_CS many_AP of_IN Georgia's_NP$ registration_NN and_CC election_NN laws_NNS are_BER outmoded_JJ or_CC inadequate_JJ and_CC often_RB ambiguous_JJ ._.

* Sentence with all words replaced by randomly selected words of the same grammatical category: 

the childhood rendered he did make that most for Pike's roleplaying and artist others are automatic and bad and diagonally ragged , 
