function mat=resol1(mat)

error=1;
while error>0
    ref=mat;
    mat=busNum(mat);
    mat=busFal(mat);
    error=sum(sum(mat-ref));
end

end