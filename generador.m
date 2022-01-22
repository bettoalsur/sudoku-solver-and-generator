function [solucion,mat,mensaje2]=generador(borrar,dif)

intentos=0;
ok=0;
while ok~=1

    %sector 1
    mat=zeros(9,9);
    sec1=randperm(9);
    mat(1,1:3)=sec1(1:3);
    mat(2,1:3)=sec1(4:6);
    mat(3,1:3)=sec1(7:9);

    %completar fila 1
    fila1=mat(1,1:9);
    valores=zeros(1,6);
    cont=1;
    for j=1:9
        if numel(fila1(fila1==j))==0
            valores(cont)=j;
            cont=cont+1;
        end
    end
    mat(1,4:9)=valores(randperm(6));

    %fila 2 / sector 2
    fila22=[mat(2,1:3) mat(1,4:6)];
    valores1=zeros(1,1);
    cont=1;
    for j=1:9
        if numel(fila22(fila22==j))==0
            valores1(cont)=j;
            cont=cont+1;
        end
    end

    comprobador=0;
    while comprobador~=3;
        orden=randperm(length(valores1));
        mat(2,4:6)=valores1(orden(1:3));

        %fila 3 / sector 2
        fila3=[mat(3,1:3) mat(1,4:6) mat(2,4:6)];
        valores2=zeros(1,1);
        cont=1;
        for j=1:9
            if numel(fila3(fila3==j))==0
                valores2(cont)=j;
                cont=cont+1;
            end
        end
        comprobador=length(valores2);
    end
    mat(3,4:6)=valores2(randperm(3));

    %fila 2 / sector 3 
    fila23=mat(2,1:6);
    valores3=zeros(1,3);
    cont=1;
    for j=1:9
        if numel(fila23(fila23==j))==0
            valores3(cont)=j;
            cont=cont+1;
        end
    end
    mat(2,7:9)=valores3(randperm(3));

    %fila 3 / sector 3
    fila33=mat(3,1:6);
    valores3=zeros(1,3);
    cont=1;
    for j=1:9
        if numel(fila33(fila33==j))==0
            valores3(cont)=j;
            cont=cont+1;
        end
    end
    mat(3,7:9)=valores3(randperm(3));

    %completar columna 1
    col1=mat(1:9,1);
    valores=zeros(6,1);
    cont=1;
    for j=1:9
        if numel(col1(col1==j))==0
            valores(cont)=j;
            cont=cont+1;
        end
    end
    mat(4:9,1)=valores(randperm(6));

    %columna 2 / sector 4
    col24=[mat(4:6,1)' mat(1:3,2)'];
    valores1=zeros(1,1);
    cont=1;
    for j=1:9
        if numel(col24(col24==j))==0
            valores1(cont)=j;
            cont=cont+1;
        end
    end

    comprobador=0;
    while comprobador~=3;
        orden=randperm(length(valores1));
        mat(4:6,2)=valores1(orden(1:3));

        %columna 3 / sector 4
        col3=[mat(1:3,3)' mat(4:6,1)' mat(4:6,2)'];
        valores2=zeros(1,1);
        cont=1;
        for j=1:9
            if numel(col3(col3==j))==0
                valores2(cont)=j;
                cont=cont+1;
            end
        end
        comprobador=length(valores2);
    end
    mat(4:6,3)=valores2(randperm(3));

    %columna 2 / sector 7 
    col27=mat(1:6,2)';
    valores3=zeros(1,3);
    cont=1;
    for j=1:9
        if numel(col27(col27==j))==0
            valores3(cont)=j;
            cont=cont+1;
        end
    end
    mat(7:9,2)=valores3(randperm(3));

    %columna 3 / sector 7 
    col37=mat(1:6,3)';
    valores3=zeros(1,3);
    cont=1;
    for j=1:9
        if numel(col37(col37==j))==0
            valores3(cont)=j;
            cont=cont+1;
        end
    end
    mat(7:9,3)=valores3(randperm(3));

    %%% ETAPA 1 - OK %%%

    %numero 1 / sector 6
    num16=[mat(4,1:3) mat(1:3,7)'];
    valores=zeros(1,1);
    cont=1;
    for j=1:9
        if numel(num16(num16==j))==0
            valores(cont)=j;
            cont=cont+1;
        end
    end
    mat(4,7)=valores(randi(length(valores),1,1));

    %numero 2 / sector 6
    num26=[mat(4,1:3) mat(1:3,8)' mat(4,7)];
    valores=zeros(1,1);
    cont=1;
    for j=1:9
        if numel(num26(num26==j))==0
            valores(cont)=j;
            cont=cont+1;
        end
    end
    mat(4,8)=valores(randi(length(valores),1,1));

    %numero 3 / sector 6
    num36=[mat(4,1:3) mat(1:3,9)' mat(4,7:8)];
    valores=zeros(1,1);
    cont=1;
    for j=1:9
        if numel(num36(num36==j))==0
            valores(cont)=j;
            cont=cont+1;
        end
    end
    mat(4,9)=valores(randi(length(valores),1,1));
    
    %%% ETAPA 2 - OK %%%
    
    %numero 1 / sector 8
    num18=[mat(9,1:3) mat(1:3,4)'];
    valores=zeros(1,1);
    cont=1;
    for j=1:9
        if numel(num18(num18==j))==0
            valores(cont)=j;
            cont=cont+1;
        end
    end
    mat(9,4)=valores(randi(length(valores),1,1));
    
    %numero 2 / sector 8
    num28=[mat(9,1:4) mat(1:3,5)'];
    valores=zeros(1,1);
    cont=1;
    for j=1:9
        if numel(num28(num28==j))==0
            valores(cont)=j;
            cont=cont+1;
        end
    end
    mat(9,5)=valores(randi(length(valores),1,1));
    
    %numero 3 / sector 8
    num38=[mat(9,1:5) mat(1:3,6)'];
    valores=zeros(1,1);
    cont=1;
    for j=1:9
        if numel(num38(num38==j))==0
            valores(cont)=j;
            cont=cont+1;
        end
    end
    mat(9,6)=valores(randi(length(valores),1,1));
    
    %%% ETAPA 3 - EN PRUEBAS %%%
    
    mat=resol1(mat);
    if numel(mat(mat==0))~=0
        mat=adivinar(mat);
    end

    nulos=numel(mat(mat==0));
    fallos=[sum(mat) sum(mat')];
    fallos=numel(fallos(fallos==45));

    if fallos==18 && nulos==0
        ok=1;
    end
    
    %%% AUTOCOMPLETAR 3 - OK %%%
    
    intentos=intentos+1;
end

mensaje1=strcat([num2str(intentos),' intentos generando']);

%%% Eliminar valores para poder jugar %%%

solucion=mat;
intentos=0;
ok=0;
while ok~=1
    
    mat=solucion;
    [fila,columna]=ind2sub([9,9],randperm(81));
    for i=1:borrar
        mat(fila(i),columna(i))=0;
    end

    aux=resol1(mat);
    if numel(aux(aux==0))==0
        ok=1;
    end
    intentos=intentos+1;
end

mensaje2=strcat([mensaje1,' y ',num2str(intentos),' eliminando']);

mat1=mat; %facil

ok=0;
while ok~=1 && borrar<82
    
    anterior=mat;
    mat(fila(borrar+1),columna(borrar+1))=0;
    aux=resol1(mat);
    if numel(aux(aux==0))~=0
        ok=1;
    end
    borrar=borrar+1;
    
end

mat2=anterior; %normal
mat3=mat; %dificil
mat(fila(borrar+1),columna(borrar+1))=0;
mat4=mat; %muy dificil

switch dif
    case 1
        mat=mat1;
    case 2
        mat=mat2;
    case 3
        mat=mat3;
    case 4
        mat=mat4;
end



end %%fin de la funcion











