const allSideMenu = document.querySelectorAll('#sidebar .side-menu.top li a');

allSideMenu.forEach(item=> {
	const li = item.parentElement;

	item.addEventListener('click', function () {
		allSideMenu.forEach(i=> {
			i.parentElement.classList.remove('active');
		})
		li.classList.add('active');
	})
});

// TOGGLE SIDEBAR
const menuBar = document.querySelector('#content nav .fa-solid');
const sidebar = document.getElementById('sidebar');

menuBar.addEventListener('click', function () {
	sidebar.classList.toggle('hide');
})

const searchButton = document.querySelector('#content nav form .form-input button');
const searchButtonIcon = document.querySelector('#content nav form .form-input button .fa-solid');
const searchForm = document.querySelector('#content nav form');

searchButton.addEventListener('click', function (e) {
	if(window.innerWidth < 576) {
		e.preventDefault();
		searchForm.classList.toggle('show');
		if(searchForm.classList.contains('show')) {
			searchButtonIcon.classList.replace('fa-bars', 'bx-x');
		} else {
			searchButtonIcon.classList.replace('bx-x', 'fa-bars');
		}
	}
})





if(window.innerWidth < 768) {
	sidebar.classList.add('hide');
} else if(window.innerWidth > 576) {
	searchButtonIcon.classList.replace('bx-x', 'fa-bars');
	searchForm.classList.remove('show');
}


window.addEventListener('resize', function () {
	if(this.innerWidth > 576) {
		searchButtonIcon.classList.replace('bx-x', 'fa-bars');
		searchForm.classList.remove('show');
	}
})



const switchMode = document.getElementById('switch-mode');

switchMode.addEventListener('change', function () {
	if(this.checked) {
		document.body.classList.add('dark');
	} else {
		document.body.classList.remove('dark');
	}
})

// Agrega un manejador de clic al documento para cerrar los menús abiertos
document.addEventListener('click', function (event) {
    const allMenus = document.querySelectorAll('.menu-options');
    allMenus.forEach((menu) => {
        if (menu.classList.contains('active')) {
            menu.classList.remove('active');
        }
    });
});

// Agrega un manejador de clic a los íconos para abrir y cerrar los menús
function toggleMenu(icon) {
    const menu = icon.nextElementSibling; // Obtén el menú siguiente al ícono
    if (menu.classList.contains('active')) {
        menu.classList.remove('active'); // Oculta el menú
    } else {
        // Oculta todos los menús antes de mostrar este
        const allMenus = document.querySelectorAll('.menu-options');
        allMenus.forEach((otherMenu) => {
            otherMenu.classList.remove('active');
        });

        menu.classList.add('active'); // Muestra el menú
    }

    // Evita que el clic en el ícono se propague y cierre el menú inmediatamente
    event.stopPropagation();
}

function eliminarEnfrentamiento(id) {
    console.log('Eliminar enfrentamiento llamado con id:', id);
    var xhr = new XMLHttpRequest();
    xhr.open("POST", 'http://localhost:8080/UTPSportsFest/eliminarEnfrentamiento', true); // Apunta al servlet
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.send('id=' + id);

    xhr.onload = function() {
        console.log('Respuesta recibida con estado:', xhr.status);
        if (xhr.status == 404) {
            // Recargar la página o actualizar la interfaz de usuario
            location.reload();
        }
    }
}



document.getElementById("AgregarEnfrentamientos").addEventListener("click", function() {
  window.location.href = "agregar_enfrentamientos.jsp";
});

document.querySelectorAll('.edit-icon').forEach(function(icon) {
    icon.addEventListener('click', function() {
        var enfrentamientoId = this.getAttribute('data-id');
        // Redirige al usuario a "editar_enfrentamiento.jsp" con el ID como parámetro
        window.location.href = 'editar_enfrentamientos.jsp?id=' + enfrentamientoId;
    });
});
