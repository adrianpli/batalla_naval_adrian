@extends('layout.main')

@section('titulo')
    <title>Tablero: {{$tablero->codigo}} | Batalla Naval</title>
@endsection

@section('css')

@endsection
<style type="text/css">
    .barco {
        margin-top: 2%;
    }
</style>
@section('titulo-pagina')
    <h1 class="h3 mb-4 text-gray-800">Tablero #{{$tablero->codigo}}</h1>
    Creado: {{$tablero->created_at}}
    <p class="mb-4">Instrucciones de juego
    </p>
    @if($tablero->estatus == "jugando")
               <h3 class="text-center text-info"><b>Turno del jugador: {{$nombreTirador}}</b></h3>
    @endif
    @if($tablero -> estatus == "Finalizado")
        <h3 class="text-center text-info"><b>Capitan vencedor {{$ganador}}</b></h3>
    @endif
    <!-- Content Row -->
    <div class="row  bg-agua">
        <input type="hidden" id="usuario-id" value="{{session('usuario')->id}}">
        <!-- Second Column -->
        <div class="col-lg-4 offset-1 ">

            <!-- Background Gradient Utilities -->
            <div class="card shadow mb-4 bg-transparent">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Tablero de: {{session('usuario')->correo}}</h6>

                                       @if(!isset($tableroBarco))

                                                <label style="margin-top: 5%;" class="text-info">Cantidad de Barcos: <b id="cantidadBarcos">3</b></label>

                                                <input type="hidden" id="barcos-listos" value="0">

                                            @else

                                               <input type="hidden" id="barcos-listos" value="1">

                                           @endif
                </div>
                <div class="card-body text-center bg-transparent">

                                        @for($x = 1; $x <= 12; $x++)
                                                @if(isset($tableroBarco))
                                                        @if($tableroBarco->barco1 == $x || $tableroBarco->barco2 == $x || $tableroBarco->barco3 == $x)
                                @php $estatus = "bg-gradient-success" @endphp
                                                            @else
                                  @php $estatus = "bg-gradient-primary" @endphp
                                                           @endif
                                                        @if(in_array($x,$informacionJugador1["tirosFallados"]))
                                                                @php $estatus = "bg-gradient-info" @endphp
                                                            @endif
                                                            @if(in_array($x,$informacionJugador1["tirosHundidos"]))
                                                                @php $estatus = "bg-gradient-danger" @endphp
                                                            @endif
                                                            <button valorBarco="{{$x}}" class="barco  btn-barco bg-barco text-white px-2 py-3 {{$estatus}} ">Barco {{$x}}</button>
                                                   @else
                                                        <button valorBarco="{{$x}}" class="barco btn-barco bg-barco text-white px-2 py-3 bg-gradient-primary text-dark">Barco {{$x}}</button>
                                                    @endif
                                            @endfor
                                        <hr>
                                           @if(!isset($tableroBarco))
                                                   <button class="bg-gradient-info form-control text-white" id="jugador-1-listo">¡Estoy listo!</button>
                                               @elseif(!isset($tableroBarco2))
                                                   <button class="bg-gradient-info form-control text-white" id="buscar-enemigo">¡BUSCAR ENEMIGO!</button>
                                               @endif
               </div>
            </div>
        </div>
        <!-- Second Column -->
        <!-- Second Column -->
        <div class="col-lg-4 offset-2">
            <!-- Background Gradient Utilities -->
            <div class="card shadow mb-4 bg-transparent">
                <div class="card-header py-3">
                    @if(isset($tableroBarco2))
                                               <h6 class="m-0 font-weight-bold text-primary">Tablero de jugador: <b>{{$tableroBarco2->nombreUsuario}}</b></h6>
                                           @else
                                               <h6 class="m-0 font-weight-bold text-primary"><b>Sin Rival</b></h6>
                                           @endif
                </div>
                <div class="card-body text-center">
                    @php $estatus = "bg-gradient-primary" @endphp
                    @for($x = 1; $x <= 12; $x++)
                        @if(isset($tableroBarco2))
                            @if($tableroBarco2->barco1 == $x || $tableroBarco2->barco2 == $x || $tableroBarco2->barco3 == $x)
                            @else
                                @php $estatus = "bg-gradient-primary" @endphp
                            @endif
                            @if(in_array($x,$informacionJugador1["tirosFallados"]))
                                    @php $estatus = "bg-gradient-info" @endphp
                                @endif
                                @if(in_array($x,$informacionJugador1["tirosHundidos"]))
                                    @php $estatus = "bg-gradient-danger" @endphp
                                @endif
                                <button valorBarco="{{$x}}" class="barco bg-barco text-white btn-barco px-2 py-3 {{$estatus}} text-white">Barco {{$x}}</button>@endif
                    @endfor
                </div>
            </div>
                       <!-- Link to open the modal -->
                    </div>
            </div>
        <!-- Modal -->
        <div class="modal fade" id="buscar-rival" role="dialog">
                <div class="modal-dialog">
                        <!-- Modal content-->
                        <div class="modal-content">
                                <div class="modal-body text-center">
                                        <p class="text-center">Buscando Rival.</p>
                                        <img src="/img/cargando.gif">
                                    </div>
                            </div>
        </div>
    </div>
