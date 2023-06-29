*** Settings ***
Documentation    Esta suite de testes verifica o funcionamento das funcionalidades da aplicação Tumblr
Resource         resources.robot
Test Setup       Abrir browser
Test Teardown    Fechar browser

*** Test Cases ***

CT01: Fazer login no tumblr
    [Documentation]    Faz login no Tumblr
    [Tags]    login    conta 
    Fazer login no Tumblr

CT02: Fazer logout no tumblr
    [Documentation]    Faz login no Tumblr
    [Tags]    logout    conta 
    Fazer login no Tumblr
    Fazer logout do Tumblr

CT03: Verificar postagens curtidas
    [Documentation]    Verifica as postagens curtidas no Tumblr
    [Tags]    curtidas    conta
    Fazer login no Tumblr
    Verificar as curtidas da conta no Tumblr
    
CT04: Verificar blogs que estão sendo seguidos
    [Documentation]    Verifica os blogs que estão sendo seguidos no Tumblr
    [Tags]    seguidos    conta
    Fazer login no Tumblr
    Verifica os blogs seguidos pela conta no Tumblr

CT05: Acessar as configurações do blog e mudar idioma do site 
    [Documentation]    Acessa as configurações do blog e muda o idioma (de Inglês para Português,
                ...    depois retorna para Inglês)
    [Tags]    idioma    conta
    Fazer login no Tumblr
    Acessar configurações do blog
    Alterar idioma do blog 

CT06: Acessar a página de ajuda do Tumblr e depois voltar para a página inicial
    [Documentation]    Acessar a página de ajuda do Tumblr
    [Tags]    ajuda    conta
    Fazer login no Tumblr
    Acessar página de ajuda do Tumblr

CT07: Acessar os posts do blog
    [Documentation]    Acessa os posts do blog
    [Tags]    posts    conta
    Fazer login no Tumblr
    Acessar posts do blog

CT08: Visualizar atividade do blog
    [Documentation]    Acessa a aba de atividades do blog
    [Tags]    atividade    conta
    Fazer login no Tumblr
    Acessar atividade do blog
CT09: Visualizar os posts salvos como rascunho no blog
    [Documentation]    Acessa os posts salvos como rascunho no blog
    [Tags]    rascunho    conta
    Fazer login no Tumblr
    Acessar rascunhos do blog

CT10: Testar as tags de um post do tumblr
    [Documentation]    Digita tags em um post do Tumblr 
    [Tags]    postagem    conta
    Fazer login no Tumblr
    Testar o funcionamento de tags em um post

CT11: Fazer um post no blog do tipo Foto adicionando uma imagem da web
    [Documentation]    Faz uma postagem de foto no Tumblr com uma imagem da web
    [Tags]    foto    post
    Fazer login no Tumblr
    Carrega uma foto no tumblr

CT12: Fazer um post no blog do tipo Vídeo adicionando um vídeo da web
    [Documentation]    Faz uma postagem de vídeo no Tumblr com um vídeo da web
    [Tags]    video    post
    Fazer login no Tumblr
    Carrega um vídeo no tumblr

CT13: Fazer um post no blog do tipo Link adicionando um link da web
    [Documentation]    Faz uma postagem de link no Tumblr com um link da web
    [Tags]    link    post
    Fazer login no Tumblr
    Carrega um link no Tumblr

CT14: Reblogar um post 
    [Documentation]    Reblogar um post que aparece na página inicial do Tumblr
    [Tags]    reblog    post
    Fazer login no Tumblr
    Reblogar um post

CT15: Curtir um post 
    [Documentation]    Curtir um post que aparece na página inicial do Tumblr
    [Tags]    curtir    post
    Fazer login no Tumblr
    Curtir um post

CT16: Deletar um post do blog
    [Documentation]    Deletar um post do blog do usuário
    [Tags]    deletar    post    
    Fazer login no Tumblr
    Acessar posts do blog
    Deletar um post

CT17: Copiar o link de um post do blog
    [Documentation]    Copiar o link de um post do blog para compartilhamento
    [Tags]    copiar    post
    Fazer login no Tumblr
    Acessar posts do blog
    Copiar o link de um post

CT18: Visualizar um blog que está sendo seguido pelo usuário
    [Documentation]    Visualizar a lista de blogs seguidos pelo usuário
    [Tags]    seguindo    conta    
    Fazer login no Tumblr
    Visualizar um blog que está sendo seguido

CR19: Fazer uma pesquisa no Tumblr
    [Documentation]    Fazer buscas na barra de pesquisa do Tumblr
    [Tags]    pesquisa    conta
    Fazer login no Tumblr
    Fazer uma pesquisa

CT20: Iniciar uma conversa no chat do Tumblr
    [Documentation]    Iniciar uma conversa com outro blog no chat do Tumblr
    [Tags]    conversa    conta
    Fazer login no Tumblr
    Iniciar conversa com outro blog
    Sleep    3s