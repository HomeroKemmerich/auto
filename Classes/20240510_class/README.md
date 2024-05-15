---
date: 2024-05-10
title: Introdução ao PLC
tags: 
    - plc
    - automação-industrial
---
# Introdução ao PLC

## Objetivo

Criar um projeto de PLC no WinSPS-S7, associá-lo com uma cena no Factory I/O e simular o funcionamento do sistema.

## Descrição

Foram desenvolvidos dois projetos durante a aula. O primeiro deles visava demonstrar a associação entre componentes do PLC e elementos de uma cena no Factory I/O. O segundo projeto foi um desafio proposto pelo professor, que consistia em criar um sistema de ida e volta de uma caixa em uma esteira.

## Materiais

- WinSPS-S7
- Factory I/O

## Desenvolvimento

### Exemplo - de A a B

O objetivo do exemplo era fazer com que um objeto se movimentasse do ponto A ao ponto B sem cair da esteira.

- [Solução](../../solutions/FromA_ToB/FromA_ToB.WS7)
- [Cena](../../scenes/FromA_ToB.factoryio)

<video controls src="./videos/Factory IO 2024-05-14 21-41-46.mp4" title="From A to B"></video>

### Desafio - set e reset

O desafio proposto pelo professor consistia em criar um sistema de ida e volta de uma caixa em uma esteira. Quando o objeto passasse pelo primeiro sensor, deveria acionar a segunda esteira, que levaria o objeto até o ponto B. Quando o objeto passasse pelo segundo sensor, a esteira deveria ser desligada e o objeto deveria voltar para o ponto A.

- [Solução](../../solutions/Set_Reset/)
- [Cena](../../scenes/Set_Reset.factoryio)

<video controls src="./videos/Factory IO 2024-05-14 21-58-00.mp4" title="Set e reset"></video>

> [!NOTE] Por que o circuito _ladder_ está montado da forma que está?
> O sensor utilizado na cena é um sensor de retorno, o que quer dizer que o mesmo emite um sinal e aguarda recebê-lo de volta. Quando o objeto interrompe este sinal, gerando uma resposta.
> Se utilizarmos um terminal aberto para identificar o sensor, o mesmo estaria ativado enquanto o sinal estivesse recebendo o retorno. Nós queremos que a ativação/desativação dos atuadores ocorra apenas quando o objeto cruzar o sensor, portanto o estado padrão deve ser **desativado**.
> Utilizamos atuadores do tipo SET e RESET, pois precisávamos que os atuadores mantivessem seu comportamento **mesmo após o objeto ter cruzado o sensor**, o que exige uma forma simples de armazenamento de estado.

## Conclusão

O processo de automação industrial apresentado em aula parece bastante digital. A utilização de componentes na linguagem Ladder, embora não equivalente a um circuito digital, se assemelha muito ao mesmo.
Isso permite a utilização de circuitos equivalentes, como no exemplo de [desafio](#desafio---set-e-reset), podendo comparar o circuito de set e reset a um flip-flop.