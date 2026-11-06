# RafaDesk - página de download

Página publicada em **https://acesso.rafaelmarcolino.online** pelo Dokploy (projeto RafaDesk, serviço `rustdesk-download`).
Cada push na branch `main` gera um deploy automático.

## Arquivos

| Arquivo | Para que serve |
|---|---|
| `site/index.html` | A página (texto, cores, layout) |
| `site/logo.webp` | Logo e favicon |
| `site/install.sh` | Instalador Linux: `curl -fsSL https://acesso.rafaelmarcolino.online/install.sh \| sudo bash` |
| `nginx.conf` | Endereços: `/`, `/RafaDesk.exe`, `/RafaDesk.deb`, `/install.sh` |
| `downloads.txt` | Quais instaladores baixar do release do GitHub e o sha256 de cada um |
| `fetch.sh` | Baixa os instaladores para o servidor e confere o hash |
| `Dockerfile`, `docker-compose.yml` | Como o Dokploy sobe a página |

## Nova versão do RafaDesk

1. Quando o build terminar, pegue o sha256 de cada arquivo do release.
2. Em `downloads.txt`, troque nome e hash. Em `nginx.conf` e `fetch.sh`, troque a versão (`1.5.1`).
3. Faça o push. O Dokploy baixa os arquivos novos, confere os hashes e publica.

Se o hash de um arquivo obrigatório não conferir, o deploy falha e a versão anterior continua no ar.
