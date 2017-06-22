
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
alias cef="warsaw-browser cef"
alias itau="warsaw-browser itau"

function warsaw-browser {
  xhost +;
   docker run -it --rm \
              -v /tmp/.X11-unix:/tmp/.X11-unix \
              -v $HOME/Downloads:/home/bank/Downloads \
              -e DISPLAY=unix$DISPLAY \
              --name warsaw-browser \
              lichti/warsaw-browser $1;
}
```