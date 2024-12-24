-- ---------------------------------------------------------------------------- --
-- Création de la base de données CLICOM et chargement des données initiales --
-- ---------------------------------------------------------------------------- --

CREATE DATABASE IF NOT EXISTS CLICOM;

create table CLIENT (
        NCLI     char(10)    not null,
        NOM      char(32)    not null,
        ADRESSE  char(60)    not null,
        LOCALITE char(30)    not null,
        CAT      char(2),
        COMPTE   decimal(9,2) not null,
        constraint PKCLI primary key (NCLI));

create table PRODUIT (
        NPRO     char(15)    not null,
        LIBELLE  char(60)    not null,
        PRIX     decimal(6)  not null,
        QSTOCK   decimal(8)  not null,
        constraint PKPRO primary key (NPRO));

create table COMMANDE (
        NCOM     char(12)    not null,
        NCLI     char(10)    not null,
        DATECOM  date        not null,
        constraint PKCOM primary key (NCOM),
		FOREIGN KEY (NCLI) REFERENCES CLIENT(NCLI)
		on delete no action on update cascade);

create table DETAIL (
        NCOM     char(12)    not null,
        NPRO     char(15)    not null,
        QCOM     decimal(8)  not null,
        constraint PKDET primary key (NCOM,NPRO),
		FOREIGN KEY (NCOM) REFERENCES COMMANDE(NCOM)
		on delete cascade on update cascade,
		FOREIGN KEY (NPRO) REFERENCES PRODUIT(NPRO)
		on delete no action on update cascade);


insert into CLIENT values
    ('B112','HANSENNE','23, r. Dumont','Poitiers','C1',1250);
insert into CLIENT values
    ('C123','MERCIER','25, r. Lemaître','Namur','C1',-2300);
insert into CLIENT values
    ('B332','MONTI','112, r. Neuve','Genève','B2',0);
insert into CLIENT values
    ('F010','TOUSSAINT','5, r. Godefroid','Poitiers','C1',0);
insert into CLIENT values
    ('K111','VANBIST','180, r. Florimont','Lille','B1',720);
insert into CLIENT values
    ('S127','VANDERKA','3, av. des Roses','Namur','C1',-4580);
insert into CLIENT values
    ('B512','GILLET','14, r. de l''Eté','Toulouse','B1',-8700);
insert into CLIENT values
    ('B062','GOFFIN','72, r. de la Gare','Namur','B2',-3200);
insert into CLIENT values
    ('C400','FERARD','65, r. du Tertre','Poitiers','B2',350);
insert into CLIENT values
    ('C003','AVRON','8, ch. de la Cure','Toulouse','B1',-1700);
insert into CLIENT values
    ('K729','NEUMAN','40, r. Bransart','Toulouse',null,0);
insert into CLIENT values
    ('F011','PONCELET','17, Clôs des Erables','Toulouse','B2',0);
insert into CLIENT values
    ('L422','FRANCK','60, r. de Wépion','Namur','C1',0);
insert into CLIENT values
    ('S712','GUILLAUME','14a, ch. des Roses','Paris','B1',0);
insert into CLIENT values
    ('D063','MERCIER','201, bvd du Nord','Toulouse',null,-2250);
insert into CLIENT values
    ('F400','JACOB','78, ch. du Moulin','Bruxelles','C2',0);

insert into PRODUIT values ('CS262','CHEV. SAPIN 200x6x2',75,45);
insert into PRODUIT values ('CS264','CHEV. SAPIN 200x6x4',120,2690);
insert into PRODUIT values ('CS464','CHEV. SAPIN 400x6x4',220,450);
insert into PRODUIT values ('PA45' ,'POINTE ACIER 45 (1K)',105,580);
insert into PRODUIT values ('PA60' ,'POINTE ACIER 60 (1K)',95,134);
insert into PRODUIT values ('PH222','PL. HETRE 200x20x2',230,782);
insert into PRODUIT values ('PS222','PL. SAPIN 200x20x2',185,1220);

insert into COMMANDE values ('30178','K111','2015-12-21');
insert into COMMANDE values ('30179','C400','2015-12-22');
insert into COMMANDE values ('30182','S127','2015-12-23');
insert into COMMANDE values ('30184','C400','2015-12-23');
insert into COMMANDE values ('30185','F011','2016-01-02');
insert into COMMANDE values ('30186','C400','2016-01-02');
insert into COMMANDE values ('30188','B512','2016-01-03');

insert into DETAIL values ('30178','CS464',25);
insert into DETAIL values ('30179','PA60',20);
insert into DETAIL values ('30179','CS262',60);
insert into DETAIL values ('30182','PA60',30);
insert into DETAIL values ('30184','CS464',120);
insert into DETAIL values ('30184','PA45',20);
insert into DETAIL values ('30185','PA60',15);
insert into DETAIL values ('30185','PS222',600);
insert into DETAIL values ('30185','CS464',260);
insert into DETAIL values ('30186','PA45',3);
insert into DETAIL values ('30188','PA60',70);
insert into DETAIL values ('30188','PH222',92);
insert into DETAIL values ('30188','CS464',180);
insert into DETAIL values ('30188','PA45',22);

COMMIT;
