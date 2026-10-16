#!/bin/bash

# Baixa o Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# Usar $HOME ou o caminho absoluto da Vercel resolve problemas de escopo
export PATH="$PATH:$GRID_HOME/flutter/bin:$(pwd)/flutter/bin"

# Garante que as ferramentas internas do Flutter sejam baixadas
flutter precache --web

# Habilita suporte web e baixa dependências
flutter config --enable-web
flutter pub get

# Gera a versão Web em modo release
flutter build web --release
