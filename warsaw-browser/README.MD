~~~
Creditos ao meu amigo Kretcheu.
http://kretcheu.com.br
(A ideia foi 100% dele, eu apenas executei)
~~~

# Como executar

```
 docker run -it --rm \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v $HOME/Downloads:/home/bank/Downloads \
            -e DISPLAY=unix$DISPLAY \
            --name warsaw-browser \
            lichti/warsaw-browser <banco>
```
**Bancos**
- bb
- bbpj
- itau
- cef

**Outras opções**
- help   -> Abre este readme

___Se não informado nenhum parametro, abrirá o browser com uma pagina de teste e validação do warsaw___

# Dica
Talvez você precise executar esse comando antes:
```
xhost +
```

É uma boa ideia você criar uma function e alias no seu .bashrc ou .zshrc. 
Ex:
```
alias bb="warsaw-browser bb"
alias bbpj="warsaw-browser bbpj"
alias cef="warsaw-browser cef"
alias itau="warsaw-browser itau"

function warsaw-browser {
  xhost +;
   docker run -it --rm \
              -v /tmp/.X11-unix:/tmp/.X11-unix \
              -v $HOME/ArquivosDoBanco:/home/bank/Downloads \
              -e DISPLAY=unix$DISPLAY \
              --name warsaw-browser \
              lichti/warsaw-browser $1;
}
```
# Windows
Para funcionamento no Windows, você deve instalar o [vcxsrv](https://sourceforge.net/projects/vcxsrv/) (todos os detalhes em: https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde).

```
docker run -it --rm -v %UserProfile%/Downloads:/home/bank/Downloads -e DISPLAY=%DISPLAY% --name warsaw-browser lichti/warsaw-browser <banco>
```
**Bancos**
- bb
- bbpj
- itau
- cef

**%DISPLAY%** é o IP do seu host onde está rodando o *vcxsrv* conforme link acima.