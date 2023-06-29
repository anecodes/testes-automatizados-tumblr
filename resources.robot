*** Settings ***
Documentation    Implementação dos casos de teste para a aplicação Tumblr 

Library    SeleniumLibrary
Library    DateTime
Library    String
Library    OperatingSystem

*** Variables ***
${URL_LOGIN}    https://www.tumblr.com/login
${URL_TESTE}     # Inserir URL do blog de teste
${LINK_IMAGEM}   # Inserir URL de teste de imagem
${LINK_VIDEO}    # Inserir URL de teste de vídeo
${LINK_POST}     # Inserir link de teste para post de link
${TEXTO_PAG_LOGIN}    //a[contains(@aria-label,'Tumblr')]
${LOGIN_TUMBLR}       # Inserir email da conta Tumblr
${SENHA_TUMBLR}       # Inserir senha da conta Tumblr
${TEXTO_PAG_INICIAL}    //h1[@class='hF8Wr'][contains(.,'Check out these blogs')]
${TEXTO_POST}     Descrição feita para criar um post de teste no Tumblr

*** Keywords ***
Abrir browser
    Open Browser   browser=firefox
    Maximize Browser Window

Fechar browser
    Capture Page Screenshot
    Close Browser

Fazer login no Tumblr
    Go To    ${URL_LOGIN}
    Wait Until Element Is Visible    ${TEXTO_PAG_LOGIN} 
    Logar com "${LOGIN_TUMBLR}" "${SENHA_TUMBLR}" 

Fazer logout do Tumblr
    Click Button    //button[contains(@aria-label,'Account')]
    Wait Until Element Is Visible    //h3[contains(.,'Account')]
    Click Button    //button[@class='TRX6J Vp4ma'][contains(.,'Log out')] 
    Wait Until Element Is Visible    //h3[@class='B3EfW'][contains(.,'Are you sure you want to log out?')]
    Click Button    //button[@class='TRX6J CxLjL qjTo7 IMvK3 B5hil'][contains(.,'OK')]  


Logar com "${USUARIO}" "${SENHA}"
    #Insere email e senha de acesso válidos e clica no elemento de criar conta
    #Espera título da página dashboard aparecer
    Input Text    email  ${USUARIO}
    Input Text    password  ${SENHA}
    Click Element    //span[@class='EvhBA'][contains(.,'Entrar')]
    Wait Until Element Is Visible    ${TEXTO_PAG_INICIAL}

Acessar aba "Account" do Tumblr
    Click Button    //button[contains(@aria-label,'Account')]

Verificar as curtidas da conta no Tumblr
    Acessar aba "Account" do Tumblr
    Wait Until Element Is Visible    //span[@class='ZC1wz'][contains(.,'Likes')]
    Click Element   //div[@class='a132D'][contains(.,'Likes')]
    
Verifica os blogs seguidos pela conta no Tumblr
    Acessar aba "Account" do Tumblr
    Wait Until Element Is Visible    //span[@class='ZC1wz'][contains(.,'Following')]
    Click Element    //a[@class='tDT48'][contains(.,'Following')]

Acessar página de ajuda do Tumblr
    Acessar aba "Account" do Tumblr
    Wait Until Element Is Visible    //span[@class='ZC1wz'][contains(.,'Help')]
    Click Element    //a[@class='tDT48'][contains(.,'Help')]
    Voltar à página inicial 

Acessar configurações do blog
    Acessar aba "Account" do Tumblr
    Wait Until Element Is Visible    //span[@class='ZC1wz'][contains(.,'Settings')]
    Click Element    //a[@class='tDT48'][contains(.,'Settings')]

