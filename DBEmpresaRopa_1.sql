/*
	Nombre Programadores: Andy Daniel Cuyuch Chitay, Daniel Enrique Quán Cruz 
    Codigo Técnico: IN5AM
    Modificacines:
		Creada: 15-02-2021
*/
Drop Database if exists DBEmpresaDeRopa;
Create Database DBEmpresaDeRopa;
Use DBEmpresaDeRopa;

#DDL
	-- Entidades
    
        Create Table TipoEmpleado(
			codigoTipoEmpleadoID int not null auto_increment,
            nombreTipoEmpleado varchar(45) not null,
            sueldoBase decimal(10,2) not null,
            bonificacion decimal(10,2) not null,
            bonificacionEmpresa decimal(10,2) not null,
            primary Key PK_codigoTipoEmpleadoID (codigoTipoEmpleadoID)
		);

		Create Table Regiones(
			regionID int not null auto_increment,
            nombreRegion varchar(20) not null,
            Primary Key PK_regionID (regionID)
		);


		Create Table Departamentos(
			departamentoID int not null auto_increment,
            departamento varchar(20) not null,
            regionID int not null,
            Primary Key PK_departamentoID (departamentoID),
            Constraint FK_departamentos_Regiones Foreign Key
				(regionID) References Regiones (regionID)
		);
        
        Create Table Oficinas(
			oficinaID int not null auto_increment,
            direccion varchar(256) not null,
            departamentoID int not null,
            Primary Key PK_oficinaID (oficinaID),
            Constraint FK_Oficinas_Departamentos Foreign Key
				(departamentoID) References Departamentos (departamentoID)
		);
        
        Create Table Telefonos(
			telefonoID int not null auto_increment,
            numeroTelefono varchar(15) not null,
            oficinaID int not null,
            Primary Key PK_telefonoID (telefonoID),
            Constraint FK_Telefonos_Oficinas Foreign Key
				(oficinaID) References Oficinas (oficinaID)
		);
        
        Create Table DepartamentoEmpresa(
			departamentoEmpresaID int not null auto_increment,
            nombreDepartamento varchar(30) not null,
            oficinaID int not null,
            Primary Key PK_departamentoEmpresaID (departamentoEmpresaID),
            Constraint FK_departamentoEmpresa_Oficinas Foreign Key 
				(oficinaID) References Oficinas (oficinaID)
		);
        
	
		Create Table Empleados(     
			empleadoID int not null auto_increment,
            nombre varchar(45) not null,
            fechaDeNacimiento date not null,
            edad int not null,
            telefonoPersonal varchar(15),
            fechaDeContratacion date not null,
			codigoTipoEmpleadoID int not null,
            departamentoEmpresaID int not null,
            Primary Key PK_empleadoID (empleadoID),
            Constraint FK_Empleados_TipoEmpleado Foreign Key
				(codigoTipoEmpleadoID) References TipoEmpleado (codigoTipoEmpleadoID),
			Constraint FK_Empleados_DepartamentoEmpresa Foreign Key
				(departamentoEmpresaID) References DepartamentoEmpresa (departamentoEmpresaID)
		);
