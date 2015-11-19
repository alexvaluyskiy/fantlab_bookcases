package FantlabBookcases;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
    my $self = shift;

    # Documentation browser under "/perldoc"
    $self->plugin('PODRenderer');

    # Router
    my $r = $self->routes;

    # Normal route to controller
    $r->get('/')->to('bookcase#index');

    my $route = $self->routes->under('/v1');
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
}

1;