Acessar posts do blog
    Acessar aba "Account" do Tumblr
    Wait Until Element Is Visible    (//span[contains(.,'Posts')])[2]
    Click Element    //a[contains(.,'Posts')]

Acessar atividade do blog
    Acessar aba "Account" do Tumblr
    Wait Until Element Is Visible    (//span[contains(.,'Activity')])[2]
    Click Element    (//span[contains(.,'Activity')])[2]

Acessar rascunhos do blog
    Acessar aba "Account" do Tumblr
    Wait Until Element Is Visible    (//span[contains(.,'Drafts')])[2]
    Click Element    //a[contains(.,'Drafts')]

Alterar idioma do blog
    Wait Until Element Is Visible    //h3[contains(.,'Language')]
    Select From List By Value    //select[contains(@class,'irkyW')]    pt_BR
    Select From List By Value    //select[contains(@class,'irkyW')]    en_US

Testar o funcionamento de tags em um post
    Wait Until Element Is Visible    //button[@class='FOqaP'][contains(.,'Text')]
    Click Element    //button[@class='FOqaP'][contains(.,'Text')]
    Wait Until Element Is Visible    //span[@class='EvhBA'][contains(.,'For Everyone')]
    Input Text    //textarea[contains(@aria-label,'Tags editor')]           ${TEXTO_POST}
    Press Keys    //textarea[contains(@aria-label,'Tags editor')]    RETURN
    Click Element    //button[@class='TRX6J Zemfu'][contains(.,'Close')]
    Wait Until Element Is Visible    //h1[@class='hF8Wr'][contains(.,'Check out these blogs')]

Carrega uma foto no tumblr
    Wait Until Element Is Visible    //button[@class='FOqaP'][contains(.,'Photo')]
    Click Element    //button[@class='FOqaP'][contains(.,'Photo')]
    Wait Until Element Is Visible    //span[@class='EvhBA'][contains(.,'Add images from web')]
    Click Element    //span[@class='EvhBA'][contains(.,'Add images from web')]
    Input Text    //input[contains(@class,'Q1epK tPuZF')]    ${LINK_IMAGEM}
    Wait Until Element Is Visible    //button[@class='TRX6J WY_lp'][contains(.,'Insert')]
    Click Element    //button[@class='TRX6J WY_lp'][contains(.,'Insert')]
    Input Text    //textarea[contains(@aria-label,'Tags editor')]           ${TEXTO_POST}
    Press Keys    //textarea[contains(@aria-label,'Tags editor')]    RETURN
    Wait Until Element Is Enabled    //button[@class='TRX6J VxmZd'][contains(.,'Post now')]
    Click Button    //button[@class='TRX6J VxmZd'][contains(.,'Post now')]

Carrega um vídeo no tumblr
    Wait Until Element Is Visible    //button[@class='FOqaP'][contains(.,'Video')]
    Click Element    //button[@class='FOqaP'][contains(.,'Video')]
    Wait Until Element Is Visible    //span[@class='EvhBA'][contains(.,'Add video from web')]
    Click Element    //span[@class='EvhBA'][contains(.,'Add video from web')]
    Input Text    //input[contains(@class,'Q1epK tPuZF')]    ${LINK_VIDEO}
    Wait Until Element Is Visible    //button[@class='TRX6J WY_lp'][contains(.,'Insert')]
    Click Element    //button[@class='TRX6J WY_lp'][contains(.,'Insert')]
    Input Text    //textarea[contains(@aria-label,'Tags editor')]           ${TEXTO_POST}
    Press Keys    //textarea[contains(@aria-label,'Tags editor')]    RETURN
    Wait Until Element Is Enabled    //button[@class='TRX6J VxmZd'][contains(.,'Post now')]
    Click Button    //button[@class='TRX6J VxmZd'][contains(.,'Post now')]

Carrega um link no Tumblr
    Wait Until Element Is Visible    //button[@class='FOqaP'][contains(.,'Link')]
    Click Element    //button[@class='FOqaP'][contains(.,'Link')]
    Wait Until Element Is Visible    //input[contains(@class,'Q1epK tPuZF')]
    Click Element    //input[contains(@class,'Q1epK tPuZF')]
    Input Text    //input[contains(@class,'Q1epK tPuZF')]    ${LINK_POST}
    Wait Until Element Is Visible    //button[@class='TRX6J WY_lp'][contains(.,'Insert')]
    Click Element    //button[@class='TRX6J WY_lp'][contains(.,'Insert')]    
    Input Text    //textarea[contains(@aria-label,'Tags editor')]           ${TEXTO_POST}
    Press Keys    //textarea[contains(@aria-label,'Tags editor')]    RETURN
    Wait Until Element Is Enabled    //button[@class='TRX6J VxmZd'][contains(.,'Post now')]
    Click Button    //button[@class='TRX6J VxmZd'][contains(.,'Post now')]

Reblogar um post
    Wait Until Element Is Visible    (//span[contains(@class,'Vcrhu')])[2]    
    Click Element    (//span[contains(@class,'Vcrhu')])[2]
    Wait Until Element Is Visible    //button[contains(@class,'TRX6J KSOyK')]
    Click Element    //button[@class='TRX6J VxmZd'][contains(.,'Reblog')]

Curtir um post
    Wait Until Element Is Visible    //a[@class='wl0Ka sSq2h'][contains(.,'For you')]    
    Click Element    (//span[contains(@class,'EvhBA B1Z5w')])[1]

Deletar um post
    Wait Until Element Is Visible    (//button[@aria-label='Delete'])[2]
    Click Element    (//button[@aria-label='Delete'])[2]
    Wait Until Element Is Visible    //h3[@class='B3EfW'][contains(.,'Are you sure you want to delete this post?')]
    Click Element    //span[@class='EvhBA'][contains(.,'OK')]

Copiar o link de um post
    Wait Until Element Is Visible    (//button[contains(@aria-label,'Share')])[2]
    Click Element    (//button[contains(@aria-label,'Share')])[2]
    Wait Until Element Is Visible    //span[@class='EvhBA baUXc'][contains(.,'Copy link')]
    Click Element    //span[@class='EvhBA baUXc'][contains(.,'Copy link')]

Visualizar um blog que está sendo seguido
    Verifica os blogs seguidos pela conta no Tumblr
    Wait Until Element Is Visible    //a[contains(@class,'Ro4PU BSUG4')]
    Click Element    //div[@class='gLEkw'][contains(.,'equipebrasil')]

Fazer uma pesquisa
    Wait Until Element Is Visible    //span[@class='EvhBA'][contains(.,'Click for frogs')]
    Click Element    //input[contains(@name,'q')]
    Input Text    //input[contains(@name,'q')]    dogs
    Press Keys    //input[contains(@name,'q')]    RETURN
        
Voltar à página inicial
    Wait Until Element Is Visible    //p[contains(.,'Help Center')]
    Click Element    //a[@class='button'][contains(.,'Back to Tumblr')]
    Wait Until Element Is Visible    //button[contains(@aria-label,'Account')]

Iniciar conversa com outro blog
    Go To    ${URL_TESTE}
    Wait Until Element Is Visible    //span[@class='EvhBA nh7eU'][contains(.,'Follow')]
    Click Element    //button[contains(@class,'TRX6J CxLjL wmqRB IMvK3 oIdtb')]
    Wait Until Element Is Visible    //button[contains(@aria-label,'Minimize Conversation')]
    Input Text    //textarea[contains(@class,'xXTjk')]    Olá
    Press Keys    //textarea[contains(@class,'xXTjk')]    RETURN


    