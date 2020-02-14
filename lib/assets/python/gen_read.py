# coding: utf-8 

from gensim.models import word2vec
import sys
import codecs
import types

# input = sys.argv[1]
# input2 = sys.argv[2]

#model = word2vec.Word2Vec.load('lib/assets/python/model/' + input + '.model')
model = word2vec.Word2Vec.load('lib/assets/python/model/26.model')
#similarities = model.wv.most_similar(positive = [input2])
similarities = model.wv.most_similar(positive = "デザイン")

# for word , score in similarities:
#     print(word , score)
str = 'デザイン'
print(str)
#print(similarities)