@endsection

@section('contenido')

@endsection

@section('js')
    <script>

        $(document).ready(function (){

            var idUsuario = $("#usuario-id").val();

            // -- Verificar si el jugador ya tiene barcos
            $("#buscar-enemigo").click( function (){
                empezar();
            });

            var barcosDisponibles = 3;
            var conjuntoBarcos = [];
            var estatusTablero = "{{$tablero->estatus}}";

            $(".btn-barco").click(function (){
                               var idBarco = $(this).attr('valorBarco');
                                if(estatusTablero == "jugando"){
                                        tirar(idBarco);
                                    }
                if($("#barcos-listos").val() == 1){
                    return false;
                }

                if(barcosDisponibles > 0){
                    if($(this).hasClass("border border-success")){
                        return false;
                    }
                                            if($.inArray(idBarco,conjuntoBarcos)){
                            conjuntoBarcos.push(idBarco);
                            barcosDisponibles--;
                            $("#cantidadBarcos").html(barcosDisponibles);
                            $(this).addClass('border border-success');
                        }
                                        }else {
                        alert("Ya no cuentas con barcos disponibles")
                    }
                });

            $("#jugador-1-listo").click(function (){

                if(barcosDisponibles == 0){
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        type: "get",
                        url: "{{route('tablero.agregar.barcos')}}/{{$tablero->codigo}}/"+conjuntoBarcos,
                        dataType: 'json',
                        cache: false,
                        success: function (data) {
                            location.reload();
                        }
                    });
                }else{
                    alert("Aún tienes barcos disponibles");
                }
            });
            function empezar(){
                $("#buscar-rival").modal('show');
                buscarJugador();
            }
            function buscarJugador(){
                location.reload();
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type: "get",
                    url: "{{route('tablero.consultar.barcos')}}/{{$tablero->codigo}}",
                    dataType: 'json',
                    cache: false,
                    success: function (data) {

                        console.log(data);
                        var posicionesBarcos = data.posicionesBarcos;
                        $.each( posicionesBarcos, function( key, value ) {
                            if(value.usuario_id != idUsuario){
                                location.reload();
                            }else{
                                $("#buscar-rival").modal('hide');
                                //alert("Intenta buscar nuevamente");
                            }
                        });
                    }
                });
            }

                           function tirar(idBarco){
                                   var posicion = idBarco;
                                    $.ajax({
                                            headers: {
                                               'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                                           },
                                        type: "get",
                                            url: "{{route('tablero.tirar.barco')}}/{{$tablero->codigo}}/"+posicion,
                                            dataType: 'json',
                                            cache: false,
                                           success: function (data) {

                                                if(data.estatus == "success"){

                                                        alert(data.mensaje);
                                                        location.reload();
                                                    }else{
                                                       alert(data.mensaje);
                                                        location.reload();
                                                   }
                                            }
                                   });
                               }
        });

    </script>
@endsection

