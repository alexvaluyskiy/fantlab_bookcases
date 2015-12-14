package FantlabBookcases::Service::Bookcase;
use common::sense;
use FantlabBookcases::Repository::Bookcase;

sub get_bookcases_list {
    my $user_id = shift;

    my $bookcases = FantlabBookcases::Repository::Bookcase::get_bookcases_list($user_id);
    return $bookcases;
}

sub get_bookcase {
    my $bookcase_id = shift;

    my $bookcase = FantlabBookcases::Repository::Bookcase::get_bookcase($bookcase_id);
    return $bookcase;
}

sub add_bookcase {
    my $bookcase = shift;

    my $bookcase_id = FantlabBookcases::Repository::Bookcase::add_bookcase($bookcase);
    return undef unless $bookcase_id;

    my $created_bookcase = FantlabBookcases::Repository::Bookcase::get_bookcase($bookcase_id);
    return $created_bookcase;
}

sub update_bookcase {
    my $bookcase = shift;

    my $bookcase_exists = FantlabBookcases::Repository::Bookcase::get_bookcase($bookcase->{bookcase_id});
    return undef unless $bookcase_exists->{bookcase_id};

    FantlabBookcases::Repository::Bookcase::update_bookcase($bookcase);
    return $bookcase;
}

sub delete_bookcase {
    my ($user_id, $bookcase_id) = @_;

    my $bookcase = FantlabBookcases::Repository::Bookcase::get_bookcase($bookcase_id);

    if ($bookcase) {
        FantlabBookcases::Repository::Bookcase::delete_bookcase($user_id, $bookcase_id);
    }

    return 1;
}

1;
