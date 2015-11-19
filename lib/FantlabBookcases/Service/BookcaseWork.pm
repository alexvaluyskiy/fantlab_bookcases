package FantlabBookcases::Service::BookcaseWork;
use common::sense;
use FantlabBookcases::Repository::BookcaseWork;

sub get_bookcase_works {
    my ($user_id, $bookcase_id) = @_;

    my $bookcases = FantlabBookcases::Repository::BookcaseWork::get_bookcase_works($user_id, $bookcase_id);

    return $bookcases;
}

sub get_bookcase_work {
    my ($user_id, $bookcase_id, $bookcase_work_id) = @_;

    my $bookcase = FantlabBookcases::Repository::BookcaseWork::get_bookcase_work(
        $user_id,
        $bookcase_id,
        $bookcase_work_id);

    return $bookcase;
}

sub add_bookcase_work {
    my $bookcase_work = shift;

    my $bookcase_work_id = FantlabBookcases::Repository::BookcaseWork::add_bookcase_work($bookcase_work);

    my $created_bookcase_work = FantlabBookcases::Repository::BookcaseWork::get_bookcase_work(
        $bookcase_work->{user_id},
        $bookcase_work->{bookcase_id},
        $bookcase_work_id);

    return $created_bookcase_work;
}

sub update_bookcase_work {
    my $bookcase_work = shift;

    my $bookcase_work_id = FantlabBookcases::Repository::BookcaseWork::update_bookcase_work($bookcase_work);

    my $updated_bookcase_work = FantlabBookcases::Repository::BookcaseWork::get_bookcase_work(
        $bookcase_work->{user_id},
        $bookcase_work->{bookcase_id},
        $bookcase_work_id);

    return $updated_bookcase_work;
}

sub delete_bookcase_work {
    my ($user_id, $bookcase_id, $bookcase_work_id) = @_;

    my $bookcase_work = FantlabBookcases::Repository::BookcaseWork::get_bookcase_work(
        $user_id,
        $bookcase_id,
        $bookcase_work_id);

    if ($bookcase_work) {
        FantlabBookcases::Repository::BookcaseWork::delete_bookcase_work($user_id, $bookcase_id, $bookcase_work_id);
    }

    return 1;
}

1;