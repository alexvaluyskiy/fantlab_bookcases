package FantlabBookcases::Service::BookcaseWork;
use common::sense;
use FantlabBookcases::Repository::BookcaseWork;

sub get_bookcase_works {
    my ($user_id, $bookcase_id) = @_;

    my $bookcases = FantlabBookcases::Repository::BookcaseWork::get_bookcase_works($user_id, $bookcase_id);
    return $bookcases;
}

sub get_bookcase_work {
    my ($bookcase_id, $bookcase_work_id) = @_;

    my $bookcase = FantlabBookcases::Repository::BookcaseWork::get_bookcase_work($bookcase_id, $bookcase_work_id);
    return $bookcase;
}

sub add_bookcase_work {
    my $bookcase_work = shift;

    my $bookcase_work_id = FantlabBookcases::Repository::BookcaseWork::add_bookcase_work($bookcase_work);
    return undef unless $bookcase_work_id;

    my $created_bookcase_work = FantlabBookcases::Repository::BookcaseWork::get_bookcase_work($bookcase_work->{bookcase_id}, $bookcase_work_id);
    return $created_bookcase_work;
}

sub update_bookcase_work {
    my $bookcase_work = shift;

    my $updated_bookcase_exists = FantlabBookcases::Repository::BookcaseWork::get_bookcase_work($bookcase_work->{bookcase_id}, $bookcase_work->{bookcase_work_id});
    return undef unless $updated_bookcase_exists->{bookcase_work_id};

    FantlabBookcases::Repository::BookcaseWork::update_bookcase_work($bookcase_work);
    return $bookcase_work;
}

sub delete_bookcase_work {
    my ($user_id, $bookcase_id, $bookcase_work_id) = @_;

    my $bookcase_work = FantlabBookcases::Repository::BookcaseWork::get_bookcase_work($bookcase_id, $bookcase_work_id);

    if ($bookcase_work) {
        FantlabBookcases::Repository::BookcaseWork::delete_bookcase_work($bookcase_id, $bookcase_work_id);
    }

    return 1;
}

1;
