# PUC-INF1407
Programação para a Web

## Geral

**G1**: 2 Trabalhos práticos  
**G2**: 2 Trabalhos práticos  
**M**: (G1+G2)/2  

Trabalho prático é uma prova em sala de aula com consulta ao material

**Site da Matéria**: http://cursos.meslin.com.br/home/Programao-para-a-Web

## G1

### Instalar  
* [Instalar Java (JRE)](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html)  
* [Instalar servidor Web e container JSP](http://tomcat.apache.org/download-90.cgi)  
* [Instalar Eclipse EE](http://www.eclipse.org/)  

Extrair **apache-tomcat-x.x.x.zip**  

Eclipse EE > Window > Preferences > Java > Installed JREs  
Verifique se tem algum **jre** selecionado e se o Type dele está **Standard VM**  
Se não tiver  
Add > Standard VM > Directory...  
Selecione a pasta do **jre**  
Clique finish.

Eclipse EE > Window > Preferences > Server > Runtime Environments > Add... > **Apache Tomcat vx.x** > Next > Browse...  
Selecione o **apache-tomcat-x.x.x.zip**  
JRE > jrex.x.x > Finish > Apply and Close  

### Criando projeto

File > New > Other > Wizards:  
Escreva "web"  
Dynamic Web Project > Next > Project Name  
De um nome ao seu filho  
Next > Next > **Genereate web.xml deployment descriptor**  

### Criando página HTML
Abra o projeto, vá até a pasta **WebContent**  
Clique com o botão direito em **WebContent** > New... > Other >  
Escreva HTML, selecione **HTML file**  
Next > File Name  
Apenas de um nome   
Next > **New HTML File(5)** > Finish  

### Criando página JSP
Abra o projeto, vá até a pasta **WebContent**  
Clique com o botão direito em **WebContent** > New... > Other >  
Escreva JSP, selecione **JSP file**  
Next > File Name  
Apenas de um nome  
Next > **New JSP File(html)** > Finish  

### Rodando o site
Botão direito no projeto > Run As > Run on server > **Tomcat vx.x Server**  > Finish  
Vai abrir na página inicial

Botão direito em uma das páginas > Run As > Run on server > **Tomcat vx.x Server**  > Finish  
Vai abrir na página selecionada

### Criando servlet  
Vá na pasta  
Java Resources > src  
Clique com botão direito  
New > Other... >  
Escreva servlet, selecione **Servlet**  
Next > Escolha um pacote > Escolha um nome > Next > URL mappings  
Aqui é onde você escolhe o endereço virtual (o endereço que o usuário/server tem que acessar para ir pra esse servlet)  
Selecione os métodos que já deseja no servlet > Finish  

### Instalando biblioteca externa (método do professor)
Baixe **jstl-api-1.2.jar** e **jstl-impl-1.2.jar** no site do professor  
Clique com botão direito no projeto  
Build Path > Configure Build Path > Aba "Libraries" > Add Library... > User Library > Next > User Libraries... > New... > De o nome de JSTL > Add External JARs... >  
Procure o arquivo **jstl-api-1.2.jar** e clique abrir  
Selecione a Library JSTL  
Add External JARs... >  
Procure o arquivo **jstl-impl-1.2.jar** e clique abrir   
Apply and Close > Finish > Aba "Order and Export" > Selecione JSTL > Apply and Close  

Agora verifique se você tem a aba "Problems" aberta (fica perto da aba "Console"), se não tiver aberta vá em  
Window > Show view > Other... > Escreva "Problems" > Selecione "Problems" > Abrir  
Agora que está aberto você deve ter um aviso do tipo  
`Classpath entry org.eclipse.jdt.USER_LIBRARY/JSTL will not be exported or published. Runtime ClassNotFoundExceptions may result.`  
Clique com o botão direito em cima desse aviso > Quick Fix > Finish  

### Instalando biblioteca externa (método google)
Baixe [JSTL](http://central.maven.org/maven2/javax/servlet/jstl/1.2/jstl-1.2.jar)  
Bote na pasta **WebContent/WEB-INF/lib**  

*A outra maneira não parecia estar funcionando pois o código na página JSP não funcionava, solucionar estava dando muito trabalho então fui seguir tutorial de como instalar JSTL.  
Caso queira a fonte (normalmente só precisa fazer o número 1 da instalação)*: https://stackoverflow.com/tags/jstl/info   

---

### Entregando Prova
Clique com botão direito no projeto  
Export > Export...  
Escreva 'WAR' na busca  
WAR file > Next > Export source files > Finish  
**Observação**: Quando ele fez ele tinha o 'Overwrite existing file' marcado, mas não mencionou nada se tinha que marcar isso, por padrão não está marcado.  

Como você não pode mandar por e-mail formatos .war, clique no nome do arquivo e altere de xxx.war para xxx.zip.  

**Observação**: Caso você não consiga ver a extensão dos arquivos no windows, faça o seguinte  
Windows explorer > (se o menu superior não estiver aparecendo) Alt > Ferramentas > Opções de Pasta > Modo de exibição >   
Dentro de configurações avançadas desmarque 'Ocultar as extensões dos tipos de arquivo conhecidos'  
