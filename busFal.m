function mat=busFal(mat)

error=1;
while error>0

    ref=mat;

    %horizontal
    for i=1:9
        %posiciones y valores faltantes
        AA=mat(i,:);
        cant=numel(AA(AA==0));
        posiciones=find(AA==0);
        valores=zeros(size(posiciones));
        cont=1;
        for j=1:9
            if numel(AA(AA==j))==0
                valores(cont)=j;
                cont=cont+1;
            end
        end  

        if cant>1 && cant==length(valores)

            for k=1:length(posiciones)
                BB=mat(:,posiciones(k));
                control=zeros(size(posiciones));
                for kk=1:length(valores)
                    control(kk)=numel(BB(BB==valores(kk)));
                end

                if numel(control(control==0))==1
                    mat(i,posiciones(k))=valores(control==0);
                end

            end

        elseif cant==1 && length(valores)==1
            mat(i,posiciones)=valores;
        end

    end

    %vertical
    for i=1:9
        %posiciones y valores faltantes
        AA=mat(:,i);
        cant=numel(AA(AA==0));
        posiciones=find(AA==0);
        valores=zeros(size(posiciones));
        cont=1;
        for j=1:9
            if numel(AA(AA==j))==0
                valores(cont)=j;
                cont=cont+1;
            end
        end  

        if cant>1 && cant==length(valores)

            for k=1:length(posiciones)
                BB=mat(posiciones(k),:);
                control=zeros(size(posiciones));
                for kk=1:length(valores)
                    control(kk)=numel(BB(BB==valores(kk)));
                end

                if numel(control(control==0))==1
                    mat(posiciones(k),i)=valores(control==0);
                end

            end

        elseif cant==1 && length(valores)==1
            mat(posiciones,i)=valores;
        end

    end

    error=sum(sum(mat-ref));

end

end




