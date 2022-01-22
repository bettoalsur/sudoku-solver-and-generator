function mat=adivinar(mat)

col=zeros(1,9);
fila=zeros(1,9);
for i=1:9
    AA=mat(:,i);
    col(i)=numel(AA(AA==0));
    AA=mat(i,:);
    fila(i)=numel(AA(AA==0));
end

col(col==0)=10;
fila(fila==0)=10;

valor=1;        %direccion fila = 1
if min(fila)>min(col)
    valor=2;    %direccion fila = 2
end                 

aux=mat;
switch valor
    
    case 1

        i=1; ok=0;
        while i<10 && ok~=1;
            [~,orden]=sort(fila);
            AA=aux(orden(i),:);
            posiciones=find(AA==0);
            valores=zeros(size(posiciones));
            cont=1;
            for j=1:9
                if numel(AA(AA==j))==0
                    valores(cont)=j;
                    cont=cont+1;
                end
            end 

            k=1; 
            while k<length(valores)+1 && ok~=1 && length(valores)==length(posiciones)
                aux(orden(i),posiciones(1))=valores(k);
                aux=resol1(aux);
                nulos=numel(aux(aux==0));
                fallos=[sum(aux) sum(aux')];
                fallos=numel(fallos(fallos==45));
                if nulos~=0 || fallos~=18
                    aux=mat;
                    k=k+1;
                else
                    ok=1;
                end

            end
            
            i=i+1;
        end
        
    case 2
        
        i=1; ok=0;
        while i<10 && ok~=1;
            [~,orden]=sort(col);
            AA=aux(:,orden(i));
            posiciones=find(AA==0);
            valores=zeros(size(posiciones));
            cont=1;
            for j=1:9
                if numel(AA(AA==j))==0
                    valores(cont)=j;
                    cont=cont+1;
                end
            end 

            k=1; 
            while k<length(valores)+1 && ok~=1 && length(valores)==length(posiciones)
                aux(posiciones(1),orden(i))=valores(k);
                aux=resol1(aux);
                nulos=numel(aux(aux==0));
                fallos=[sum(aux) sum(aux')];
                fallos=numel(fallos(fallos==45));
                if nulos~=0 || fallos~=18
                    aux=mat;
                    k=k+1;
                else
                    ok=1;
                end

            end
            
            i=i+1;
        end
end

mat=aux;

end