//Generated by FAMILIAR
JHipster : [SpringWebSockets] [InternationalizationSupport] [SocialLogin] [Database] [TestingFrameworks] [BackEnd] [Libsass] Generator [ClusteredSession] [Authentication] :: _JHipster ;

Database : [Hibernate2ndLvlCache] Development Production [ElasticSearch] :: SQL
	| Cassandra
	| MongoDB ;

Hibernate2ndLvlCache : HazelCast
	| EhCache ;

Development : Oracle12c
	| H2
	| PostgreSQLDev
	| MariaDBDev
	| MySqlDev ;

H2 : DiskBased
	| InMemory ;

Production : MySQL
	| Oracle
	| MariaDB
	| PostgreSQL ;

TestingFrameworks : [Protractor] [Gatling] [Cucumber] :: _TestingFrameworks ;

BackEnd : Gradle
	| Maven ;

Generator : Server
	| Application
	| Client ;

Server : MicroserviceApplication
	| UaaServer
	| ServerApp ;

Application : MicroserviceGateway
	| Monolithic ;

Authentication : HTTPSession
	| OAuth2
	| Uaa
	| JWT ;

%%

OAuth2 and not SocialLogin and not MicroserviceApplication implies SQL or MongoDB ;
SocialLogin implies (HTTPSession or JWT) and (ServerApp or Monolithic) and (SQL or MongoDB) ;
UaaServer implies Uaa ;
Oracle implies H2 or Oracle12c ;
not OAuth2 and not SocialLogin and not MicroserviceApplication implies SQL or MongoDB or Cassandra ;
Server implies not Protractor ;
MySQL implies H2 or MySqlDev ;
MicroserviceApplication or MicroserviceGateway implies JWT or Uaa ;
Monolithic implies JWT or HTTPSession or OAuth2 ;
MariaDB implies H2 or MariaDBDev ;
PostgreSQL implies H2 or PostgreSQLDev ;
Server or Application implies BackEnd and Authentication ;
SpringWebSockets or ClusteredSession implies Application ;
Client implies not Gatling and not Cucumber and not BackEnd and not Authentication ;
Libsass implies Application or Client ;