#DML

	-- Registros -----------------------------------------------------------------------------------------------------------------------------------------------
    
	-- TipoEmpleado
    
        Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Secretaria', 2000.00, 250.00, 1750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Gerente General', 10000.00, 250.00, 9750.00 );
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Gerente de Ventas', 10000.00, 250.00, 9750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Técnico', 2500.00, 250.00, 2250.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Presidente', 40000.00, 250.00, 39750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Vice-Presidente', 37000.00, 250.00, 36750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Vice-Presidente Financiero', 36000.00, 250.00, 35750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Reclutador', 3000.00, 250.00, 2750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Conserje', 1500.00, 250.00, 1250.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Vice-Presidente Comercial', 30000.00, 250.00, 29750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Vendedor', 3000.00, 250.00, 2750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Recepcionista', 2000.00, 250.00, 1750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Guardia De Seguridad', 2000.00, 250.00, 1750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Mensajero', 1500.00, 250.00, 1250.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Gerente General', 10000.00, 250.00, 9750.00 );
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Director de Operaciones', 4500.00, 250.00, 4250.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values ('Director Comercial', 4500.00, 250.00, 4250.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Director de Recursos Humanos', 	4500.00, 250.00, 4250.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Contador', 4000.00, 250.00, 3750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Publicista', 2500.00, 250.00, 2250.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('CEO Regional', 36000.00, 250.00, 35750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Servicio al Cliente', 4000.00, 250.00, 3750.00);
		Insert into TipoEmpleado (nombreTipoEmpleado, sueldoBase, bonificacion, bonificacionEmpresa)
			Values('Jefe de personal', 7000.00, 250.00, 6750.00);
            
	-- Regiones 
    
        Insert into Regiones (nombreRegion)
			Values ('Central'); -- 1
        Insert into Regiones (nombreRegion)
			Values ('Norte'); -- 2
		 Insert into Regiones (nombreRegion)
			Values ('Metropolitana'); -- 3
        Insert into Regiones (nombreRegion)
			Values ('Sur-Oriente'); -- 4
		Insert into Regiones (nombreRegion)
			Values ('Sur-Occidente'); -- 5
        Insert into Regiones (nombreRegion)
			Values ('Nor-Occidente'); -- 6
		 Insert into Regiones (nombreRegion)
			Values ('Peten'); -- 7
		Insert into Regiones(nombreRegion)
			Values ('Nor-Oriente'); -- 8 
            
  -- Departamentos

		insert into Departamentos(departamento,regionID)
			values('Guatemala', 3);
		insert into Departamentos(departamento,regionID)
			values('Peten', 7);
		insert into Departamentos(departamento,regionID)
			values('Alta Verapaz', 2);
		insert into Departamentos(departamento,regionID)
			values('Baja Verapaz', 2);
		insert into Departamentos(departamento,regionID)
			values('Quiché', 6);
		insert into Departamentos(departamento,regionID)
			values('Izabal', 8);
		insert into Departamentos(departamento,regionID)
			values('Zacapa', 8);
		insert into Departamentos(departamento,regionID)
			values('Jutiapa', 4);
		insert into Departamentos(departamento,regionID)
			values('Quetzaltenango', 5);
		insert into Departamentos(departamento,regionID)
			values('Chimaltenango', 1);
		insert into Departamentos(departamento,regionID)
			values('El Progreso', 8);
		insert into Departamentos(departamento,regionID)
			values('Escuintla', 1);
		insert into Departamentos(departamento,regionID)
			values('Huehuetenango', 6);
		insert into Departamentos(departamento,regionID)
			values('Totonicapán', 5);
		insert into Departamentos(departamento,regionID)
			values('Jalapa', 4);
		insert into Departamentos(departamento,regionID)
			values('Retalhuleu', 5);
		insert into Departamentos(departamento,regionID)
			values('San Marcos', 5);
		insert into Departamentos(departamento,regionID)
			values('San Rosa', 4);
		insert into Departamentos(departamento,regionID)
			values('Solola', 5);
		insert into Departamentos(departamento,regionID)
			values('Suchitepéquez', 5);
		insert into Departamentos(departamento,regionID)
			values('Sacatepequez', 1);
		insert into Departamentos(departamento,regionID)
			values('Chiquimula', 8);

-- Oficinas

		insert into Oficinas(direccion,departamentoID)
			values(' 2a calle 1-40, zona 8, Barrio Bella Vista, Coban', 3); 
		insert into Oficinas(direccion,departamentoID)
			values('9a calle 10-44 zona 1 salama ',4); 
		insert into Oficinas(direccion,departamentoID)
			values('1a calle 4-34',10); 
		insert into Oficinas(direccion,departamentoID)
			values('9a Avenida A 1-66',22);
		insert into Oficinas(direccion,departamentoID)
			values('1av 3-40 zona 2 sanarate el progreso',11); 
		insert into Oficinas(direccion,departamentoID)
			values('11 calle 3-39',12); 
		insert into Oficinas(direccion,departamentoID)
			values('5a Avenida 5-55 Zona 14', 1);
		insert into Oficinas(direccion,departamentoID)
			values('6a. Calle Col. La Hondonada, lote 14, zona 5', 13); 
		insert into Oficinas(direccion,departamentoID)
			values('4a. Calle Zona 1, El Estor, Izabal, El Estor', 6); 
		insert into Oficinas(direccion,departamentoID)
			values('1 Calle 2-76 a la par de Helados Sarita San Francisco',15); 		
		insert into Oficinas(direccion,departamentoID)
			values('14 Avenida Zona 1, Jutiapa', 8); 
		insert into Oficinas(direccion,departamentoID)
			values('Avenida Flores, Flores',2);
		insert into Oficinas(direccion,departamentoID)
			values('10 calle 18-59, Quezaltenango',9);
		insert into Oficinas(direccion,departamentoID)
			values('1a calle 5-18, Santa Cruz del Quiché ',5); 
		insert into Oficinas(direccion,departamentoID)
			values('4a Avenida, Retalhuleu',16); 
		insert into Oficinas(direccion,departamentoID)
			values('6a Avenida Norte 20 A,',21);
		insert into Oficinas(direccion,departamentoID)
			values(' RN-1, San Marcos ',17); 
		insert into Oficinas(direccion,departamentoID)
			values('RD-SRO-03, Nueva Santa Rosa',18);
		insert into Oficinas(direccion,departamentoID)
			values('  9 Calle solola ',19); 
		insert into Oficinas(direccion,departamentoID)
			values('2a avenida y, 3A Calle, San Antonio Suchitepéquez',20); 
		insert into Oficinas(direccion,departamentoID)
			values('Calle A 1 a-38, Totonicapán',14);
		insert into Oficinas(direccion,departamentoID)
			values('5a. Calle, Zacapa',7);

	-- Telefonos

		insert into Telefonos(numeroTelefono,oficinaID)
			values('53814608',1);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('42421109',2);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('52747960',3);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('32321109',4);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('43401108',5);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('87980034',6);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('43953771',7);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('55475038',8);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('46372928',9);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('55564181',10);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('31344194',11);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('32421170',12);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('54556677',13);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('22023234',14);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('23034322',15);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('14316471',16);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('08465381',17);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('21013171',18);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('56342209',19);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('56790021',20);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('66797852',21);
		insert into Telefonos(numeroTelefono,oficinaID)
			values('46998638',22);

-- DepartamentoEmpresa 

		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Oficina Regional', 22);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Recursos humanos', 21);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('direccion General', 20);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Publicidad', 19);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Contabilidad', 18);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Marketing', 17);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Punto de venta', 16);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Administración', 15);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Mensajeria', 14);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Fabrica', 13);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Ensanblaje', 12);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Logistica',11);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Operaciones',10);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Departamento Comercial',9);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Comite de Direccion',8);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Almacen',7);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Punto De Venta',6);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Departamento de Compra',5);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Departamento Creativo',4);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Punto De Venta ',3);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Oficina Internacional',2);
		insert into DepartamentoEmpresa(nombreDepartamento,oficinaID)
			values('Punto De Venta ',1);
   
   -- Empleados

		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Sarah','2000-01-4',21,'12345678','2019-02-2',1,15);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Raul','1996-12-29',24,'53814609','2019-01-18',4,18);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Armando','1999-01-20',22,'52747988','2018-04-24',3,17);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Jair','2002-04-14',18,'42421109','2020-02-18',2,16);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Fredy','2001-05-12',19,'31324209','2020-06-24',5,19);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Daniel','1998-07-21',22,'55519678','2017-05-25',8,14);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Diego','1971-02-17',50,'43401104','2017-11-11',7,8);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Samuel','1998-07-1',22,'34340431','2018-12-20',6,21);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Pablo','2000-02-11','21','43490981','2019-08-9',9,20);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Melissa','1996-02-10',25,'44340912','2016-04-12',10,12);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Branddon', '2000-04-3', 20, '12365789', '2017-05-05', 11, 10);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Beatriz', '1967-4-21', 53, '54321876', '2016-05-03', 12, 9);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Amner', '2001-02-14', 20, '98076654', '2018-04-05', 13, 8);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Jose', '1980-05-14', 40, '88993356', '2010-10-14', 14, 7);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Ines', '1973-5-1', 47, '66674889', '2012-12-16', 15, 4);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Jose', '1991-04-16', 30, '99224465', '2013-07-14', 16, 3);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Maria', '1995-05-17', 28, '66749912', '2009-08-20', 17, 2);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Pedro', '1994-09-22', 36, '88153988', '2010-02-2', 18, 8);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Samuel', '1970-11-2', 50, '66489903', '2015-02-15', 19, 5); 
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Elena', '2000-11-05', 20, '97033967', '2016-04-20', 20, 6);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Maria Jose', '2001-10-08', 20, '99443567', '2017-05-04', 21, 11);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Andrea', '1976-12-1', 44, '97002345', '2018-06-02', 22, 8);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Maria', '1970-08-6', 50, '665488792', '2016-07-09', 23, 8);
		insert into Empleados(nombre,fechaDeNacimiento,edad,telefonoPersonal,fechaDeContratacion,codigoTipoEmpleadoID,departamentoEmpresaID)
			values('Javier', '1975-10-4', 45, '45337866', '2018-03-10', 23, 3);
            
	-- Consultas ---------------------------------------------------------------------------------------------------------------------------------------------------

		#1 Nombre y Edad de los empleados
			Select nombre, edad from Empleados;
            
		#2 Salario de Tipo de empleado si suponemos un aumento del 2 porciento anual (calcular liquidacion de un empleado)
			Select E.nombre, ((0.02*TE.sueldoBase)*(year(now())-year(E.fechaDeContratacion))) + (TE.sueldoBase*(year(now())-year(E.fechaDeContratacion))) +
				(TE.sueldoBase+TE.bonificacionEmpresa)    +		(TE.sueldoBase+TE.bonificacionEmpresa)
					from tipoEmpleado TE inner join empleados E on TE.codigoTipoEmpleadoID = E.codigoTipoEmpleadoID;

        #3 Fecha de contratación de cada empleado
			Select nombre, fechaDeContratacion  from Empleados;
            
		#4 Edades de los Empleados
			Select empleadoID, Edad from Empleados;
            
		#5 Número de empleados que hay para cada una de las edades
			Select edad, count(edad) from Empleados group by edad;
            
		#6 Edad media de los empleados por departamento
            select D.departamento, AVG(E.edad) AS edad_promedio from Empleados E inner join 
				DepartamentoEmpresa DE on E.departamentoEmpresaID = DE.departamentoEmpresaID inner join
					oficinas O on DE.oficinaID = O.oficinaID inner join 
						departamentos D on O.departamentoID = D.departamentoID group by nombreDepartamento;
            
		#7 Tipo de empleados que superan los 35k de salario
			Select nombreTipoEmpleado, sueldoBase + bonificacion + bonificacionEmpresa from TipoEmpleado 
				where sueldoBase + bonificacion + bonificacionEmpresa > 35000;
                
		#8 Datos del Empleado numero "x"
			Select * from Empleados where EmpleadoID=10;
            
		#9 Empleados de "DepartamentoEmpresa" "x"
			Select * from Empleados where DepartamentoEmpresaID = 8;
            
		#10 Empleados cuya contratación fue en el año "x"
			Select*From Empleados where fechaDeContratacion='2016-04-12';
         
		#11 Empleados que no sean jefe de departamento (atributo nombre "TipoEmpleado" dentro de la entidad "TipoEmpleado") "x"
			Select*from TipoEmpleado where nombreTipoEmpleado='Conserje';
            
		#12 Empleados contratados entre los años "x" y "x"
			Select*from Empleados where fechaDeContratacion between '2017-01-01' and '2018-12-31';
        
		#13 Tipo de empleado que tiene un salario superior a 35K e inferior a 40k
			Select nombreTipoEmpleado,SueldoBase + Bonificacion + BonificacionEmpresa from TipoEmpleado 
				where SueldoBase + Bonificacion + BonificacionEmpresa>35000 and SueldoBase + Bonificacion + BonificacionEmpresa <40000;
                
		#14 Empleados cuyo tipo empleado es director o jefe de sección
			Select*from TipoEmpleado where NombreTipoEmpleado='Vice-Presidente Financiero';
            
		#15 Empleado de nombre Jose
			select*from Empleados where nombre like 'Jose';
	
		#16 Empleados que pertenecen al departamento Administrativo y que tiene una edad mayor a 35a
			Select E.nombre, E.edad, D.nombreDepartamento from Empleados E inner join DepartamentoEmpresa D
				on E.DepartamentoEmpresaID = D.DepartamentoEmpresaID where Edad>35 and nombreDepartamento='Administración';
                
		#17 Empleados que no pertenecen al departamento de la empresa "X"
			Select E.nombre, D.nombreDepartamento from Empleados E inner join DepartamentoEmpresa D
				on E.DepartamentoEmpresaID = D.DepartamentoEmpresaID where not nombreDepartamento='Administración';
        
        #18 Nombre y edad de los empleados ordenados de menor a mayor edad.
			Select nombre, edad from empleados order by  edad; 
        
        #19 Nombre y edad de los empleados ordenados por nombre de forma descendente.
			Select nombre, edad from empleados order by nombre desc;
        
		#20 Nombre del empleado y el departamento de la empresa en el que trabaja.
			Select E.nombre, D.nombreDepartamento from Empleados E inner join DepartamentoEmpresa D
				on E.DepartamentoEmpresaID = D.DepartamentoEmpresaID;
                
        #21 Código y teléfonos de los departamentos de las oficinas de la región 'Centro'
			Select T.telefonoID, T.numeroTelefono, D.departamento, R.nombreRegion from telefonos T inner join
				oficinas O on T.oficinaID = O.oficinaID inner join departamentos D on O.departamentoID = D.departamentoID
					inner join regiones R on D.regionID = R.regionID where R.nombreRegion = 'Central';
    
        #22  Nombre del empleado y departamento de Guatemala en el que trabaja.
			Select E.empleadoID, E.nombre, D.departamento from empleados E inner join
				departamentoEmpresa DE on E.departamentoEmpresaID = DE.departamentoEmpresaID inner join 
					oficinas O on DE.oficinaID = O.oficinaID inner join departamentos D on O.departamentoID = D.departamentoID;
	
        #23 Sueldo de cada empleado y sus bonificaciones
			Select E.empleadoID, E.nombre, sueldoBase, bonificacion, bonificacionEmpresa from empleados E inner join
				tipoEmpleado TE on E.codigoTipoEmpleadoID = TE.codigoTipoEmpleadoID;
      
        #24 Nombre de los empleados y de sus jefes de departamento.
			Select E.empleadoID, E.nombre, E.codigoTipoEmpleadoID, nombreTipoEmpleado from empleados E inner join
				tipoEmpleado TE on E.codigoTipoEmpleadoID = TE.codigoTipoEmpleadoID where nombreTipoEmpleado = 'Jefe de personal'; 
    
        #25 Suma del sueldo de los empleados, sin la bonificación
			select sum(TE.sueldoBase) from tipoEmpleado TE;
            
        #26 Promedio del sueldo, sin contar bonificación
			select avg(TE.sueldoBase) from tipoEmpleado TE;

        #27 Salarios máximo y mínimo de los empleados, incluyendo bonificación.
			select max(TE.sueldoBase), min(TE.sueldoBase) from tipoEmpleado TE;

        #28  Número de empleados que superan los 40 años.
			Select nombre, edad from Empleados where edad > 40;
        
        #29  Número de edades diferentes que tienen los empleados
			Select distinct(edad) from Empleados;