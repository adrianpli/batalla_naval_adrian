@extends('layout.main')

@section('titulo')
    <title>Menu | Batalla Naval</title>
@endsection

@section('css')

@endsection

@section('titulo-pagina')
    <h1 class="h3 mb-4 text-gray-800">{{session('usuario')->correo}}</h1>
@endsection

@section('contenido')
    <form action="{{route('editar.form')}}" method="post">
        {{csrf_field()}}
        <h1 style="text-align: center">Editar datos</h1>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">ID de usuario</label>
            <input type="text"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" readonly value="{{session('usuario') -> id}}" name="idedit">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Correo</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="correoeditar" value="{{session('usuario') -> correo}}">
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Contraseña</label>
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Ingresa la contraseña" name="contraeditar">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Fecha de registro</label>
            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" readonly value="{{session('usuario') -> created_at}}">
        </div>
        <center>
        <button type="submit" class="btn btn-warning">Editar <i class="fas fa-pencil-alt"></i></button>
        </center>
    </form>

    <form action="{{route('eliminar.form')}}" method="post">
        {{csrf_field()}}
<h1 style="text-align: center">Eliminar cuenta</h1>
        <h5 style="text-align: center">¿Estas seguro de que quieres eliminar tu cuenta? Todos tus progresos se perderan</h5>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">ID de usuario</label>
            <input type="text"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" readonly value="{{session('usuario') -> id}}" name="iddelete">
        </div>

        <center>
            <button type="submit" class="btn btn-danger">Eliminar cuenta <i class="fas fa-trash"></i></button>
        </center>
    </form>
@endsection

@section('js')

@endsection

