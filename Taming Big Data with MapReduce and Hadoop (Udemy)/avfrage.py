from mrjob.job import MRJob

class avfrandbyage (MRJob):
    def mapper(self,key,line):
        (userID,name,age,nooffriend)=line.split(',')
        yield age,nooffriend
    def reducer(self,age,nooffriend):
        numfrand=[]
        for m in nooffriend:
            numfrand.append(int(m))
        avgfrand=float(sum(numfrand)/float(len(numfrand)))
        yield age,avgfrand
if __name__ == '__main__':
    avfrandbyage.run()
