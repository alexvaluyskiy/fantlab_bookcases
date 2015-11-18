package FantlabBookcases::Controller::Bookcase;
use Mojo::Base 'Mojolicious::Controller';
use FantlabBookcases::Service::Bookcase;

sub index {
    my $c = shift;
    my $user_id = $c->stash('user_id') || 1;

    my $bookcases = FantlabBookcases::Service::Bookcase::get_bookcases_list($user_id);

    $c->render(json => $bookcases);
}

sub view {
    my $c = shift;
    my $bookcase_id = $c->stash('bookcase_id');
    my $user_id = $c->stash('user_id') || 1;

    my $bookcase = FantlabBookcases::Service::Bookcase::get_bookcase($user_id, $bookcase_id);

    $c->render(json => $bookcase);
}

sub add {
    my $c = shift;

    my $bookcase = {
        name => $c->stash('name'),
        description => $c->stash('description'),
        user_id => $c->stash('user_id') || 1
    };

    my $created_bookcase = FantlabBookcases::Service::Bookcase::add_bookcase($bookcase);

    $c->res->headers->location("/v1/bookcases/" + $created_bookcase->{bookcase_id});
    $c->render(json => $created_bookcase, status => 201);
}

sub edit {
    my $c = shift;

    my $bookcase = {
        bookcase_id => $c->stash('bookcase_id'),
        name => $c->stash('name'),
        description => $c->stash('description'),
        user_id => $c->stash('user_id') || 1
    };

    my $updated_bookcase = FantlabBookcases::Service::Bookcase::update_bookcase($bookcase);

    $c->render(json => $updated_bookcase);
}

sub delete {
    my $c = shift;
    my $bookcase_id = $c->stash('bookcase_id');
    my $user_id = $c->stash('user_id') || 1;

    FantlabBookcases::Service::Bookcase::delete_bookcase($user_id, $bookcase_id);

    $c->render(text => "empty", status => 204);
}

1;
