@extends('layout.app', ['current' => 'novocliente'])

@section('title', 'Cadastro Cliente')

@section('body')
    <div class="row">
        <div class="container col-md-8 offset-md2">
            <div class="card border">
                <div class="card-header">
                    <div class="card-title">
                        Clientes cadastrados
                    </div>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-hover" id="tabelaprodutos">
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Nome</th>
                                <th>Endereço</th>
                                <th>Idade</th>
                                <th>Email</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($clientes as $c)
                                <tr>
                                    <td>{{ $c->id }} </td>
                                    <td>{{ $c->nome }} </td>
                                    <td>{{ $c->endereco }} </td>
                                    <td>{{ $c->idade }} </td>
                                    <td>{{ $c->email }} </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection
