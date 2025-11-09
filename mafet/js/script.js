// Inventario guardado en localStorage
let medicamentos = JSON.parse(localStorage.getItem("medicamentos")) || [];

// Referencias
const tabla = document.getElementById("tablaMedicamentos");
const inputNombre = document.getElementById("nuevoNombre");
const inputStock = document.getElementById("nuevoStock");
const mensaje = document.getElementById("mensaje-agregar");
const btnAgregar = document.getElementById("btnAgregarMed");

// Mostrar medicamentos en la tabla
function cargarMedicamentos() {
  tabla.innerHTML = "";
  medicamentos.forEach((med, index) => {
    tabla.innerHTML += `
      <tr>
        <td>${med.nombre}</td>
        <td class="${med.stock <= 5 ? 'text-danger fw-bold' : ''}">
          ${med.stock}
        </td>
        <td>
          <button class="btn btn-info btn-sm" onclick="editarMedicamento(${index})">✏️ Editar</button>
          <button class="btn btn-danger btn-sm" onclick="eliminarMedicamento(${index})">🗑️ Eliminar</button>
        </td>
      </tr>
    `;
  });
}

// Guardar en localStorage
function guardar() {
  localStorage.setItem("medicamentos", JSON.stringify(medicamentos));
}

// Agregar
btnAgregar.addEventListener("click", () => {
  const nombre = inputNombre.value.trim();
  const stock = parseInt(inputStock.value);

  if (!nombre || stock < 0 || isNaN(stock)) {
    mensaje.innerHTML = '<span class="text-danger">❌ Ingresa datos válidos</span>';
    setTimeout(() => mensaje.innerHTML = "", 2000);
    return;
  }

  medicamentos.push({ nombre, stock });
  guardar();
  cargarMedicamentos();

  mensaje.innerHTML = '<span class="text-success">✅ Medicamento agregado</span>';
  setTimeout(() => mensaje.innerHTML = "", 2000);

  inputNombre.value = "";
  inputStock.value = "";
});

// Editar
window.editarMedicamento = function (index) {
  const nuevoNombre = prompt("Nuevo nombre:", medicamentos[index].nombre);
  const nuevoStock = prompt("Nuevo stock:", medicamentos[index].stock);

  if (nuevoNombre && nuevoStock >= 0 && !isNaN(nuevoStock)) {
    medicamentos[index].nombre = nuevoNombre;
    medicamentos[index].stock = parseInt(nuevoStock);
    guardar();
    cargarMedicamentos();
  }
};

// Eliminar
window.eliminarMedicamento = function (index) {
  if (confirm("¿Seguro que quieres eliminarlo?")) {
    medicamentos.splice(index, 1);
    guardar();
    cargarMedicamentos();
  }
};

// Inicialización
cargarMedicamentos();
