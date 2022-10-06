var username = new URL(location.href).searchParams.get("username");
var user;

$(document).ready(function () {
    
    
    fillUsuario().then(function() {
        
        
        getSeleccionadas(user.username);
           
    });

    $("#reservar-btn").attr("href", 'home.html?username=${username}' );

    $("#form-modificar").on("submit", function (event) {
   
        event.preventDefault();
        modificarUsuario;
    });

    $("#aceptar-eliminar-cuenta-btn").click(function () {
    
        eliminarCuenta().then(function () {
            location.href = "login.html";
    });
});

});

async function fillUsuario() {
    await $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletUsuarioPedir",
        data: $.param({
            username: username
        }),
        success: function (result){
            let parsedResult = JSON.parse(result);
        
            if(parsedResult !=false) {
                user = parsedResult;
            
                $("#input-username").val(parsedResult.username);
                $("#input-contrasena").val(parsedResult.password);
                $("#input-nombre").val(parsedResult.nombres);
                $("#input-apellidos").val(parsedResult.apellidos);
                $("#input-email").val(parsedResult.email);
            } else {
                console.log("Error recuperando los datos del usuario");
            }
        }    
    });
}

function getSeleccionadas(username) {


    $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletSeleccionarListar",
        data: $.param({
            username: username,
        }),
        success: function (result) {
            let parsedResult = JSON.parse(result);

            if (parsedResult != false) {

                mostrarHistorial(parsedResult)

            } else {
                console.log("Error recuperando los datos de las reservas");
            }
        }
    });
}

function mostrarHistorial(libros){
    let contenido = "";
    if (libros.length >=1) {
        $.each(libros, function (index,libro) {
            libro = JSON.parse(libro);
            
            contenido += '<tr><th scope="row">' + libro.id + '</th>' +
                    '<td>' + libro.titulo + '</td>' +
                    '<td>' + libro.categoria + '</td>' +
                    '<td><button id="devolver-btn" onclick="devolverLibro(' + libro.id
                    + ');" class="btn btn-danger">Delvolver</button></td></tr>';
        });

        $("#historial-tbody").html(contenido);
        $("#historial-table").removeClass("d-none");
        $("#historial-vacio").addClass("d-none");

    } else {
        $("#historial-vacio").removeClass("d-none");
        $("#historial-table").addClass("d-none");
    }
    
}


function modificarUsuario() {

    let username = $("#input-username").val();
    let password = $("#input-contrasena").val();
    let nombres = $("#input-nombre").val();
    let apellidos = $("#input-apellidos").val();
    let email = $("#input-email").val();
    $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletUsuarioModificar",
        data: $.param({
            username: username,
            password: password,
            nombres: nombres,
            apellidos: apellidos,
            email: email,
        }),
        success: function (result) {

            if (result != false) {
                $("#modificar-error").addClass("d-none");
                $("#modificar-exito").removeClass("d-none");
            } else {
                $("#modificar-error").removeClass("d-none");
                $("#modificar-exito").addClass("d-none");
            }

            setTimeout(function () {
                location.reload();
            }, 3000);

        }
    });

}

async function eliminarCuenta() {

    await $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletUsuarioEliminar",
        data: $.param({
            username: username
        }),
        success: function (result) {

            if (result != false) {

                console.log("Usuario eliminado")

            } else {
                console.log("Error eliminando el usuario");
            }
        }
    });
}