CREATE DATABASE  IF NOT EXISTS `bd_projeto` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_projeto`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_projeto
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atividade`
--

DROP TABLE IF EXISTS `atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividade` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` text NOT NULL,
  `data` date NOT NULL,
  `periodo` varchar(45) NOT NULL,
  `atividade_categoria` int(11) NOT NULL,
  `unidade_acolhimento_codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_atividade_categoria_idx` (`atividade_categoria`),
  KEY `fk_unidade_acolhimento_idx` (`unidade_acolhimento_codigo`),
  CONSTRAINT `fk_atividade_categoria` FOREIGN KEY (`atividade_categoria`) REFERENCES `categoria_atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidade_acolhimento` FOREIGN KEY (`unidade_acolhimento_codigo`) REFERENCES `unidade_acolhimento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividade`
--

LOCK TABLES `atividade` WRITE;
/*!40000 ALTER TABLE `atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividades_criancas`
--

DROP TABLE IF EXISTS `atividades_criancas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividades_criancas` (
  `codigo_atividade` int(11) NOT NULL,
  `codigo_crianca` int(11) NOT NULL,
  PRIMARY KEY (`codigo_atividade`,`codigo_crianca`),
  KEY `atividade_crianca_idx` (`codigo_crianca`),
  CONSTRAINT `atividade_codigo` FOREIGN KEY (`codigo_atividade`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `atividade_crianca` FOREIGN KEY (`codigo_crianca`) REFERENCES `crianca` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividades_criancas`
--

