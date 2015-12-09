package FantlabBookcases;
use Mojo::Base 'Mojolicious';

our $VERSION = '1.0.0';

sub startup {
    my $app = shift;

    # Documentation browser under "/perldoc"
    $app->plugin('PODRenderer');

    # Normal route to controller
    $app->routes->get('/')->to('bookcase#index');

    my $route = $app->routes->under('/v1');
    $route->route('/bookcases')->via('GET')->to('bookcase#index')->name('bookcase_index');
    $route->route('/bookcases/:bookcase_id', bookcase_id => qr/\d+/)->via('GET')->to('bookcase#view')->name('bookcase_view');
    $route->route('/bookcases')->to('bookcase#add')->via('POST')->name('bookcase_add');
    $route->route('/bookcases/:bookcase_id', bookcase_id => qr/\d+/)->via('PUT')->to('bookcase#edit')->name('bookcase_edit');
    $route->route('/bookcases/:bookcase_id', bookcase_id => qr/\d+/)->via('DELETE')->to('bookcase#delete')->name('bookcase_delete');

    $route->route('/bookcases/:bookcase_id/works', bookcase_id => qr/\d+/)->via('GET')
        ->to('BookcaseWork#index')
        ->name('bookcasework_index');
    $route->route('/bookcases/:bookcase_id/works/:bookcase_work_id', bookcase_id => qr/\d+/, bookcase_work_id => qr/\d+/)->via('GET')
        ->to('BookcaseWork#view')
        ->name('bookcasework_view');
    $route->route('/bookcases/:bookcase_id/works', bookcase_id => qr/\d+/)->via('POST')
        ->to('BookcaseWork#add')
        ->name('bookcasework_add');
    $route->route('/bookcases/:bookcase_id/works/:bookcase_work_id', bookcase_id => qr/\d+/, bookcase_work_id => qr/\d+/)->via('PUT')
        ->to('BookcaseWork#edit')
        ->name('bookcasework_edit');
    $route->route('/bookcases/:bookcase_id/works/:bookcase_work_id', bookcase_id => qr/\d+/, bookcase_work_id => qr/\d+/)->via('DELETE')
        ->to('BookcaseWork#delete')
        ->name('bookcasework_delete');

    # TODO: workaround for CORS, use SecureCORS instead
    $app->hook( before_dispatch => sub {
        my $c = shift;
        $c->res->headers->header( 'Access-Control-Allow-Origin' => '*' );
        $c->res->headers->header( 'Access-Control-Allow-Methods' => 'GET, PUT, POST, DELETE, OPTIONS' );
        $c->res->headers->header( 'Access-Control-Max-Age' => 3600 );
    });
}

1;
