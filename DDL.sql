CREATE DATABASE Equipo3;
USE Equipo3;

CREATE TABLE Paciente (
	PacienteID INT,
	Nombres VARCHAR(30) NOT NULL,
	Sexo CHAR(1) NOT NULL,
	Apellidos VARCHAR(30) NOT NULL,
	TipoSangre VARCHAR(4) NOT NULL,
	Direccion VARCHAR(50) NOT NULL,
	Nacimiento DATE NOT NULL,
	PRIMARY KEY (PacienteID)
);

CREATE TABLE Medico (
	MedicoID INT,
	Nombre VARCHAR(50) NOT NULL,
	Cedula VARCHAR(30) NOT NULL UNIQUE,
	Telefono VARCHAR(30) NOT NULL,
	Especialidad VARCHAR(30) NOT NULL,
	Universidad VARCHAR(30) NOT NULL,
	PRIMARY KEY (MedicoID)
);

CREATE TABLE Consulta (
	ConsultaID INT,
	PacienteID INT NOT NULL,
	MedicoID INT NOT NULL,
	Fecha DATE NOT NULL,
	Altura NUMERIC(5, 2) NOT NULL,
	Peso NUMERIC(5, 2) NOT NULL,
	PRIMARY KEY (ConsultaID),
	FOREIGN KEY (PacienteID) REFERENCES Paciente(PacienteID),
	FOREIGN KEY (MedicoID) REFERENCES Medico(MedicoID)
);

CREATE TABLE Receta (
	RecetaID INT,
	ConsultaID INT NOT NULL,
	Fecha DATE NOT NULL,
	PRIMARY KEY (RecetaID),
	FOREIGN KEY (ConsultaID) REFERENCES Consulta(ConsultaID)
);

CREATE TABLE CatalogoMedicamento (
	CatalogMedID INT,
	NombreComercial VARCHAR(30) NULL,
	NombreGenerico VARCHAR(30) NOT NULL,
	IngredienteActivo VARCHAR(30) NULL,
	PRIMARY KEY (CatalogMedID)
);

CREATE TABLE MedicamentoEnReceta (
	MedicamentoRecetaID INT,
	RecetaID INT NOT NULL,
	CatalogMedID INT NOT NULL,
	Dosis NUMERIC(6, 3) NOT NULL,
	Intervalo INT NOT NULL,
	Dias INT NOT NULL,
	Presentacion VARCHAR(30) NOT NULL,
	Recomendaciones VARCHAR(150) NULL,
	PRIMARY KEY (MedicamentoRecetaID),
	FOREIGN KEY (RecetaID) REFERENCES Receta(RecetaID),
	FOREIGN KEY (CatalogMedID) REFERENCES CatalogoMedicamento(CatalogMedID)
);

CREATE TABLE CatalogoExamenes (
	ExamenCatalogoID INT,
	NombreExamen VARCHAR(30) NOT NULL UNIQUE,
	PRIMARY KEY (ExamenCatalogoID)
);

CREATE TABLE ExamenLab (
	ExamenLabID INT,
	Fecha DATE NOT NULL,
	ExamenCatalogoID INT NOT NULL,
	ConsultaID INT NOT NULL,
	PRIMARY KEY (ExamenLabID),
	FOREIGN KEY (ExamenCatalogoID) REFERENCES CatalogoExamenes(ExamenCatalogoID),
	FOREIGN KEY (ConsultaID) REFERENCES Consulta(ConsultaID)
);

CREATE TABLE CatalogoResultados (
	CatalogoResultadosID INT,
	Nombre VARCHAR(30) NOT NULL UNIQUE,
	ValorMinimo NUMERIC(8, 4) NOT NULL,
	ValorMaximo NUMERIC(8, 4) NOT NULL,
	ExamenCatalogoID INT NOT NULL,
	PRIMARY KEY (CatalogoResultadosID),
	FOREIGN KEY (ExamenCatalogoID) REFERENCES CatalogoExamenes(ExamenCatalogoID)
);

CREATE TABLE Resultados (
	ResultadoID INT,
	ExamenLabID INT NOT NULL,
	CatalogoResultadosID INT NOT NULL,
	Valor NUMERIC (8, 4) NOT NULL,
	Anormal CHAR(7) NULL,
	PRIMARY KEY (ResultadoID),
	FOREIGN KEY (ExamenLabID) REFERENCES ExamenLab(ExamenLabID),
	FOREIGN KEY (CatalogoResultadosID) REFERENCES CatalogoResultados(CatalogoResultadosID)
);