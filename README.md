# 🚀 AnaCoinApp  

## 📌 Sobre o Projeto  

Este aplicativo consulta a **CoinAPI** e exibe uma lista de exchanges de criptomoedas. O usuário pode visualizar detalhes de cada exchange e acessar o site oficial diretamente pelo aplicativo.  

---

## 🛠️ Tecnologias Utilizadas  

- **SwiftUI** - Interface declarativa  
- **VIPER** - Arquitetura modular e escalável  
- **CoinAPI** - API de dados de exchanges  
- **Swift Package Manager (SPM)** - Gerenciamento de dependências
- **Alamofire** - Biblioteca para requisições HTTP
- **Lottie** - Biblioteca para animações vetoriais
- **Localization (Localizable)** - Mecanismo de internacionalização para suporte a múltiplos idiomas no futuro

---

## 📱 Funcionalidades  

✅ Exibe uma lista de exchanges com dados obtidos da **CoinAPI**  
✅ Detalhamento das exchanges ao clicar em uma célula  
✅ Redirecionamento para o site da exchange ao clicar no campo correspondente  
✅ Tratamento de erros e estados de carregamento  
✅ Testes **unitários, de UI e de snapshot**  

---

## 🏗️ Arquitetura VIPER  

O projeto segue a arquitetura **VIPER** para manter separação de responsabilidades e escalabilidade. A estrutura do módulo inclui:  

- **View** - Interface do usuário (**SwiftUI**)  
- **Interactor** - Regras de negócio e chamadas para a **API**  
- **Presenter** - Processamento de dados e comunicação entre **Interactor** e **View**  
- **Entity** - Modelos de dados  
- **Router** - Navegação entre telas  

---

## 🧪 Testes  

O aplicativo possui uma cobertura de testes abrangente:  

✔ **Testes Unitários** - Verificam a lógica das camadas **Interactor** e **Presenter**  
✔ **Testes de UI** - Validam a interface com **XCTest**  
✔ **Testes de Snapshot** - Garantem que a interface não sofra alterações visuais inesperadas  

---

## 🔑 Configurando a API Key  

Para utilizar o aplicativo, você precisa de uma **API Key** da **CoinAPI**.  

### 🚀 Como Criar uma API Key no CoinAPI.io  

1. Acesse o site oficial da CoinAPI: [https://www.coinapi.io/](https://www.coinapi.io/)  
2. Clique em **"Get a Free API Key"** (Market Data API).  
3. Crie uma conta preenchendo os dados solicitados.  
4. Após o cadastro, acesse o painel da CoinAPI e copie sua **API Key**.  

### 🛠 Como Configurar a API Key no Projeto  

1. **Copie o arquivo de exemplo** e renomeie para `Secrets.xcconfig`:  

   ```bash
   cp Secrets.xcconfig.example Secrets.xcconfig
2. **Abra o arquivo `Secrets.xcconfig`** e adicione sua chave da API:  

   ```ini
   API_KEY = SUA_CHAVE_AQUI

---

## 🚀 Como Executar o Projeto  

1. **Clone este repositório:**  

   ```bash
   git clone https://github.com/anaccborba/AnaCoinApp.git

2. **Acesse o diretório do projeto:**

   ```bash
   cd AnaCoinApp

3. **Instale as dependências, se necessário:**

   ```bash
   swift package resolve

4. **Abra o projeto no Xcode:**

   ```bash
   open ExchangeListApp.xcodeproj

5. **Compile e execute no simulador ou dispositivo real:**

