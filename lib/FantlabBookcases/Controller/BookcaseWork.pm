package FantlabBookcases::Controller::BookcaseWork;
use Mojo::Base 'Mojolicious::Controller';
use FantlabBookcases::Service::BookcaseWork;

sub index {
    my $c = shift;
    my $bookcase_id = $c->stash('bookcase_id');
    my $user_id = $c->stash('user_id') || 1;

    my $bookcase_works = FantlabBookcases::Service::BookcaseWork::get_bookcase_works($user_id, $bookcase_id);

    $c->render(json => $bookcase_works);
}

sub view {
    my $c = shift;
    my $bookcase_id = $c->stash('bookcase_id');
    my $user_id = $c->stash('user_id') || 1;
    my $bookcase_work_id = $c->stash('bookcase_work_id') || 1;

    my $bookcase_work = FantlabBookcases::Service::BookcaseWork::get_bookcase_work($user_id, $bookcase_id, $bookcase_work_id);

    $c->render(json => $bookcase_work);
}

sub add {
    my $c = shift;

    my $bookcase_work = {
        bookcase_id => $c->stash('bookcase__id'),
        name => $c->stash('name'),
        description => $c->stash('description'),
        user_id => $c->stash('user_id') || 1
    };

    my $created_bookcase_work = FantlabBookcases::Service::BookcaseWork::add_bookcase_work($bookcase_work);

    $c->res->headers->location("/v1/bookcases/4/works");
    $c->render(json => $created_bookcase_work, status => 201);
}

sub edit {
    my $c = shift;

    my $bookcase_work = {
        bookcase_work_id => $c->stash('bookcase_work_id'),
        bookcase_id => $c->stash('bookcase_id'),
        name => $c->stash('name'),
        description => $c->stash('description'),
        user_id => $c->stash('user_id') || 1
    };

    my $updated_bookcase_work = FantlabBookcases::Service::BookcaseWork::update_bookcase_work($bookcase_work);

    $c->render(json => $updated_bookcase_work);
}

sub delete {
    my $c = shift;
    my $bookcase_id = $c->stash('bookcase_id');
    my $user_id = $c->stash('user_id') || 1;
    my $bookcase_work_id = $c->stash('bookcase_work_id') || 1;

    FantlabBookcases::Service::BookcaseWork::delete_bookcase_work($user_id, $bookcase_id, $bookcase_work_id);

    $c->render(text => "empty", status => 204);
}

1;
