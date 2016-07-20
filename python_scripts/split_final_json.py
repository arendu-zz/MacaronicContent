#!/usr/bin/env python
__author__ = 'arenduchintala'
import sys
import codecs
from optparse import OptionParser
import json
reload(sys)
sys.setdefaultencoding('utf-8')
sys.stdin = codecs.getreader('utf-8')(sys.stdin)
sys.stdout = codecs.getwriter('utf-8')(sys.stdout)
sys.stdout.encoding = 'utf-8'

if __name__ == '__main__':
    opt = OptionParser()
    #insert options here
    opt.add_option('-j', dest='json_list_file')
    opt.add_option('-t', dest='tok_file')
    opt.add_option('-o', dest='out_folder')
    (options, _) = opt.parse_args()

    json_data = json.loads(codecs.open(options.json_list_file, 'r' , 'utf8').read())

    tok_data = codecs.open(options.tok_file, 'r', 'utf8').readlines()

    print len(tok_data), len(json_data)
    article_lines = []
    article_count = 0
    title = None
    for jd_line, (tok,jd) in enumerate(zip(tok_data, json_data)):
        if tok.strip() == 'Artikel' or tok.strip() == '&lt; NEW _ STORY &gt;':
            if len(article_lines) > 0:
                article_json_str = json.dumps(article_lines, indent=4, sort_keys = True)
                w = codecs.open(options.out_folder +'/' + title + '.json' , 'w', 'utf8')
                w.write(article_json_str)
                w.flush()
                w.close()
                title = None
                article_count += 1
                article_lines = []
            else:
                pass    
        else:
            if len(article_lines) == 0:
                title = tok.strip()
            article_lines.append(jd)

