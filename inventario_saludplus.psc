Proceso Panel_Administracion_Medicamentos
	
    // ---------------------------------------------
    // Panel de Administración - Sistema SaludPlus
    // Este proceso permite gestionar el inventario
    // de medicamentos: ver, agregar, editar y eliminar
    // ---------------------------------------------
	
    Definir opcion Como Entero
    Definir contadorID Como Entero
    contadorID <- 1
	
    // Arreglos para almacenar los medicamentos
    Dimension medicamentosID[100]         // ID del medicamento
    Dimension medicamentosNombre[100]     // Nombre del medicamento
    Dimension medicamentosStock[100]      // Stock de unidades disponibles
	
    // Variables para manejo del inventario
    Definir medicamentosID, medicamentosStock Como Entero
    Definir medicamentosNombre Como Cadena
    Definir totalMedicamentos Como Entero
    totalMedicamentos <- 0
	
    Repetir
        Limpiar Pantalla
        // Menú Principal
        Escribir "======================================="
        Escribir " PANEL DE ADMINISTRACION - SALUDPLUS"
        Escribir "======================================="
        Escribir "1. Ver Inventario"
        Escribir "2. Agregar Medicamento"
        Escribir "3. Editar Medicamento"
        Escribir "4. Eliminar Medicamento"
        Escribir "0. Salir"
        Escribir "Seleccione una opcion:"
        Leer opcion
		
        Segun opcion Hacer
			
				// ------------------------------------------
				// OPCIÓN 1: Mostrar todos los medicamentos
				// ------------------------------------------
            1:
                Limpiar Pantalla
                Escribir "------ INVENTARIO DE MEDICAMENTOS ------"
                Si totalMedicamentos = 0 Entonces
                    Escribir "No hay medicamentos registrados."
                Sino
                    // Mostrar lista uno por uno
                    Para i <- 1 Hasta totalMedicamentos Con Paso 1
                        Escribir medicamentosID[i], " | ", medicamentosNombre[i], " | Stock: ", medicamentosStock[i]
                    FinPara
                FinSi
                Esperar Tecla
				
				// ------------------------------------------
				// OPCIÓN 2: Agregar nuevo medicamento
				// ------------------------------------------
            2:
                Limpiar Pantalla
                Escribir "------ AGREGAR MEDICAMENTO ------"
                Escribir "Ingrese nombre del medicamento:"
                Leer nombre
                Escribir "Ingrese stock disponible:"
                Leer stock
				
                // Registro del medicamento en los arreglos
                totalMedicamentos <- totalMedicamentos + 1
                medicamentosID[totalMedicamentos] <- contadorID
                medicamentosNombre[totalMedicamentos] <- nombre
                medicamentosStock[totalMedicamentos] <- stock
                contadorID <- contadorID + 1
				
                Escribir "Medicamento agregado exitosamente."
                Esperar Tecla
				
				// ------------------------------------------
				// OPCIÓN 3: Editar un medicamento existente
				// ------------------------------------------
            3:
                Limpiar Pantalla
                Escribir "------ EDITAR MEDICAMENTO ------"
                Escribir "Ingrese ID del medicamento a editar:"
                Leer idBuscar
                encontrado <- Falso
				
                // Búsqueda por ID
                Para i <- 1 Hasta totalMedicamentos Con Paso 1
                    Si medicamentosID[i] = idBuscar Entonces
                        encontrado <- Verdadero
                        Escribir "Nuevo nombre:"
                        Leer medicamentosNombre[i]
                        Escribir "Nuevo stock:"
                        Leer medicamentosStock[i]
                        Escribir "Medicamento actualizado correctamente."
                    FinSi
                FinPara
				
                Si encontrado = Falso Entonces
                    Escribir "Medicamento no encontrado."
                FinSi
				
                Esperar Tecla
				
				// ------------------------------------------
				// OPCIÓN 4: Eliminar medicamento del sistema
				// ------------------------------------------
            4:
                Limpiar Pantalla
                Escribir "------ ELIMINAR MEDICAMENTO ------"
                Escribir "Ingrese ID del medicamento a eliminar:"
                Leer idEliminar
                encontrado <- Falso
				
                Para i <- 1 Hasta totalMedicamentos Con Paso 1
                    Si medicamentosID[i] = idEliminar Entonces
                        encontrado <- Verdadero
						
                        // Se recorre de atrás hacia adelante para eliminar y mover datos
                        Para j <- i Hasta totalMedicamentos - 1 Con Paso 1
                            medicamentosID[j] <- medicamentosID[j+1]
                            medicamentosNombre[j] <- medicamentosNombre[j+1]
                            medicamentosStock[j] <- medicamentosStock[j+1]
                        FinPara
						
                        totalMedicamentos <- totalMedicamentos - 1
                        Escribir "Medicamento eliminado correctamente."
                        i <- totalMedicamentos
                    FinSi
                FinPara
				
                Si encontrado = Falso Entonces
                    Escribir "Medicamento no encontrado."
                FinSi
				
                Esperar Tecla
				
        FinSegun
		
    Hasta Que opcion = 0
	
    // Mensaje final del sistema
    Escribir "Saliendo del sistema..."
	
FinProceso
