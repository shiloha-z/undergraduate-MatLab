function outcome=conventor(a)
    bbb=[1,730];
    bbb=NaN(bbb);
    original_date=datetime(2021,1,1);
    h=height(a.Data);
    for i = 1:h
        bbb(days(a.Data.VarName3(i) - original_date)+1)=a.Data.VarName4(i);
    end
    outcome=bbb;
end