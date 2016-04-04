__author__ = 'arenduchintala'
import sys
import codecs
from optparse import OptionParser
reload(sys)
sys.setdefaultencoding('utf-8')
sys.stdin = codecs.getreader('utf-8')(sys.stdin)
sys.stdout = codecs.getwriter('utf-8')(sys.stdout)
sys.stdout.encoding = 'utf-8'

if __name__ == '__main__':
    opt = OptionParser()
    #insert options here
    opt.add_option('-b', dest='base_option', default='')
    opt.add_option('-o', dest='out_option', default='')
    opt.add_option('-s', dest='start', default='')
    opt.add_option('-e', dest='end', default='')
    (options, _) = opt.parse_args()
    if options.base_option == '' or options.out_option == ''  or options.start == '' or options.end == '':
        sys.stderr.write("Usage: python make_batch.py -b [base file e.g. nachrichtenleicht.de] -o [ouput prefix] -s [start line] -e [end line]\n")
        exit(1)
    else:
        pass
    start = int(options.start)
    end = int(options.end)
    input_parsed = codecs.open(options.base_option+'.tok.dep.parsed', 'r', 'utf-8').read().split('\n\n')[start:end] 
    input_mt = codecs.open(options.base_option + '.tok', 'r', 'utf-8').readlines()[start:end]
    wa  = codecs.open(options.base_option + '.wa', 'r', 'utf-8').readlines()[start:end]
    unsplit_wa  = codecs.open(options.base_option + '.unsplit', 'r', 'utf-8').readlines()[start:end]

    w = codecs.open(options.out_option + '.tok.dep.parsed' ,'w', 'utf8')
    w.write('\n\n'.join(input_parsed))
    w.flush()
    w.close()
    w = codecs.open(options.out_option + '.tok','w', 'utf8')
    w.write(''.join(input_mt))
    w.flush()
    w.close()

    w = codecs.open(options.out_option + '.wa','w', 'utf8')
    w.write(''.join(wa))
    w.flush()
    w.close()

    w = codecs.open(options.out_option + '.unsplit','w', 'utf8')
    w.write(''.join(unsplit_wa))
    w.flush()
    w.close()



