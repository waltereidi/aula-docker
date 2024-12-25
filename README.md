<h1> php com xdebug , composer , nginx e npm</h1>

<h2>Rodar o container e baixar repositorios do git backend e frontend</h2>
<ol>
    <li>edite até o arquivo Makefile</li>
    <li>Modifique os parametros GITREPOSBACKPARAM e GITREPOSFRONTPARAM com a URL dos repositorios para serem baixados</li>
    <li>Edite os arquivos docker\back.conf e docker\front.conf para configurar o nginx ,adicione a entrada do seu repositorio</li>
    <li>Execute o comando <strong>$sudo make launchwithrepos</strong> </li>
    <li>Entrar no container <strong>$sudo make bash</strong> </li>
</ol>


<h2>Rodar o container pela primeira vez sem repositorios</h2>
<p>1 - sudo make launch</p>
<p>2 - configure o nginx em docker\back.conf e docker\front.conf</p>
<p>3 - Adicione os repositorios manualmente</p>

<h2>Refazer o container após já ter sido buildado uma vez </h2>
<p>1 - sudo make deleteandrebuild </p>


