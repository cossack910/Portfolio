# coding: utf-8
 
from janome.tokenizer import Tokenizer
from gensim.models import word2vec
import sys,io
import codecs
import types

input = sys.argv[1]
input2 = sys.argv[2]

sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8') # UTF-8に
model = word2vec.Word2Vec.load('lib/assets/python/model/' + input + '.model')
similarities = model.wv.most_similar(input2)

t = Tokenizer()

for word , score in similarities:
    tokens = t.tokenize(word)#形態素解析
    r = []
    for tok in tokens:
        if tok.base_form == "*": #単語の基本形を採用
            w = tok.surface
        else:
            w = tok.base_form
            ps = tok.part_of_speech#品詞情報
            hinsi = ps.split(',')[0]
            if hinsi in ['名詞','形容詞']:
                print(word, score)