from gensim.models import word2vec
import sys

input = sys.argv[1]
input2 = sys.argv[2]

model = word2vec.Word2Vec.load('lib/assets/python/model/' + input + '.model')

similarities = model.wv.most_similar(positive = [input2])

for word , score in similarities:
    print(word , score)