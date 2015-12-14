package FantlabBookcases::Repository::BookcaseWork;
use common::sense;
use Mojo::Redis2;

my $redis = Mojo::Redis2->new;

sub get_bookcase_works {
    my $bookcase_id = shift;

    my $keys = $redis->hkeys("bookcase_work=bookcase=$bookcase_id");

    my @bookcase_works = ();
    foreach my $key (@$keys) {
      # TODO: workaround for Mojo::Redis2->hgetall bug
      my $fields = $redis->hkeys($key);
      my $bookcase_work;
      foreach my $field (@$fields) {
        $bookcase_work->{$field} = $redis->hget($key, $field);
      }
      push(@bookcase_works, $bookcase_work);
    }

    return \@bookcase_works;
}

sub get_bookcase_work {
    my ($bookcase_id, $bookcase_work_id) = @_;

    # TODO: workaround for Mojo::Redis2->hgetall bug
    my $fields = $redis->hkeys("bookcase_work=$bookcase_work_id");
    my $bookcase_work;
    foreach my $field (@$fields) {
      $bookcase_work->{$field} = $redis->hget("bookcase_work=$bookcase_work_id", $field);
    }

    return $bookcase_work;
}

sub add_bookcase_work {
    my $bookcase_work = shift;

    # generate a new id
    my $new_id = $redis->incr('bookcase_work=identity');
    my $id_key = "bookcase_work=$new_id";
    $bookcase_work->{bookcase_work_id} = $new_id;

    # insert a bookcase work
    $redis->hmset($id_key, %$bookcase_work);

    # create an index for the user_id
    $redis->hset("bookcase_work=bookcase=$bookcase_work->{bookcase_id}", $id_key, 1);

    return $new_id;
}

sub update_bookcase_work {
    my $bookcase_work = shift;

    $redis->hmset("bookcase_work=$bookcase_work->{bookcase_work_id}", $bookcase_work);

    return 1;
}

sub delete_bookcase_work {
    my ($bookcase_id, $bookcase_work_id) = @_;

    # delete a bookcase work
    $redis->del("bookcase_work=$bookcase_work_id");

    # delete from user index
    $redis->hdel("bookcase_work=bookcase=$bookcase_id", $bookcase_work_id);

    return 1;
}

1;
