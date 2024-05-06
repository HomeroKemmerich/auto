---
date: 
    - 2024-05-06
tags:
    - ferramentas
    - programas
    - clp
    - automação-industrial
---
# Integração entre Factory IO e Codesys

## Materiais

- [Factory IO](https://factoryio.com/)
- [UA Expert](https://www.unified-automation.com/products/development-tools/uaexpert.html)
- [Codesys](https://www.codesys.com/download.html)

## Instruções

1. Crie um novo projeto no Codesys;
2. Selecione o controlador que deseja utilizar, nesse caso "Codesys Control Win V3 x64";
3. Selecione `Application > Add object > Global variable list`
4. Crie as seguintes variáveis para uma lista chamada `OPC_UA`:

    ```st
    {attribute 'qualified_only'}
    VAR_GLOBAL
        //input
        x_start_button: BOOL;
        x_stop_button: BOOL;
        
        //output
        x_start_light: BOOL;
        x_stop_light: BOOL;
        i_speed: INT;
        i_belt_conveyor: INT;
    END_VAR
    ```

5. Crie as seguintes regras no campo inferior de `PLC_PRG`:

    ```st
    IF OPC_UA.x_start_button AND OPC_UA.x_stop_button THEN
        OPC_UA.x_start_light := TRUE;
        OPC_UA.x_stop_light := FALSE;
        OPC_UA.i_speed := 100;
        OPC_UA.i_belt_conveyor := 10;
    ELSIF OPC_UA.x_stop_button THEN
        OPC_UA.x_start_light := FALSE;
        OPC_UA.x_stop_light := TRUE;
        OPC_UA.i_speed := 0;
        OPC_UA.i_belt_conveyor := 0;
    END_IF
        ```

6. Inicie o CLP;
7. Busque o dispositivo em `Device > Scan network`
8. Selecione o dispositivo rodando;
9. Crie um usuário e senha para o dispositivo;
10. Faça a autenticação do dispositivo;
11. Em `Dispositivo > Alterar política de segurança em runtime`:

    a. em `Comunicação` selecione `Criptografia opcional`;

    b. em `Gerenciamento de usuários do dispositivo`, em `Gerenciamento de usuário opcional` selecione `Ativar`, e marque a caixa de seleção `Autorizar login anônimo`;

12. Em `Direitos de acesso`:

    a. Presssione `Sincronização`
    b. Selecione `OPCUAServer`
    c. Adicione todas as permissões;

13. Na tela de segurança:

    a. Selecione `Devices` e o seu dispositivo;

    b. Para cada "usuário" que não possuir certificdado, crie um novo certificado;

14. Em `Application > Adicionara objeto > Configuração de símbolos`:

    a. Selecione `OPC_UA` e pressione `Compilar` (`F11`);

15. Faça logon (`F8`);
16. Inicie o servidor OPC UA (`F5`);