LOCK TABLES `atividades_criancas` WRITE;
/*!40000 ALTER TABLE `atividades_criancas` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividades_criancas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atividades_funcionarios`
--

DROP TABLE IF EXISTS `atividades_funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atividades_funcionarios` (
  `codigo_atividade` int(11) NOT NULL,
  `codigo_funcionario` int(11) NOT NULL,
  PRIMARY KEY (`codigo_atividade`,`codigo_funcionario`),
  KEY `codigo_funcionario_idx` (`codigo_funcionario`),
  CONSTRAINT `codigo_atividade` FOREIGN KEY (`codigo_atividade`) REFERENCES `atividade` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `codigo_funcionario` FOREIGN KEY (`codigo_funcionario`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atividades_funcionarios`
--

LOCK TABLES `atividades_funcionarios` WRITE;
/*!40000 ALTER TABLE `atividades_funcionarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `atividades_funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacao_interdisciplinar_caso`
--

DROP TABLE IF EXISTS `avaliacao_interdisciplinar_caso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao_interdisciplinar_caso` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` text,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao_interdisciplinar_caso`
--

LOCK TABLES `avaliacao_interdisciplinar_caso` WRITE;
/*!40000 ALTER TABLE `avaliacao_interdisciplinar_caso` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao_interdisciplinar_caso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_atividade`
--

DROP TABLE IF EXISTS `categoria_atividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_atividade` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` text NOT NULL,
  `unidade_acolhimento_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_unidade_acolhimento_idx5` (`unidade_acolhimento_codigo`),
  CONSTRAINT `unidade_acolhimento` FOREIGN KEY (`unidade_acolhimento_codigo`) REFERENCES `unidade_acolhimento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_atividade`
--

LOCK TABLES `categoria_atividade` WRITE;
/*!40000 ALTER TABLE `categoria_atividade` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_atividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crianca`
--

DROP TABLE IF EXISTS `crianca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crianca` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `responsavel` varchar(100) DEFAULT NULL,
  `genitor` varchar(100) DEFAULT NULL,
  `genitora` varchar(100) DEFAULT NULL,
  `naturalidade` varchar(30) DEFAULT NULL,
  `num_processo` varchar(45) DEFAULT NULL,
  `orgao_encaminhador` varchar(45) DEFAULT NULL,
  `data_acolhimento` date DEFAULT NULL,
  `primeiro_acolhimento` varchar(3) DEFAULT NULL,
  `irmaos_sobAcolhimento` varchar(3) DEFAULT NULL,
  `irmaos_sobAcolhimento_info` varchar(100) DEFAULT NULL,
  `guia_acolhimento` varchar(45) DEFAULT NULL,
  `problema_saude` varchar(3) DEFAULT NULL,
  `problema_saude_info` varchar(100) DEFAULT NULL,
  `tipo_deficiencia` varchar(3) DEFAULT NULL,
  `tipo_deficiencia_info` varchar(100) DEFAULT NULL,
  `uso_medicamento` varchar(3) DEFAULT NULL,
  `uso_medicamento_info` varchar(100) DEFAULT NULL,
  `filiacao_genitor` varchar(200) DEFAULT NULL,
  `filiacao_genitora` varchar(200) DEFAULT NULL,
  `endereco_genitor` varchar(100) DEFAULT NULL,
  `endereco_genitora` varchar(100) DEFAULT NULL,
  `endereco_responsavel` varchar(100) DEFAULT NULL,
  `dataNasc_genitor` date DEFAULT NULL,
  `dataNasc_genitora` date DEFAULT NULL,
  `dataNasc_responsavel` date DEFAULT NULL,
  `tipoDocumento_genitor` varchar(4) DEFAULT NULL,
  `tipoDocumento_genitora` varchar(4) DEFAULT NULL,
  `tipoDocumento_responsavel` varchar(4) DEFAULT NULL,
  `documento_genitor` varchar(11) DEFAULT NULL,
  `documento_genitora` varchar(11) DEFAULT NULL,
  `documento_responsavel` varchar(11) DEFAULT NULL,
  `telefone_genitor` varchar(11) DEFAULT NULL,
  `telefone_genitora` varchar(11) DEFAULT NULL,
  `telefone_responsavel` varchar(11) DEFAULT NULL,
  `justificativa_para_acolhimento_codigo` int(11) DEFAULT NULL,
  `parecer_codigo` int(11) DEFAULT NULL,
  `info_familia_origem_codigo` int(11) DEFAULT NULL,
  `info_familia_extensa_codigo` int(11) DEFAULT NULL,
  `info_terceiros_codigo` int(11) DEFAULT NULL,
  `procedimentos_unidade_acolhimento_codigo` int(11) DEFAULT NULL,
  `procedimentos_unidade_familia_codigo` int(11) DEFAULT NULL,
  `avaliacao_interdisciplinar_caso_codigo` int(11) DEFAULT NULL,
  `cpf` char(14) DEFAULT NULL,
  `outroResponsavel_Qual` varchar(45) DEFAULT NULL,
  `foto` longblob,
  `unidade_acolhimento_codigo` int(11) DEFAULT NULL,
  `campo_responsavel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_crianca_justificativa_para_acolhimento_idx` (`justificativa_para_acolhimento_codigo`),
  KEY `fk_crianca_parecer_idx` (`parecer_codigo`),
  KEY `fk_crianca_info_familia_origem_idx` (`info_familia_origem_codigo`),
  KEY `fk_crianca_info_familia_extensa_idx` (`info_familia_extensa_codigo`),
  KEY `fk_crianca_info_terceiros_idx` (`info_terceiros_codigo`),
  KEY `fk_crianca_procedimentos_unidade_acolhimento_idx` (`procedimentos_unidade_acolhimento_codigo`),
  KEY `fk_crianca_procedimentos_unidade_familia_idx` (`procedimentos_unidade_familia_codigo`),
  KEY `fk_crianca_avaliacao_interdisciplinar_caso_idx` (`avaliacao_interdisciplinar_caso_codigo`),
  KEY `fk_unidade_acolhimento_idx4` (`unidade_acolhimento_codigo`),
  CONSTRAINT `fk_crianca_avaliacao_interdisciplinar_caso` FOREIGN KEY (`avaliacao_interdisciplinar_caso_codigo`) REFERENCES `avaliacao_interdisciplinar_caso` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crianca_info_familia_extensa` FOREIGN KEY (`info_familia_extensa_codigo`) REFERENCES `info_familia_extensa` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crianca_info_familia_origem` FOREIGN KEY (`info_familia_origem_codigo`) REFERENCES `info_familia_origem` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crianca_info_terceiros` FOREIGN KEY (`info_terceiros_codigo`) REFERENCES `info_terceiros` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crianca_justificativa_para_acolhimento` FOREIGN KEY (`justificativa_para_acolhimento_codigo`) REFERENCES `justificativa_para_acolhimento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crianca_parecer` FOREIGN KEY (`parecer_codigo`) REFERENCES `parecer` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crianca_procedimentos_unidade_acolhimento` FOREIGN KEY (`procedimentos_unidade_acolhimento_codigo`) REFERENCES `procedimentos_unidade_acolhimento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_crianca_procedimentos_unidade_familia` FOREIGN KEY (`procedimentos_unidade_familia_codigo`) REFERENCES `procedimentos_unidade_familia` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidade_acolhimento3` FOREIGN KEY (`unidade_acolhimento_codigo`) REFERENCES `unidade_acolhimento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crianca`
--

LOCK TABLES `crianca` WRITE;
/*!40000 ALTER TABLE `crianca` DISABLE KEYS */;
/*!40000 ALTER TABLE `crianca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `num_registro` varchar(45) DEFAULT NULL,
  `cpf` char(14) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `data_nascimento` date NOT NULL,
  `email` varchar(45) NOT NULL,
  `escolaridade` varchar(45) NOT NULL,
  `unidade_acolhimento_codigo` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `rg_UNIQUE` (`rg`),
  KEY `unidade_acolhimento_codigo_idx2` (`unidade_acolhimento_codigo`),
  CONSTRAINT `unidade_acolhimento_codigo2` FOREIGN KEY (`unidade_acolhimento_codigo`) REFERENCES `unidade_acolhimento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (6,'João Silva','Coordenador','98849-8478','','123.456.878-78','21212121','Rua UM','1997-05-11','ok@ok.com','Médio',1,1),(19,'Lúcia Pereira','Coordenador','98849-4534',NULL,'247.879.847-50','1111111','Rua Dois','1977-04-15','ok2@ok.com','Superior',2,1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_status`
--

DROP TABLE IF EXISTS `historico_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico_status` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `funcionario_codigo` int(11) NOT NULL,
  `crianca_codigo` int(11) NOT NULL,
  `status_crianca` varchar(45) NOT NULL,
  `data_movimentacao` datetime NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_movimentacao_status_funcionario1_idx` (`funcionario_codigo`),
  KEY `fk_movimentacao_status_crianca_codigo_idx` (`crianca_codigo`),
  CONSTRAINT `fk_movimentacao_status_crianca_codigo` FOREIGN KEY (`crianca_codigo`) REFERENCES `crianca` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_movimentacao_status_funcionario_codigo` FOREIGN KEY (`funcionario_codigo`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_status`
--

LOCK TABLES `historico_status` WRITE;
/*!40000 ALTER TABLE `historico_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_familia_extensa`
--

DROP TABLE IF EXISTS `info_familia_extensa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_familia_extensa` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `parentesProximos` varchar(3) DEFAULT NULL,
  `parentesProximos_info` varchar(255) DEFAULT NULL,
  `contatoParentes` varchar(3) DEFAULT NULL,
  `parentesInteressadosNaGuarda` varchar(3) DEFAULT NULL,
  `parentesInteressadosNaGuarda_info` varchar(255) DEFAULT NULL,
  `situacao_socioFamiliar` varchar(255) DEFAULT NULL,
  `opiniao_familiaExtensa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_familia_extensa`
--

LOCK TABLES `info_familia_extensa` WRITE;
/*!40000 ALTER TABLE `info_familia_extensa` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_familia_extensa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_familia_origem`
--

DROP TABLE IF EXISTS `info_familia_origem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_familia_origem` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `situacao_sociofamiliar` varchar(255) DEFAULT NULL,
  `opiniao_familia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_familia_origem`
--

LOCK TABLES `info_familia_origem` WRITE;
/*!40000 ALTER TABLE `info_familia_origem` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_familia_origem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_terceiros`
--

DROP TABLE IF EXISTS `info_terceiros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_terceiros` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `vinculoTerceiros` varchar(3) DEFAULT NULL,
  `vinculoTerceiros_info` varchar(255) DEFAULT NULL,
  `contatoTerceiros` varchar(3) DEFAULT NULL,
  `terceirosInteressadosNaGuarda` varchar(3) DEFAULT NULL,
  `terceirosInteressadosNaGuarda_info` varchar(255) DEFAULT NULL,
  `situacao_socioFamiliar` varchar(255) DEFAULT NULL,
  `opiniao_terceiros` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_terceiros`
--

LOCK TABLES `info_terceiros` WRITE;
/*!40000 ALTER TABLE `info_terceiros` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_terceiros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `justificativa_para_acolhimento`
--

DROP TABLE IF EXISTS `justificativa_para_acolhimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `justificativa_para_acolhimento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `violacaoDireitos` varchar(255) DEFAULT NULL,
  `ocorrencia_violacaoDireitos` varchar(255) DEFAULT NULL,
  `ocorrenciaPolicial` varchar(255) DEFAULT NULL,
  `familiarAutorizado` varchar(3) DEFAULT NULL,
  `familiarAutorizado_info` varchar(255) DEFAULT NULL,
  `restricaoDeFamiliar` varchar(3) DEFAULT NULL,
  `restricaoDeFamiliar_info` varchar(255) DEFAULT NULL,
  `guiaAcolhimento` tinyint(4) DEFAULT NULL,
  `oficioJuizado` tinyint(4) DEFAULT NULL,
  `oficioConselho` tinyint(4) DEFAULT NULL,
  `relatorio_servicoSocial` tinyint(4) DEFAULT NULL,
  `certidaoNasc` tinyint(4) DEFAULT NULL,
  `cartaoVacina` tinyint(4) DEFAULT NULL,
  `relatorio_conselhoTutelar` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `justificativa_para_acolhimento`
--

LOCK TABLES `justificativa_para_acolhimento` WRITE;
/*!40000 ALTER TABLE `justificativa_para_acolhimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `justificativa_para_acolhimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parecer`
--

DROP TABLE IF EXISTS `parecer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parecer` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `atendimento` text,
  `opiniaoCrianca` text,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parecer`
--

LOCK TABLES `parecer` WRITE;
/*!40000 ALTER TABLE `parecer` DISABLE KEYS */;
/*!40000 ALTER TABLE `parecer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimentos_unidade_acolhimento`
--

DROP TABLE IF EXISTS `procedimentos_unidade_acolhimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedimentos_unidade_acolhimento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `saude` text,
  `educacao` text,
  `convivenciaComunitaria` text,
  `manutencaoVinculosFamiliares` text,
  `insercaoSocioassistencialMunicipio` text,
  `esporteLazer` text,
  `acompanhamentoSocial` text,
  `acompanhamentoPsicologico` text,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimentos_unidade_acolhimento`
--

LOCK TABLES `procedimentos_unidade_acolhimento` WRITE;
/*!40000 ALTER TABLE `procedimentos_unidade_acolhimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `procedimentos_unidade_acolhimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimentos_unidade_familia`
--

DROP TABLE IF EXISTS `procedimentos_unidade_familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedimentos_unidade_familia` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `visitaDomiciliar` text,
  `insercaoSocioassistencialMunicipio` text,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimentos_unidade_familia`
--

LOCK TABLES `procedimentos_unidade_familia` WRITE;
/*!40000 ALTER TABLE `procedimentos_unidade_familia` DISABLE KEYS */;
/*!40000 ALTER TABLE `procedimentos_unidade_familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relatorio_crianca`
--

DROP TABLE IF EXISTS `relatorio_crianca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relatorio_crianca` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `crianca_codigo` int(11) NOT NULL,
  `funcionario_codigo` int(11) NOT NULL,
  `parecer_desenvolvimento` text NOT NULL,
  `parecer_psicossocial` text NOT NULL,
  `psicologo_codigo` int(11) NOT NULL,
  `assistenteSocial_codigo` int(11) NOT NULL,
  `unidade_acolhimento_codigo` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `psicologo_codigo_idx` (`psicologo_codigo`),
  KEY `assistenteSocial_codigo_idx` (`assistenteSocial_codigo`),
  KEY `funcionario_codigo_idx` (`funcionario_codigo`),
  KEY `funcionario_codigo_idx2` (`funcionario_codigo`),
  KEY `fk_unidade_acolhimento_idx2` (`unidade_acolhimento_codigo`),
  KEY `crianca_codigo_idx` (`crianca_codigo`),
  CONSTRAINT `assistenteSocial_codigo` FOREIGN KEY (`assistenteSocial_codigo`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crianca_codigo` FOREIGN KEY (`crianca_codigo`) REFERENCES `crianca` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_codigo` FOREIGN KEY (`funcionario_codigo`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `psicologo_codigo` FOREIGN KEY (`psicologo_codigo`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `unidade_acolhimento_codigo` FOREIGN KEY (`unidade_acolhimento_codigo`) REFERENCES `unidade_acolhimento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio_crianca`
--

LOCK TABLES `relatorio_crianca` WRITE;
/*!40000 ALTER TABLE `relatorio_crianca` DISABLE KEYS */;
/*!40000 ALTER TABLE `relatorio_crianca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residencia_familia_extensa`
--

DROP TABLE IF EXISTS `residencia_familia_extensa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `residencia_familia_extensa` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int(2) DEFAULT NULL,
  `parentesco` varchar(45) DEFAULT NULL,
  `ocupacao` varchar(45) DEFAULT NULL,
  `renda` decimal(6,2) DEFAULT NULL,
  `info_familia_extensa_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_residencia_familia_extensa_info_familia_extensa_idx` (`info_familia_extensa_codigo`),
  CONSTRAINT `fk_residencia_familia_extensa_info_familia_extensa` FOREIGN KEY (`info_familia_extensa_codigo`) REFERENCES `info_familia_extensa` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residencia_familia_extensa`
--

LOCK TABLES `residencia_familia_extensa` WRITE;
/*!40000 ALTER TABLE `residencia_familia_extensa` DISABLE KEYS */;
/*!40000 ALTER TABLE `residencia_familia_extensa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residencia_familia_origem`
--

DROP TABLE IF EXISTS `residencia_familia_origem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `residencia_familia_origem` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int(3) DEFAULT NULL,
  `parentesco` varchar(45) DEFAULT NULL,
  `ocupacao` varchar(45) DEFAULT NULL,
  `renda` decimal(6,2) DEFAULT NULL,
  `info_familia_origem_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_residencia_familia_origem_info_familia_origem_idx` (`info_familia_origem_codigo`),
  CONSTRAINT `fk_residencia_familia_origem_info_familia_origem` FOREIGN KEY (`info_familia_origem_codigo`) REFERENCES `info_familia_origem` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residencia_familia_origem`
--

LOCK TABLES `residencia_familia_origem` WRITE;
/*!40000 ALTER TABLE `residencia_familia_origem` DISABLE KEYS */;
/*!40000 ALTER TABLE `residencia_familia_origem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residencia_terceiros`
--

DROP TABLE IF EXISTS `residencia_terceiros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `residencia_terceiros` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `idade` int(2) DEFAULT NULL,
  `ocupacao` varchar(45) DEFAULT NULL,
  `renda` decimal(6,2) DEFAULT NULL,
  `info_terceiros_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_residencia_terceiros_info_terceiros_idx` (`info_terceiros_codigo`),
  CONSTRAINT `fk_residencia_terceiros_info_terceiros` FOREIGN KEY (`info_terceiros_codigo`) REFERENCES `info_terceiros` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residencia_terceiros`
--

LOCK TABLES `residencia_terceiros` WRITE;
/*!40000 ALTER TABLE `residencia_terceiros` DISABLE KEYS */;
/*!40000 ALTER TABLE `residencia_terceiros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_acolhimento`
--

DROP TABLE IF EXISTS `unidade_acolhimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade_acolhimento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `municipio` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `publicoAlvo` text,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_acolhimento`
--

LOCK TABLES `unidade_acolhimento` WRITE;
/*!40000 ALTER TABLE `unidade_acolhimento` DISABLE KEYS */;
INSERT INTO `unidade_acolhimento` VALUES (1,'Adra Infantil','asd','asd','asd','asd','98988888','asdasdas','ThiagoAlmeida12@hotmail.com'),(2,'Adra Juvenil ','ass','sas','ass','asas','984444','asas','ThiagoAlmeida11@hotmail.com');
/*!40000 ALTER TABLE `unidade_acolhimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `senha` text NOT NULL,
  `funcionario_codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `funcionario_codigo_idx` (`funcionario_codigo`),
  CONSTRAINT `funcionario_codigo` FOREIGN KEY (`funcionario_codigo`) REFERENCES `funcionario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (5,'admin','3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2',6),(6,'admin2','3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2',19);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_projeto'
--

--
-- Dumping routines for database 'bd_projeto'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-07  8:46:52
