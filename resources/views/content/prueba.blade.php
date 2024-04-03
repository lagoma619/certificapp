@extends('layouts.app')

@section('content')
<body>
  <div class="container mt-5">
    <h1>Cargar relación de retenciones
    </h1>
    <form action="" method="post" enctype="multipart/form-data">
      <div class="mb-3">
        <label for="archivoExcel" class="form-label">Selecciona un archivo de Excel</label>
        <input class="form-control" type="file" id="archivoExcel" name="archivoExcel" accept=".xlsx, .xls">
      </div>
      <button type="submit" class="btn btn-primary">Buscar archivo</button>
    </form>
  </div>

@endsection