# R script
# Glue the JHipster results CSV with the 
# author: Xavier Devroey

library(dplyr)

# ------------------------------
# Functions definition
# ------------------------------

processRow <- function(jHipsterRow, inputCsv){
  config <- inputCsv 
  
  #filter(jHipsterRow[1,"JHipster"] && ) %>% 
  #filter(jHipsterRow[1,"Generator"] && ) %>%
  #filter(jHipsterRow[1,"Server"] && ) %>% 
  if(jHipsterRow[1,"MicroserviceApplication"]){ 
    config <- config %>%
      filter( applicationType == 'microservice')
  }
  if(jHipsterRow[1,"UaaServer"]){ 
    config <- config %>%
      filter( applicationType == 'uaa')
  }
  #filter(jHipsterRow[1,"Application"] && ) %>% 
  if(jHipsterRow[1,"MicroserviceGateway"]){ 
    config <- config %>%
      filter( applicationType == 'gateway')
  }
  if(jHipsterRow[1,"Monolithic"]){ 
    config <- config %>%
      filter( applicationType == 'monolith')
  }
  #filter(jHipsterRow[1,"Authentication"] && ) %>% 
  if(jHipsterRow[1,"HTTPSession"]){ 
    config <- config %>%
      filter( authenticationType == 'session')
  }
  if(jHipsterRow[1,"OAuth2"]){ 
    config <- config %>%
      filter( authenticationType == 'oauth2')
  }
  if(jHipsterRow[1,"Uaa"]){ 
    config <- config %>%
      filter( authenticationType == 'uaa')
  }
  if(jHipsterRow[1,"JWT"]){
    config <- config %>%
      filter(authenticationType == 'jwt')
  }
  if(jHipsterRow[1,"SocialLogin"]){
    config <- config %>%
      filter(enableSocialSignIn)
  } else {
    config <- config %>%
      filter(!enableSocialSignIn)
  }
  if(!jHipsterRow[1,"Database"]){
    config <- config %>%
      filter(databaseType == 'no')
  }
  if(!jHipsterRow[1,"Hibernate2ndLvlCache"]){
    config <- config %>%
      filter(hibernateCache == 'no')
  }
  if(jHipsterRow[1,"HazelCast"]){ 
    config <- config %>%
      filter( hibernateCache == 'hazelcast')
  }
  if(jHipsterRow[1,"EhCache"]){ 
    config <- config %>%
      filter( hibernateCache == 'ehcache')
  }
  #filter(jHipsterRow[1,"Development"] && ) %>% 
  #filter(jHipsterRow[1,"H2"] && ) %>% 
  if(jHipsterRow[1,"DiskBased"]){ 
    config <- config %>%
      filter( devDatabaseType == 'DiskBased')
  }
  if(jHipsterRow[1,"InMemory"]){ 
    config <- config %>%
      filter( devDatabaseType == 'InMemory')
  }
  if(jHipsterRow[1,"PostgreSQLDev"]){ 
    config <- config %>%
      filter( devDatabaseType == 'postgresql')
  }
  if(jHipsterRow[1,"MariaDBDev"]){ 
    config <- config %>%
      filter( devDatabaseType == 'mariadb')
  }
  if(jHipsterRow[1,"MySQLDev"]){ 
    config <- config %>%
      filter( devDatabaseType == 'mysql')
  }
  #filter(jHipsterRow[1,"Production"] && ) %>% 
  if(jHipsterRow[1,"MySQL"]){ 
    config <- config %>%
      filter( prodDatabaseType == 'mysql')
  }
  if(jHipsterRow[1,"MariaDB"]){ 
    config <- config %>%
      filter( prodDatabaseType == 'mariadb')
  }
  if(jHipsterRow[1,"PostgreSQL"]){ 
    config <- config %>%
      filter( prodDatabaseType == 'postgresql')
  }
  if(jHipsterRow[1,"ElasticSearch"]){ 
    config <- config %>%
      filter( searchEngine == 'elasticsearch')
  }else{
    config <- config %>%
      filter( searchEngine == 'no')
  }
  if(jHipsterRow[1,"SQL"]){ 
    config <- config %>%
      filter( databaseType == 'sql')
  }
  if(jHipsterRow[1,"Cassandra"]){ 
    config <- config %>%
      filter( databaseType == 'cassandra')
  }
  if(jHipsterRow[1,"MongoDB"]){ 
    config <- config %>%
      filter( databaseType == 'mongodb')
  }
  if(jHipsterRow[1,"SpringWebSockets"]){ 
    config <- config %>%
      filter( websocket == 'spring-websocket')
  }else{
    config <- config %>%
      filter(websocket == 'no' | is.na(websocket))
  }
  if(jHipsterRow[1,"Libsass"]){
    config <- config %>%
      filter(useSass)
  } else {
    config <- config %>%
      filter(!useSass)
  }
  if(jHipsterRow[1,"ClusteredSession"]){
    config <- config %>%
      filter(clusteredHttpSession == 'hazelcast')
  } else {
    config <- config %>%
      filter(clusteredHttpSession == 'no' | is.na(clusteredHttpSession))
  }
  #filter(jHipsterRow[1,"BackEnd"] && ) %>% 
  if(jHipsterRow[1,"Gradle"]){ 
    config <- config %>%
      filter( buildTool == 'gradle')
  }
  if(jHipsterRow[1,"Maven"]){ 
    config <- config %>%
      filter( buildTool == 'maven')
  }
  if(jHipsterRow[1,"InternationalizationSupport"]){
    config <- config %>%
      filter(enableTranslation)
  } else {
    config <- config %>%
      filter(!enableTranslation)
  }
  if(jHipsterRow[1,"Docker"]){
    config <- config %>%
      filter(Docker)
  } else {
    config <- config %>%
      filter(!Docker)
  }
  #filter(jHipsterRow[1,"TestingFrameworks"] && ) %>% 
  if(jHipsterRow[1,"Protractor"]){
    config <- config %>%
      filter(protractor)
  } else {
    config <- config %>%
      filter(!protractor)
  }
  if(jHipsterRow[1,"Gatling"] ){
    config <- config %>%
      filter(gatling)
  } else {
    config <- config %>%
      filter(!gatling)
  }
  if(jHipsterRow[1,"Cucumber"]){
    config <- config %>%
      filter(cucumber)
  } else {
    config <- config %>%
      filter(!cucumber)
  }
  
  # Check that there is exactly one config
  if(nrow(config) != 1){
    cat("JHipster row:", "\n")
    print(jHipsterRow)
    cat("Config(s):", "\n")
    print(config)
    stop("Not exactly one configuration selected!")
  }
  return(config)
}

