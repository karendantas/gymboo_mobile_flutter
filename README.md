# Gymboo App

Gymboo é um aplicativo mobile (Flutter) que gamifica a rotina de exercícios físicos por meio de um **pet virtual**: ao registrar atividades e cumprir metas semanais, o usuário ganha pontos e experiência que mantêm o pet saudável e o fazem evoluir de nível. O app também acompanha metas de treinoe o progresso da semana.

## Principais funcionalidades

- **Autenticação** de usuário (login).
- **Home** com visão geral do progresso do usuário.
- **Pet virtual**: vida, nível e pontos, que evoluem conforme o usuário se exercita.
- **Atividades**: registro de treinos (tipo, duração, pontos, descrição).
- **Metas**: meta semanal de treinos, com acompanhamento de progresso por dia da semana.

## Stack

- [Flutter](https://flutter.dev/) + [Dart](https://dart.dev/)
- [Riverpod](https://riverpod.dev/) — gerenciamento de estado
- [go_router](https://pub.dev/packages/go_router) — navegação
- [Dio](https://pub.dev/packages/dio) — cliente HTTP
- [Freezed](https://pub.dev/packages/freezed) + [json_serializable](https://pub.dev/packages/json_serializable) — modelos imutáveis e serialização JSON
- [Flame](https://pub.dev/packages/flame) — engine usada nas telas do pet virtual
- [json-server](https://github.com/typicode/json-server) — API fake para desenvolvimento local

## Estrutura de pastas

O projeto segue uma organização por **features**, cada uma dividida em `data`, `domain` e `presentation`:

```
lib/
├── core/                    # infraestrutura compartilhada
│   ├── dev/                 # overrides para desenvolvimento (usuário fake logado, etc.)
│   ├── di/                  # injeção de dependência / providers globais
│   ├── errors/              # tratamento de erros
│   ├── network/              # configuração do Dio e endpoints da API
│   ├── router/               # configuração de rotas (go_router)
│   └── theme/                 # tema visual do app
│
├── features/
│   ├── auth/                 # login e sessão do usuário
│   │   ├── data/
│   │   ├── domain/models/
│   │   └── presentation/
│   │       ├── controllers/
│   │       └── pages/
│   │
│   ├── home/                 # tela inicial
│   │   └── presentation/controllers/
│   │
│   ├── activities/           # registro e listagem de atividades físicas
│   │   ├── domain/models/
│   │   └── presentation/
│   │       ├── pages/
│   │       └── widgets/
│   │
│   ├── goal/                  # metas semanais e de hidratação
│   │   ├── data/
│   │   ├── domain/models/
│   │   └── presentation/
│   │       ├── controllers/
│   │       └── widgets/
│   │
│   ├── virtual_pet/            # pet virtual (status, evolução, tela do jogo)
│   │   ├── data/
│   │   ├── domain/models/
│   │   ├── game/                # lógica com Flame
│   │   └── presentation/
│   │       ├── controllers/
│   │       └── widgets/
│   │
│   └── skills/                 # (em construção)
│
├── mocks/                     # dados/objetos mockados para telas e testes
├── shared/                    # widgets reutilizados entre features (ex.: bottom tab)
└── main.dart                  # ponto de entrada do app
```

### Rotas

As rotas ficam centralizadas em [lib/core/router/app_router.dart](lib/core/router/app_router.dart):

| Rota | Tela |
|---|---|
| `/login` | Login |
| `/home` | Home |
| `/activities` | Atividades |

Usuário não autenticado é redirecionado para `/login`; usuário autenticado tentando acessar `/login` é redirecionado para `/home`.

## Como rodar o projeto

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado (`environment.sdk` requer Dart `^3.12.2`)
- [Node.js](https://nodejs.org/) instalado (para rodar o `json-server`)

### 1. Instalar as dependências

```bash
flutter pub get
```

### 2. Gerar os objetos com Freezed / json_serializable

O projeto usa **Freezed** para gerar classes de modelo imutáveis (`*.freezed.dart`) e **json_serializable** para gerar a serialização JSON (`*.g.dart`) a partir das classes anotadas em `domain/models/`.

Sempre que criar ou alterar uma classe anotada com `@freezed`, rode o `build_runner` para (re)gerar os arquivos:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Durante o desenvolvimento, para gerar automaticamente a cada alteração de arquivo, use o modo *watch* ao invés de rodar o comando manualmente a cada mudança:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

> `--delete-conflicting-outputs` evita conflitos com arquivos gerados anteriormente, sobrescrevendo-os automaticamente.

### 3. Rodar a API fake (json-server)

O app consome dados de uma API fake servida a partir do arquivo [db.json](db.json), usando o [json-server](https://github.com/typicode/json-server).

Instale o `json-server` globalmente (caso ainda não tenha):

```bash
npm install -g json-server
```

Na raiz do projeto, suba o servidor:

```bash
json-server --watch db.json --port 3000 --host 0.0.0.0
```

Isso disponibiliza os recursos definidos em `db.json` (`users`, `virtualPets`, `activities`, `activityTypes`, `goals`, `weeklyProgress`) em endpoints REST, por exemplo `http://localhost:3000/activities`.

> **Importante:** a URL base usada pelo app fica em [lib/core/network/api_endpoints.dart](lib/core/network/api_endpoints.dart). Como o app roda em um emulador/dispositivo físico, atualize esse endereço para o **IP da máquina onde o `json-server` está rodando** na sua rede local (não use `localhost`), mantendo a porta `3000`.

### 4. Rodar o app

Com a API fake no ar, rode o Flutter normalmente:

```bash
flutter run
```
