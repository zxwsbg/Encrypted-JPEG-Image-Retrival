function result=GetBlockACUnit4(BlockAc)
BlockAc=BlockAc';
BlockAc=BlockAc(:);
BlockAc(1)=[];
order = [0 1 5 6 14 15 27 28;2 4 7 13 16 26 29 42;3 8 12 17 25 30 41 43;9 11 18 24 31 40 44 53;10 19 23 32 39 45 52 54;20 22 33 38 46 51 55 60;21 34 37 47 50 56 59 61;35 36 48 49 57 58 62 63];
order=order';
order=order(:);
order(1)=[];
BlockAcOrder(order)=BlockAc;   %BlockAcOrder°´z×ÖÐÍÅÅÐò¡£
i=1;
count=0;
result=[];
while i<=63
    if BlockAcOrder(i)~=0  
        result=[result;count BlockAcOrder(i)];
        count=0;
    else if sum(abs(BlockAcOrder(i:end)))==0
            result=[result;0 0];
            break;
        else
            count=count+1;
        end
    end
    i=i+1;
end
end