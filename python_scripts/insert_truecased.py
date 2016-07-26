#!/usr/bin/env python
__author__ = 'arenduchintala'
import sys
import codecs
import argparse
reload(sys)
sys.setdefaultencoding('utf-8')
sys.stdin = codecs.getreader('utf-8')(sys.stdin)
sys.stdout = codecs.getwriter('utf-8')(sys.stdout)
sys.stdout.encoding = 'utf-8'

if __name__ == '__main__':
    opt= argparse.ArgumentParser(description="write program description here")

    #insert options here
    opt.add_argument('-t', action='store' , dest='truecased_txt', default='', required = True)
    opt.add_argument('-w', action='store' , dest='wa_txt', default='', required = True)
    #opt.add_argument('-w', action='store_true' ,dest='example_option2', default=False, required = True)
    options = opt.parse_args()

    truecased_lines = codecs.open(options.truecased_txt, 'r' , 'utf8').readlines()
    truecased_lines = [tl.strip().split() for tl in truecased_lines]
    wa_lines = codecs.open(options.wa_txt, 'r', 'utf8').readlines()
    for wal_idx, wal in enumerate(wa_lines):
        tl_lines = truecased_lines[wal_idx]
        toks = [t.strip() for idx,t in enumerate(wal.strip().split('|')) if idx % 2 == 0]
        tc_toks = []
        #print ' '.join(toks)
        t_idx = 0
        for t in toks:
            w_t = tl_lines[t_idx: len(t.split()) + t_idx]
            if  (' '.join(w_t)).lower() == t.lower():
                t = ' '.join(w_t)
                tc_toks.append(t)
            else:
                tc_toks.append(t)
            t_idx += len(t.split())
        #print ' '.join(tc_toks)
        new_wal_str = ''
        for idx, wa in enumerate(wal.strip().split('|')):
            if idx % 2 == 0:
                tc_t = tc_toks[idx // 2]
                new_wal_str += tc_t
            else:
                new_wal_str += '|' + wa + '| '
        new_wa_str = new_wal_str.strip()
        assert new_wa_str.lower() == wal.strip().lower()
        print new_wa_str
        










