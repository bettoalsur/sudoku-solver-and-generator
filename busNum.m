function mat=busNum(mat)

error=1;
while error>0
    
    ref=mat;

    for num=1:9

        aux=mat;

        %10 todos las celdas ocupadas y las descartadas
        for x=1:9
            for y=1:9
                if aux(x,y)==num
                    aux(x,:)=10;
                    aux(:,y)=10;
                    if x>0 && x<4 && y>0 && y<4
                        aux(1:3,1:3)=10;
                    elseif x>0 && x<4 && y>3 && y<7
                        aux(1:3,4:6)=10;
                    elseif x>0 && x<4 && y>6 && y<10
                        aux(1:3,7:9)=10;
                    elseif x>3 && x<7 && y>0 && y<4
                        aux(4:6,1:3)=10;
                    elseif x>3 && x<7 && y>3 && y<7
                        aux(4:6,4:6)=10;
                    elseif x>3 && x<7 && y>6 && y<10
                        aux(4:6,7:9)=10;
                    elseif x>6 && x<10 && y>0 && y<4
                        aux(7:9,1:3)=10;
                    elseif x>6 && x<10 && y>3 && y<7
                        aux(7:9,4:6)=10;
                    else 
                        aux(7:9,7:9)=10;
                    end
                elseif aux(x,y)~=num  && aux(x,y)~=0
                    aux(x,y)=10;
                end
            end
        end
        
        %matriz de busquedas
        parabuscar=aux;

        %por sectores
        for i=[1 4 7]
            for j=[1 4 7]
            AA=parabuscar(i:i+2,j:j+2);
                if sum(sum(AA))==80
                    AA(AA==0)=num;
                    aux(i:i+2,j:j+2)=AA;
                end
            end
        end

        %por filas
        for i=1:9
            AA=parabuscar(i,:);
                if sum(AA)==80
                    AA(AA==0)=num;
                    aux(i,:)=AA;
                end
        end

        %por columnas
        for j=1:9
            AA=parabuscar(:,j);
                if sum(AA)==80
                    AA(AA==0)=num;
                    aux(:,j)=AA;
                end
        end
        
        %agregar numeros encontrados a la matriz nueva
        for x=1:9
            for y=1:9
                if aux(x,y)~=10 && aux(x,y)~=0
                   mat(x,y)=aux(x,y);
                end
            end
        end
        
    end
    
    error=sum(sum(mat-ref));
    
end

end