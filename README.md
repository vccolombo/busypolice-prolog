# Busy Police em Prolog

Trabalho realizado em 2018 para a disciplina de Inteligência Artifical, da Universidade Federal de São Carlos.

Esse problema é baseado no jogo Busy Police, lançado para Atari na década de 80.

Foi pedido para escrever [um artigo](artigo.pdf) baseado na resolução do problema.

## Descrição
- Policial deve percorrer um supermercado atrás de um ladrão.
- O projeto é composto de uma versão estática e simplificada do jogo.
- Problema de busca que monta caminho entre policial e ladrão.

## Objetivo
Implementar em Prolog o ambiente de forma adequada (em regras e fatos), considerando os objetos:
- Policial e ladrão
- Escadas
- Carrinhos de compra
- Dado um estado inicial (policial) e um estado final (ladrão), obter e imprimir um caminho acíclico entre os dois, de forma que:
    - O estado inicial seja escolhido pelo usuário
    - Ser capaz de rodar em qualquer cenário, incluindo cenários em que não há caminho até o ladrão

> Deve-se considerar que qualquer objeto pode estar em qualquer posição da tabela (programável)

## Extra
Desenvolver uma funcionalidades extra relativa ao jogo que seja interessante.
- Meu trabalho adicionou a necessidade do policial coletar evidências para prender o ladrão.

### [Descrição completa](descricao.pdf)