#' Download dos microdados do ENEM
#'
#' Faz o download do arquivo .zip dos microdados do ENEM.
#' 
#' # Organização dos arquivos
#' 
#' Os arquivos baixados incluem:
#' - Dados:
#'  - Itens da prova
#'  - Microdados
#' - Dicionário de dados
#' - Inputs (códigos para leitura dos dados)
#' - PDFS de provas e gabaritos
#' 
#' # Disponibilização dos dados
#' 
#' Os dados são disponibilizados pelo INEP, na página
#' de [dados abertos](https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos/microdados/enem).
#' 
#' @param path Caminho para salvar o arquivo que será baixado.
#' @param year Ano para o qual queremos fazer o download.
#'
#' @returns Retorna o próprio `path` de forma invisível.
#'
#' @examples
#' \dontrun{
#' tmp <- tempfile(fileext = ".zip")
#' download_microdados(tmp, 2023)
#' }
#'
#' @export
download_microdados <- function(path, year) {
  url_base <- "https://download.inep.gov.br/microdados/microdados_enem_%s.zip"
  url <- sprintf(url_base, year)
  utils::download.file(url = url, destfile = path)
  invisible(path)
}

#' Download descompactado
#' 
#' @describeIn download_microdados Baixa e descompacta os arquivos 
#' @export
download_microdados_descompactado <- function(path, year) {
  tmp <- tempfile(fileext = ".zip")
  download_microdados(tmp, year)
  unzip(tmp, exdir = path)
  unlink(tmp)
  invisible(path)
}
