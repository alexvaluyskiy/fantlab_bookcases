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
    $route->get('/bookcases')->to('bookcase#index');
    $route->get('/bookcases/:bookcase_id')->to('bookcase#view');
    $route->post('/bookcases')->to('bookcase#add');
    $route->put('/bookcases/:bookcase_id')->to('bookcase#edit');
    $route->delete('/bookcases/:bookcase_id')->to('bookcase#delete');
}

1;
